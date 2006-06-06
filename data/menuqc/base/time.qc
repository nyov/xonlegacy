// NG-Menu
// base/time.qc
// * base/timer.qc

float _Time_Last;

void() Time_Init =
{
	Time_Current = gettime();
	Time_Delta = 0.0;
};

void() Time_Update =
{
	_Time_Last = Time_Current;
	Time_Current = gettime();
	Time_Delta = Time_Current - _Time_Last;
};

void() Time_Quit =
{
};

