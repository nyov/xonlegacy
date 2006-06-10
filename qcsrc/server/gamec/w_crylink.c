
.float gravity;
const vector proj_color = '1 1 1';

.entity realowner;
void W_Crylink_Touch (void)
{
	if (trace_dphitq3surfaceflags & Q3SURFACEFLAG_NOIMPACT)
	{
		remove(self);
		return;
	}
	RadiusDamage (self, self.realowner, cvar("g_balance_crylink_primary_damage"), cvar("g_balance_crylink_primary_edgedamage"), cvar("g_balance_crylink_primary_radius"), world, cvar("g_balance_crylink_primary_force"), IT_CRYLINK);
	te_gunshotquad(self.origin);
	remove (self);
	/*
	//te_smallflash(self.origin);
	if (other.takedamage == DAMAGE_AIM)
	{
		remove (self);
		return;
	}
	self.owner = world;
	self.touch = SUB_Null;
	setmodel (self, "models/plasma.mdl");
	setsize (self, '0 0 0', '0 0 0');
	self.gravity = 0;
	self.glow_size = 0;
	self.glow_color = 0;
	self.think = SUB_Remove;
	self.movetype = MOVETYPE_NONE;
	self.effects = EF_FULLBRIGHT | EF_LOWPRECISION;
	SUB_SetFade(self, time, 1);
	//remove (self);
	*/
}

void W_Crylink_Touch2 (void)
{
	if (trace_dphitq3surfaceflags & Q3SURFACEFLAG_NOIMPACT)
	{
		remove(self);
		return;
	}
	RadiusDamage (self, self.realowner, cvar("g_balance_crylink_secondary_damage"), cvar("g_balance_crylink_secondary_edgedamage"), cvar("g_balance_crylink_secondary_radius"), world, cvar("g_balance_crylink_secondary_force"), IT_CRYLINK);
	te_gunshotquad(self.origin);
	remove (self);
	/*
	//te_smallflash(self.origin);
	if (other.takedamage == DAMAGE_AIM)
	{
		remove (self);
		return;
	}
	self.owner = world;
	self.touch = SUB_Null;
	setmodel (self, "models/plasma.mdl");
	setsize (self, '0 0 0', '0 0 0');
	self.gravity = 0;
	self.glow_size = 0;
	self.glow_color = 0;
	self.think = SUB_Remove;
	self.movetype = MOVETYPE_NONE;
	self.effects = EF_FULLBRIGHT | EF_LOWPRECISION;
	SUB_SetFade(self, time, 1);
	//remove (self);
	*/
}

void W_Crylink_Attack (void)
{
	local float counter, shots;
	local entity proj;

	if (cvar("g_use_ammunition"))
		self.ammo_cells = self.ammo_cells - cvar("g_balance_crylink_primary_ammo");

	W_SetupShot (self, '24 7 -8', FALSE, 2, "weapons/crylink_fire.ogg");
	te_smallflash(w_shotorg);

	shots = cvar("g_balance_crylink_primary_shots");
	while (counter < shots)
	{
		proj = spawn ();
		proj.realowner = proj.owner = self;
		proj.classname = "spike";
		proj.bot_dodge = TRUE;
		proj.bot_dodgerating = cvar("g_balance_crylink_primary_damage");

		proj.movetype = MOVETYPE_BOUNCE;
		proj.solid = SOLID_BBOX;
		proj.gravity = 0.001;

		setmodel (proj, "models/plasmatrail.mdl");
		setsize (proj, '0 0 0', '0 0 0');
		setorigin (proj, w_shotorg);

		proj.velocity = (w_shotdir + randomvec() * cvar("g_balance_crylink_primary_spread")) * cvar("g_balance_crylink_primary_speed");
		proj.touch = W_Crylink_Touch;
		proj.think = SUB_Remove;
		proj.nextthink = time + cvar("g_balance_crylink_primary_lifetime");

		proj.angles = vectoangles (proj.velocity);

		//proj.glow_size = 20;

		proj.effects = EF_NOSHADOW | EF_FULLBRIGHT | EF_LOWPRECISION;
		proj.flags = FL_PROJECTILE;
		proj.colormod = proj_color;
		counter = counter + 1;
	}
}

void W_Crylink_Attack2 (void)
{
	local float counter, shots;
	local entity proj;

	if (cvar("g_use_ammunition"))
		self.ammo_cells = self.ammo_cells - cvar("g_balance_crylink_secondary_ammo");

	W_SetupShot (self, '20 7 -8', FALSE, 2, "weapons/crylink_fire.ogg");
	te_smallflash(w_shotorg);

	shots = cvar("g_balance_crylink_secondary_shots");
	while (counter < shots)
	{
		proj = spawn ();
		proj.realowner = proj.owner = self;
		proj.classname = "spike";
		proj.bot_dodge = TRUE;
		proj.bot_dodgerating = cvar("g_balance_crylink_secondary_damage");

		proj.movetype = MOVETYPE_BOUNCE;
		proj.solid = SOLID_BBOX;
		proj.gravity = 0.001;

		setmodel (proj, "models/plasmatrail.mdl");
		setsize (proj, '0 0 0', '0 0 0');
		setorigin (proj, w_shotorg);

		proj.velocity = (w_shotdir + ((counter / shots) * 2 - 1) * v_right * cvar("g_balance_crylink_secondary_spread")) * cvar("g_balance_crylink_secondary_speed");
		proj.touch = W_Crylink_Touch2;
		proj.think = SUB_Remove;
		proj.nextthink = time + cvar("g_balance_crylink_secondary_lifetime");

		proj.angles = vectoangles (proj.velocity);

		//proj.glow_size = 20;

		proj.effects = EF_NOSHADOW | EF_FULLBRIGHT | EF_LOWPRECISION;
		proj.flags = FL_PROJECTILE;
		proj.colormod = proj_color;
		counter = counter + 1;
	}
}


/*
// experimental lightning gun
void W_Crylink_Attack3 (void)
{
	if (cvar("g_use_ammunition"))
		self.ammo_cells = self.ammo_cells - cvar("g_balance_crylink_primary_ammo");
	W_SetupShot(self, '10 5 -14', TRUE, 0, "weapons/crylink_fire.ogg");

	// use traceline_hitcorpse to make sure it can hit gibs and corpses too
	traceline_hitcorpse(self, w_shotorg, w_shotorg + w_shotdir * 1000, FALSE, self);

	te_smallflash(w_shotorg);
	te_plasmaburn(trace_endpos);
	te_lightning2(self, w_shotorg, trace_endpos);

	if (trace_fraction < 1)
		Damage(trace_ent, self, self, cvar("g_balance_crylink_primary_damage"), IT_CRYLINK, trace_endpos, '0 0 0');
}
*/

float(float req) w_crylink =
{
	if (req == WR_AIM)
		self.button0 = bot_aim(cvar("g_balance_crylink_primary_speed"), 0, cvar("g_balance_crylink_primary_lifetime"), FALSE);
	else if (req == WR_THINK)
	{
		if (self.button0)
		if (weapon_prepareattack(0, cvar("g_balance_crylink_primary_refire")))
		{
			W_Crylink_Attack();
			weapon_thinkf(WFRAME_FIRE1, cvar("g_balance_crylink_primary_animtime"), w_ready);
		}
		if (self.button3)
		if (weapon_prepareattack(1, cvar("g_balance_crylink_secondary_refire")))
		{
			W_Crylink_Attack2();
			weapon_thinkf(WFRAME_FIRE2, cvar("g_balance_crylink_secondary_animtime"), w_ready);
		}
	}
	else if (req == WR_SETUP)
		weapon_setup(WEP_CRYLINK, "crylink", IT_CELLS);
	else if (req == WR_CHECKAMMO1)
		return self.ammo_cells >= cvar("g_balance_crylink_primary_ammo");
	else if (req == WR_CHECKAMMO2)
		return self.ammo_cells >= cvar("g_balance_crylink_secondary_ammo");
	return TRUE;
};
