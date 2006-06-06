///////////////////////////////////////////////
// Menu Source File
///////////////////////
// This file belongs to dpmod/darkplaces
// AK contains all menu functions (especially the required ones)
///////////////////////////////////////////////

void() m_updategamestate =
{
	// update isserver and clientstate
	gamestatus = 0;
	if( isserver() )
		gamestatus = gamestatus | GAME_ISSERVER;
	if( clientstate() == CS_CONNECTED )
		gamestatus = gamestatus | GAME_CONNECTED;
	if( cvar("developer") )
		gamestatus = gamestatus | GAME_DEVELOPER;
};

void() m_init =
{
	Util_AltString_UnitTest();

	Time_Init();

	// init graphic
	Gfx_Init();

	// init cursor
	Cursor_Init();

	Key_Init();

	HostCache_Init();

	// init menu
	//Menu_Init();
};

// required menu functions
void( float pKey, float pAscii ) m_keydown =
{
	if( !menu_active )
		return;

	// actually the menu is the only system that needs to react on key events
	//Menu_Key( pKey, pAscii );
};

void() m_frame =
{
	Time_Update();

	HostCache_Update();

	Key_Update();

	// graphic frame
	Gfx_Update();

	// cursor frame
	Cursor_Update();

	// menu frame
	//Menu_Frame();
};

void() m_draw =
{
	m_updategamestate();


	if( !menu_active ) {
		// test whether we want to force it to be displayed
		if( !(gamestatus & GAME_CONNECTED) && !(gamestatus & GAME_DEVELOPER) && cvar_string( "menu_directmenu" ) != "" ) {
			m_display();
		}
		else {
			return;
		}
	}

	// call m_frame cause draw is the only menu function called once per frame
	m_frame();

	// now the drawing code
	//Menu_Draw();

	// draw the cursor on top of the menu
	Cursor_Draw();

	// and now the gfx drawing code (for special fx)
	Gfx_Draw();
};

void() m_display =
{
	menu_active = true;

	m_updategamestate();

	// let also the snd and gfx know (perhaps for sfx)
	Gfx_Display();
	Cursor_Display();
	Key_Display();

	// let the menu manager know
	//Menu_PerformReinit();
};

void() m_hide =
{
	Gfx_Hide();
	Cursor_Hide();
	Key_Hide();

	// let the menu manager know
	//Menu_Hide();

	menu_active = false;
};

void() m_toggle =
{
	Time_Update();

	if( menu_active )
		m_hide();
	else
		m_display();
};

void() m_shutdown =
{
	Time_Update();

	// shutdown menu
	//Menu_Shutdown();

	// shutdown timer
	Time_Quit();

	// shutdown key system
	Key_Quit();

	// shutdown cursor
	Cursor_Quit();

	// shutdown graphic
	Gfx_Quit();

	// make sure everything is reset
	setkeydest( KEY_GAME );
	setmousetarget( MT_CLIENT );
};