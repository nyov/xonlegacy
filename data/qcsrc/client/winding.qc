entity winding_pool;

entity entdup(entity e)
{
	entity e2;
	e2 = Pool_spawn(winding_pool);
	copyentity(e, e2);
	return e2;
}

entity AllocWinding(entity base)
{
	entity e;
	if(!winding_pool)
		winding_pool = Pool_Alloc();
	e = Pool_spawn(winding_pool);
	e.classname = "winding";
	e.sort_next = e;
	e.sort_prev = e;
	e.owner = e;
	if(base)
		e.winding_point_interpolate = base.winding_point_interpolate;
	return e;
}

void InsertIntoWinding(entity w, entity e)
{
	e.sort_next = w;
	e.sort_prev = w.sort_prev;
	e.sort_prev.sort_next = e;
	e.sort_next.sort_prev = e;
	e.owner = w.owner;
}

void DeleteFromWinding(entity p)
{
	p.sort_next.sort_prev = p.sort_prev;
	p.sort_prev.sort_next = p.sort_next;
	Pool_remove(winding_pool, p);
}

entity AllocPoint(entity w, vector o)
{
	entity e;
	if(!winding_pool)
		winding_pool = Pool_Alloc();
	e = Pool_spawn(winding_pool);
	e.classname = "winding_point";
	e.origin = o;
	e.owner = w;
	e.winding_cutpoint = 0;
	return e;
}

void ClearWinding(entity w)
{
	entity e;
	for(e = w.sort_next; e != w; )
	{
		e = e.sort_next;
		Pool_remove(winding_pool, e.sort_prev);
	}
	// now only w is left
	w.sort_next = w.sort_prev = w;
}

void FreeWinding(entity w)
{
	ClearWinding(w);
	Pool_remove(winding_pool, w);
}

entity CopyWinding(entity w)
{
	entity e, en, wn, pn;
	wn = entdup(w);
	pn = wn;
	for(e = w.sort_next; e != w; e = e.sort_next)
	{
		en = entdup(e);
		en.owner = wn;
		en.sort_prev = pn;
		pn = en;
	}
	wn.sort_prev = pn;
	wn.sort_prev.sort_next = wn;
	for(en = wn.sort_prev; en != wn; en = en.sort_prev)
		en.sort_prev.sort_next = en;
	return wn;
}

void ClipWindingEpsilon(entity w, vector norm, float dist, float epsilon, float want_sides)
{
	// algorithm from q3map2
	float counts_f, counts_b;
	entity p, p2, pnew;
	float i;
	float dot, d, d2;
	vector mid;

	for(i = 0, p = w.sort_next; p != w; ++i, p = p.sort_next)
	{
		dot = p.origin * norm - dist;
		if not(dot > epsilon) // we include the center case in both, as it IS simple, if it weren't for the is-this-a-cut-vertex distinction
			++counts_b;
		if not(dot < -epsilon)
			++counts_f;
	}

	if not(counts_f)
	{
		if(want_sides >= 0)
			clipwinding_front = AllocWinding(w);
		if(want_sides <= 0)
			clipwinding_back = CopyWinding(w);
		return;
	}
	if not(counts_b)
	{
		if(want_sides >= 0)
			clipwinding_front = CopyWinding(w);
		if(want_sides <= 0)
			clipwinding_back = AllocWinding(w);
		return;
	}
	
	if(want_sides >= 0)
		clipwinding_front = AllocWinding(w);
	if(want_sides <= 0)
		clipwinding_back = AllocWinding(w);

	for(i = 0, p = w.sort_next; p != w; ++i, p = p.sort_next)
	{
		p2 = p.sort_next;
		if(p2 == w)
			p2 = p2.sort_next;
		d = p.origin * norm - dist;
		d2 = p2.origin * norm - dist;
		if(d > epsilon) // front
		{
			// if the point started a cut, the new point starts
			// an edge too as it's a front-point
			if(want_sides >= 0)
				InsertIntoWinding(clipwinding_front, entdup(p));
			if not(d2 < -epsilon) // only if switching side
				continue;
		}
		else if(d < -epsilon) // back
		{
			// if the point started a cut, the new point starts
			// an edge too as it's a back-point
			if(want_sides <= 0)
				InsertIntoWinding(clipwinding_back, entdup(p));
			if not(d2 > epsilon) // only if switching side
				continue;
		}
		else // on
		{
			// if the point started a cut and it is ON the current
			// cut, then it only starts a cut on the side on which
			// the edge continues

			// point is for both windings
			if(want_sides >= 0)
			{
				pnew = entdup(p);
				if(d2 > epsilon) // next point is FRONT?
				{
					// then this point does not need to be a cut, unless it already was
					//pnew.winding_cutpoint = 0;
				}
				else if(d2 < -epsilon) // next point is BACK? then it's a cut until the point where it comes back
				{
					pnew.winding_cutpoint = 1;
				}
				else
				{
					// next point is SAME? the evil case, this may or may not be a cut
					//pnew.winding_cutpoint = 1;
				}
				InsertIntoWinding(clipwinding_front, pnew);
			}
			if(want_sides <= 0)
			{
				pnew = entdup(p);
				if(d2 > epsilon) // next point is FRONT? then it's a cut until the point where it comes back
				{
					pnew.winding_cutpoint = 1;
				}
				else if(d2 < -epsilon) // next point is BACK?
				{
					// then this point does not need to be a cut, unless it already was
					//pnew.winding_cutpoint = 0;
				}
				else
				{
					// next point is SAME?
					//pnew.winding_cutpoint = 1;
				}
				InsertIntoWinding(clipwinding_back, pnew);
			}
			continue;
		}
		// must... make... split... point
		dot = d / (d - d2);
		mid = (1 - dot) * p.origin + dot * p2.origin;
		pnew = AllocPoint(w, mid);
		if(w.winding_point_interpolate)
			w.winding_point_interpolate(w, pnew, p, p2, dot);

		pnew.winding_cutpoint = (d > epsilon);
		if(want_sides >= 0)
			InsertIntoWinding(clipwinding_front, pnew);
		if(want_sides <= 0)
		{
			if(want_sides >= 0)
				pnew = entdup(pnew);
			pnew.winding_cutpoint = (d < -epsilon);
			InsertIntoWinding(clipwinding_back, pnew);
		}
	}
}
