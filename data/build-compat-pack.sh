#!/bin/sh

# list of files v2.4.2 clients need to play on svn servers

COMPAT_FILES="
	effectinfo.txt
	gfx/aggressor_mini.tga
	gfx/aneurysm_mini.tga
	gfx/basementctf_mini.tga
	gfx/bleach_mini.tga
	gfx/bloodprisonctf_mini.tga
	gfx/bloodprison_mini.tga
	gfx/bluesky_mini.tga
	gfx/dieselpower_mini.tga
	gfx/dismal_mini.tga
	gfx/final_rage_mini.tga
	gfx/inv_weapon10.tga
	gfx/inv_weapon11.tga
	gfx/inv_weapon12.tga
	gfx/inv_weapon13.tga
	gfx/inv_weapon14.tga
	gfx/inv_weapon9.tga
	gfx/reslimed_mini.tga
	gfx/runningman_1on1remix_mini.tga
	gfx/runningmanctf_mini.tga
	gfx/runningman_mini.tga
	gfx/sb_flag_blue_shielded.tga
	gfx/sb_flag_red_shielded.tga
	gfx/sb_kh_full.tga
	gfx/sb_kh_outline.tga
	gfx/sb_playercolor_base.tga
	gfx/sb_playercolor_pants.tga
	gfx/sb_playercolor_shirt.tga
	gfx/silvercity_mini.tga
	gfx/stormkeep_mini.tga
	gfx/strength_mini.tga
	gfx/teamradar_icon_1.tga
	gfx/teamradar_icon_2.tga
	gfx/teamradar_ping.tga
	gfx/toxic_mini.tga
	gfx/warfare_mini.tga
	maps/eggandbacon.bsp
	models/ctf/flags.md3
	models/ctf/flags.md3_0.skin
	models/ctf/flags.md3_1.skin
    models/hlac_bullet.md3
    models/hlac_bullet.tga
	models/player/carni.zym.sounds
	models/player/headhunter.zym.sounds
	models/player/insurrectionist.zym.sounds
	models/player/lurk.zym.sounds
	models/player/lycanthrope.zym.sounds
	models/player/marine.zym.sounds
	models/player/nexus.zym.sounds
	models/player/pyria.zym.sounds
	models/player/shock.zym.sounds
	models/player/skadi.zym.sounds
	models/player/specop.zym.sounds
	models/player/visitant.zym.sounds
	models/player/xolar.zym.sounds
	models/portal.md3
	models/portal.md3_0.skin
	models/portal.md3_1.skin
	models/portal.md3_2.skin
	models/sprites/as-defend_frame0.tga
	models/sprites/as-destroy_frame0.tga
	models/sprites/as-push_frame0.tga
	models/sprites/bluebase.tga
	models/sprites/danger.tga
	models/sprites/defend.tga
	models/sprites/destroy.tga
	models/sprites/flagcarrier.tga
	models/sprites/helpme.tga
	models/sprites/here.tga
	models/sprites/keycarrier-blue.tga
	models/sprites/keycarrier-finish.tga
	models/sprites/keycarrier-friend.tga
	models/sprites/keycarrier-pink.tga
	models/sprites/keycarrier-red.tga
	models/sprites/keycarrier-yellow.tga
	models/sprites/key-dropped.tga
	models/sprites/ons-cp-atck-blue_frame0.tga
	models/sprites/ons-cp-atck-blue_frame1.tga
	models/sprites/ons-cp-atck-neut_frame0.tga
	models/sprites/ons-cp-atck-neut_frame1.tga
	models/sprites/ons-cp-atck-red_frame0.tga
	models/sprites/ons-cp-atck-red_frame1.tga
	models/sprites/ons-cp-blue.tga
	models/sprites/ons-cp-dfnd-blue_frame0.tga
	models/sprites/ons-cp-dfnd-blue_frame1.tga
	models/sprites/ons-cp-dfnd-red_frame0.tga
	models/sprites/ons-cp-dfnd-red_frame1.tga
	models/sprites/ons-cp-neut.tga
	models/sprites/ons-cp-red.tga
	models/sprites/ons-gen-blue.tga
	models/sprites/ons-gen-red.tga
	models/sprites/ons-gen-shielded.tga
	models/sprites/push.tga
	models/sprites/race-checkpoint.sp2
	models/sprites/race-checkpoint.tga
	models/sprites/race-finish.sp2
	models/sprites/race-finish.tga
	models/sprites/redbase.tga
	models/sprites/waypoint.tga
	models/sprites/wpn-campingrifle_frame0.tga
	models/sprites/wpn-crylink_frame0.tga
	models/sprites/wpn-electro_frame0.tga
	models/sprites/wpn-gl_frame0.tga
	models/sprites/wpn-hagar_frame0.tga
	models/sprites/wpn-hlac_frame0.tga
	models/sprites/wpn-hookgun_frame0.tga
	models/sprites/wpn-laser_frame0.tga
	models/sprites/wpn-minstanex_frame0.tga
	models/sprites/wpn-nex_frame0.tga
	models/sprites/wpn-porto_frame0.tga
	models/sprites/wpn-rl_frame0.tga
	models/sprites/wpn-seeker_frame0.tga
	models/sprites/wpn-shotgun_frame0.tga
	models/sprites/wpn-uzi_frame0.tga
    models/tagrocket.md3
    models/tagrocket.tga
	models/turrets/base-gib1.md3
	models/turrets/base-gib2.md3
	models/turrets/base-gib3.md3
	models/turrets/base-gib4.md3
	models/turrets/base.md3
	models/turrets/c512.md3
	models/turrets/c8.md3
	models/turrets/flac.md3
	models/turrets/fusion_top.md3
	models/turrets/fusreac.md3
	models/turrets/head-gib1.md3
	models/turrets/head-gib2.md3
	models/turrets/head-gib3.md3
	models/turrets/head-gib4.md3
	models/turrets/hellion.md3
	models/turrets/hk.md3
	models/turrets/hunter2.md3
	models/turrets/machinegun.md3
	models/turrets/mlrs.md3
	models/turrets/mlrs_rocket.md3
	models/turrets/pd_proj.md3
	models/turrets/phaser_beam.md3
	models/turrets/phaser.md3
	models/turrets/plasmad.md3
	models/turrets/plasma.md3
	models/turrets/reactor.md3
	models/turrets/rocket.md3
	models/turrets/tesla_base.md3
	models/turrets/tesla_head.md3
	models/turrets/tesla.md3
	models/turrets/walker_body.md3
	models/turrets/walker_head_minigun.md3
	models/turrets/walker_mghead.md3
	models/turrets/walker_props.md3
	models/turrets/walker_spawn.md3
	models/weapons/g_campingrifle.md3
    models/weapons/g_hlac.md3
	models/weapons/g_hookgun.md3
	models/weapons/g_minstanex.md3
	models/weapons/g_porto.md3
    models/weapons/g_seeker.md3
	models/weapons/v_campingrifle.md3
    models/weapons/v_hlac.md3
	models/weapons/v_hookgun.md3
	models/weapons/v_minstanex.md3
	models/weapons/v_porto.md3
    models/weapons/v_seeker.md3
	models/weapons/w_campingrifle.zym
    models/weapons/w_hlac.zym
	models/weapons/w_hookgun.zym
	models/weapons/w_minstanex.zym
	models/weapons/w_porto.zym
    models/weapons/w_seeker.zym
	particles/particlefont.tga
	scripts/eggandbacon.shader
	scripts/flags.shader
	scripts/hlac.shader
	scripts/portals.shader
	sound/announcer/male/airshot.ogg
	sound/announcer/male/electrobitch.ogg
	sound/announcer/male/headshot.ogg
	sound/announcer/male/impressive.ogg
	sound/announcer/male/yoda.ogg
	sound/ctf/bluecapture.ogg
	sound/ctf/redcapture.ogg
	sound/ctf/respawn.wav
	sound/ctf/return.wav
	sound/ctf/take.wav
	sound/domination/claim.wav
	sound/kh/alarm.wav
	sound/kh/capture.wav
	sound/kh/collect.wav
	sound/kh/destroy.wav
	sound/kh/drop.wav
	sound/misc/armor10.wav
	sound/misc/armor1.wav
	sound/misc/armor25.wav
	sound/misc/footstep01.wav
	sound/misc/footstep02.wav
	sound/misc/footstep03.wav
	sound/misc/footstep04.wav
	sound/misc/footstep05.wav
	sound/misc/footstep06.wav
	sound/misc/gib.wav
	sound/misc/hitground1.ogg
	sound/misc/hitground2.ogg
	sound/misc/hitground3.ogg
	sound/misc/hitground4.ogg
	sound/misc/hit.wav
	sound/misc/itempickup.ogg
	sound/misc/jumppad.ogg
	sound/misc/mediumhealth.ogg
	sound/misc/metalfootstep01.wav
	sound/misc/metalfootstep02.wav
	sound/misc/metalfootstep03.wav
	sound/misc/metalfootstep04.wav
	sound/misc/metalfootstep05.wav
	sound/misc/metalfootstep06.wav
	sound/misc/metalhitground1.ogg
	sound/misc/metalhitground2.ogg
	sound/misc/metalhitground3.ogg
	sound/misc/metalhitground4.ogg
	sound/misc/minihealth.ogg
	sound/misc/powerup.ogg
	sound/misc/powerup_shield.ogg
	sound/misc/typehit.wav
	sound/player/carni-lycan/coms/attackinfive.ogg
	sound/player/carni-lycan/coms/attack.ogg
	sound/player/carni-lycan/coms/coverme.ogg
	sound/player/carni-lycan/coms/defend.ogg
	sound/player/carni-lycan/coms/freelance1.ogg
	sound/player/carni-lycan/coms/freelance2.ogg
	sound/player/carni-lycan/coms/incoming.ogg
	sound/player/carni-lycan/coms/meet.ogg
	sound/player/carni-lycan/coms/needhelp1.ogg
	sound/player/carni-lycan/coms/seenflag.ogg
	sound/player/carni-lycan/coms/taunt1.ogg
	sound/player/carni-lycan/coms/taunt2.ogg
	sound/player/carni-lycan/coms/taunt3.ogg
	sound/player/carni-lycan/coms/teamshoot1.ogg
	sound/player/carni-lycan/coms/teamshoot2.ogg
	sound/player/carni-lycan/coms/teamshoot3.ogg
	sound/player/carni-lycan/player/death1.ogg
	sound/player/carni-lycan/player/death2.ogg
	sound/player/carni-lycan/player/death3.ogg
	sound/player/carni-lycan/player/drown.ogg
	sound/player/carni-lycan/player/fall1.ogg
	sound/player/carni-lycan/player/falling.ogg
	sound/player/carni-lycan/player/gasp.ogg
	sound/player/carni-lycan/player/jump.ogg
	sound/player/carni-lycan/player/pain100.ogg
	sound/player/carni-lycan/player/pain25.ogg
	sound/player/carni-lycan/player/pain50.ogg
	sound/player/carni-lycan/player/pain75.ogg
	sound/player/default.sounds
	sound/player/fricka/coms/attackinfive.ogg
	sound/player/fricka/coms/attack.ogg
	sound/player/fricka/coms/coverme.ogg
	sound/player/fricka/coms/defend.ogg
	sound/player/fricka/coms/flagseen.ogg
	sound/player/fricka/coms/freelance1.ogg
	sound/player/fricka/coms/freelance2.ogg
	sound/player/fricka/coms/incoming.ogg
	sound/player/fricka/coms/taunt1.ogg
	sound/player/fricka/coms/taunt2.ogg
	sound/player/fricka/coms/taunt3.ogg
	sound/player/fricka/coms/taunt4.ogg
	sound/player/fricka/coms/teamshoot1.ogg
	sound/player/fricka/coms/teamshoot2.ogg
	sound/player/fricka/coms/teamshoot3.ogg
	sound/player/fricka/coms/waypoint.ogg
	sound/player/fricka/player/death1.ogg
	sound/player/fricka/player/death2.ogg
	sound/player/fricka/player/death3.ogg
	sound/player/fricka/player/drown.ogg
	sound/player/fricka/player/fall1.ogg
	sound/player/fricka/player/falling.ogg
	sound/player/fricka/player/gasp.ogg
	sound/player/fricka/player/jump.ogg
	sound/player/fricka/player/pain100.ogg
	sound/player/fricka/player/pain25.ogg
	sound/player/fricka/player/pain50.ogg
	sound/player/fricka/player/pain75.ogg
	sound/player/insurrectionist/coms/attackinfive.ogg
	sound/player/insurrectionist/coms/attack.ogg
	sound/player/insurrectionist/coms/coverme.ogg
	sound/player/insurrectionist/coms/defend.ogg
	sound/player/insurrectionist/coms/freelance1.ogg
	sound/player/insurrectionist/coms/freelance2.ogg
	sound/player/insurrectionist/coms/incoming.ogg
	sound/player/insurrectionist/coms/meet.ogg
	sound/player/insurrectionist/coms/needhelp1.ogg
	sound/player/insurrectionist/coms/needhelp2.ogg
	sound/player/insurrectionist/coms/seenflag.ogg
	sound/player/insurrectionist/coms/taunt1.ogg
	sound/player/insurrectionist/coms/taunt2.ogg
	sound/player/insurrectionist/coms/taunt3.ogg
	sound/player/insurrectionist/coms/taunt4.ogg
	sound/player/insurrectionist/coms/teamshoot1.ogg
	sound/player/insurrectionist/coms/teamshoot2.ogg
	sound/player/insurrectionist/coms/teamshoot3.ogg
	sound/player/insurrectionist/player/death1.ogg
	sound/player/insurrectionist/player/death2.ogg
	sound/player/insurrectionist/player/death3.ogg
	sound/player/insurrectionist/player/drown.ogg
	sound/player/insurrectionist/player/fall1.ogg
	sound/player/insurrectionist/player/falling.ogg
	sound/player/insurrectionist/player/gasp.ogg
	sound/player/insurrectionist/player/jump.ogg
	sound/player/insurrectionist/player/pain100.ogg
	sound/player/insurrectionist/player/pain25.ogg
	sound/player/insurrectionist/player/pain50.ogg
	sound/player/insurrectionist/player/pain75.ogg
	sound/player/lava.wav
	sound/player/marine/coms/attackinfive.ogg
	sound/player/marine/coms/attack.ogg
	sound/player/marine/coms/coverme.ogg
	sound/player/marine/coms/defend.ogg
	sound/player/marine/coms/freelance1.ogg
	sound/player/marine/coms/freelance2.ogg
	sound/player/marine/coms/incoming.ogg
	sound/player/marine/coms/meet.ogg
	sound/player/marine/coms/needhelp1.ogg
	sound/player/marine/coms/needhelp2.ogg
	sound/player/marine/coms/seenflag.ogg
	sound/player/marine/coms/taunt1.ogg
	sound/player/marine/coms/taunt2.ogg
	sound/player/marine/coms/taunt3.ogg
	sound/player/marine/coms/teamshoot1.ogg
	sound/player/marine/coms/teamshoot2.ogg
	sound/player/marine/coms/teamshoot3.ogg
	sound/player/marine/coms/teamshoot4.ogg
	sound/player/marine/player/death1.ogg
	sound/player/marine/player/death2.ogg
	sound/player/marine/player/death3.ogg
	sound/player/marine/player/drown.ogg
	sound/player/marine/player/fall1.ogg
	sound/player/marine/player/falling.ogg
	sound/player/marine/player/gasp.ogg
	sound/player/marine/player/jump.ogg
	sound/player/marine/player/pain100.ogg
	sound/player/marine/player/pain25.ogg
	sound/player/marine/player/pain50.ogg
	sound/player/marine/player/pain75.ogg
	sound/player/pyria-skadi/coms/attack1.ogg
	sound/player/pyria-skadi/coms/attack2.ogg
	sound/player/pyria-skadi/coms/attackinfive.ogg
	sound/player/pyria-skadi/coms/coverme.ogg
	sound/player/pyria-skadi/coms/defend.ogg
	sound/player/pyria-skadi/coms/freelance1.ogg
	sound/player/pyria-skadi/coms/freelance2.ogg
	sound/player/pyria-skadi/coms/incoming.ogg
	sound/player/pyria-skadi/coms/meet.ogg
	sound/player/pyria-skadi/coms/needhelp1.ogg
	sound/player/pyria-skadi/coms/seenflag.ogg
	sound/player/pyria-skadi/coms/taunt1.ogg
	sound/player/pyria-skadi/coms/taunt2.ogg
	sound/player/pyria-skadi/coms/taunt3.ogg
	sound/player/pyria-skadi/coms/taunt4.ogg
	sound/player/pyria-skadi/coms/taunt5.ogg
	sound/player/pyria-skadi/coms/teamshoot1.ogg
	sound/player/pyria-skadi/coms/teamshoot2.ogg
	sound/player/pyria-skadi/coms/teamshoot3.ogg
	sound/player/pyria-skadi/coms/teamshoot4.ogg
	sound/player/pyria-skadi/player/death1.ogg
	sound/player/pyria-skadi/player/death2.ogg
	sound/player/pyria-skadi/player/death3.ogg
	sound/player/pyria-skadi/player/drown.ogg
	sound/player/pyria-skadi/player/fall1.ogg
	sound/player/pyria-skadi/player/falling.ogg
	sound/player/pyria-skadi/player/gasp.ogg
	sound/player/pyria-skadi/player/jump.ogg
	sound/player/pyria-skadi/player/pain100.ogg
	sound/player/pyria-skadi/player/pain25.ogg
	sound/player/pyria-skadi/player/pain50.ogg
	sound/player/pyria-skadi/player/pain75.ogg
	sound/player/reptilian/coms/attackinfive.ogg
	sound/player/reptilian/coms/attack.ogg
	sound/player/reptilian/coms/coverme.ogg
	sound/player/reptilian/coms/defend.ogg
	sound/player/reptilian/coms/freelance1.ogg
	sound/player/reptilian/coms/freelance2.ogg
	sound/player/reptilian/coms/incoming.ogg
	sound/player/reptilian/coms/meet.ogg
	sound/player/reptilian/coms/needhelp1.ogg
	sound/player/reptilian/coms/needhelp2.ogg
	sound/player/reptilian/coms/seenflag.ogg
	sound/player/reptilian/coms/taunt1.ogg
	sound/player/reptilian/coms/taunt2.ogg
	sound/player/reptilian/coms/taunt3.ogg
	sound/player/reptilian/coms/teamshoot1.ogg
	sound/player/reptilian/coms/teamshoot2.ogg
	sound/player/reptilian/coms/teamshoot3.ogg
	sound/player/reptilian/player/death1.ogg
	sound/player/reptilian/player/death2.ogg
	sound/player/reptilian/player/death3.ogg
	sound/player/reptilian/player/drown.ogg
	sound/player/reptilian/player/fall1.ogg
	sound/player/reptilian/player/falling.ogg
	sound/player/reptilian/player/gasp.ogg
	sound/player/reptilian/player/jump.ogg
	sound/player/reptilian/player/pain100.ogg
	sound/player/reptilian/player/pain25.ogg
	sound/player/reptilian/player/pain50.ogg
	sound/player/reptilian/player/pain75.ogg
	sound/player/slime.wav
	sound/player/soldier/coms/attackinfive.ogg
	sound/player/soldier/coms/attack.ogg
	sound/player/soldier/coms/coverme.ogg
	sound/player/soldier/coms/defend.ogg
	sound/player/soldier/coms/freelance1.ogg
	sound/player/soldier/coms/freelance2.ogg
	sound/player/soldier/coms/ideas/flagcarriertakingdamage.ogg
	sound/player/soldier/coms/ideas/getourflagback.ogg
	sound/player/soldier/coms/incoming.ogg
	sound/player/soldier/coms/meet.ogg
	sound/player/soldier/coms/needhelp1.ogg
	sound/player/soldier/coms/needhelp2.ogg
	sound/player/soldier/coms/seenflag.ogg
	sound/player/soldier/coms/taunt1.ogg
	sound/player/soldier/coms/taunt2.ogg
	sound/player/soldier/coms/taunt3.ogg
	sound/player/soldier/coms/teamshoot1.ogg
	sound/player/soldier/coms/teamshoot2.ogg
	sound/player/soldier/coms/teamshoot3.ogg
	sound/player/soldier/player/death1.ogg
	sound/player/soldier/player/death2.ogg
	sound/player/soldier/player/death3.ogg
	sound/player/soldier/player/drown.ogg
	sound/player/soldier/player/fall1.ogg
	sound/player/soldier/player/falling.ogg
	sound/player/soldier/player/gasp.ogg
	sound/player/soldier/player/jump.ogg
	sound/player/soldier/player/pain100.ogg
	sound/player/soldier/player/pain25.ogg
	sound/player/soldier/player/pain50.ogg
	sound/player/soldier/player/pain75.ogg
	sound/player/specop/coms/attackinfive.ogg
	sound/player/specop/coms/attack.ogg
	sound/player/specop/coms/coverme.ogg
	sound/player/specop/coms/defend.ogg
	sound/player/specop/coms/freelance1.ogg
	sound/player/specop/coms/freelance2.ogg
	sound/player/specop/coms/incoming.ogg
	sound/player/specop/coms/meet.ogg
	sound/player/specop/coms/needhelp1.ogg
	sound/player/specop/coms/seenflag.ogg
	sound/player/specop/coms/taunt1.ogg
	sound/player/specop/coms/taunt2.ogg
	sound/player/specop/coms/taunt3.ogg
	sound/player/specop/coms/taunt4.ogg
	sound/player/specop/coms/teamshoot1.ogg
	sound/player/specop/coms/teamshoot2.ogg
	sound/player/specop/coms/teamshoot3.ogg
	sound/player/specop/coms/teamshoot4.ogg
	sound/player/specop/player/death1.ogg
	sound/player/specop/player/death2.ogg
	sound/player/specop/player/death3.ogg
	sound/player/specop/player/drown.ogg
	sound/player/specop/player/fall1.ogg
	sound/player/specop/player/falling.ogg
	sound/player/specop/player/gasp.ogg
	sound/player/specop/player/jump.ogg
	sound/player/specop/player/pain100.ogg
	sound/player/specop/player/pain25.ogg
	sound/player/specop/player/pain50.ogg
	sound/player/specop/player/pain75.ogg
	sound/player/torus/attack.ogg
	sound/player/torus/coverme.ogg
	sound/player/torus/death.ogg
	sound/player/torus/drown.ogg
	sound/player/torus/fall.ogg
	sound/player/torus/flagseen.ogg
	sound/player/torus/gasp.ogg
	sound/player/torus/hooah.ogg
	sound/player/torus/incoming.ogg
	sound/player/torus/jump.ogg
	sound/player/torus/letsgo.ogg
	sound/player/torus/needhelp.ogg
	sound/player/torus/pain100.ogg
	sound/player/torus/pain25.ogg
	sound/player/torus/pain50.ogg
	sound/player/torus/pain75.ogg
	sound/player/torus/taunt.ogg
	sound/player/torus/teamshoot.ogg
	sound/player/torus/waypoint.ogg
	sound/porto/bounce.ogg
	sound/porto/create.ogg
	sound/porto/expire.ogg
	sound/porto/explode.ogg
	sound/porto/fire.ogg
	sound/porto/unsupported.ogg
	sound/weapons/brass1.ogg
	sound/weapons/brass2.ogg
	sound/weapons/brass3.ogg
	sound/weapons/campingrifle_fire.ogg
	sound/weapons/campingrifle_reload.ogg
	sound/weapons/casings1.ogg
	sound/weapons/casings2.ogg
	sound/weapons/casings3.ogg
	sound/weapons/crylink_fire2.ogg
	sound/weapons/crylink_fire.ogg
	sound/weapons/crylink_impact2.ogg
	sound/weapons/crylink_impact.ogg
	sound/weapons/electro_bounce.ogg
	sound/weapons/electro_fire2.ogg
	sound/weapons/electro_fire.ogg
	sound/weapons/electro_fly.wav
	sound/weapons/electro_impact.ogg
	sound/weapons/flacexp1.ogg
	sound/weapons/flacexp2.ogg
	sound/weapons/flacexp3.ogg
	sound/weapons/flac_fire.ogg
	sound/weapons/grenade_bounce1.ogg
	sound/weapons/grenade_bounce2.ogg
	sound/weapons/grenade_bounce3.ogg
	sound/weapons/grenade_bounce4.ogg
	sound/weapons/grenade_bounce5.ogg
	sound/weapons/grenade_bounce6.ogg
	sound/weapons/grenade_fire.ogg
	sound/weapons/grenade_impact.ogg
	sound/weapons/hagar_fire.ogg
	sound/weapons/hagexp1.ogg
	sound/weapons/hagexp2.ogg
	sound/weapons/hagexp3.ogg
	sound/weapons/hookbomb_fire.ogg
	sound/weapons/hookbomb_impact.ogg
	sound/weapons/hook_fire.ogg
	sound/weapons/hook_impact.ogg
	sound/weapons/lasergun_fire.ogg
	sound/weapons/laserimpact.ogg
	sound/weapons/minstanexfire.ogg
	sound/weapons/nexfire.ogg
	sound/weapons/neximpact.ogg
	sound/weapons/rocket_det.ogg
	sound/weapons/rocket_fire.ogg
	sound/weapons/rocket_fly.wav
	sound/weapons/rocket_impact.ogg
	sound/weapons/rocket_mode.ogg
	sound/weapons/seekerexp1.ogg
	sound/weapons/seekerexp2.ogg
	sound/weapons/seekerexp3.ogg
	sound/weapons/seeker_fire.ogg
	sound/weapons/shotgun_fire.ogg
	sound/weapons/strength_fire.ogg
	sound/weapons/tagexp1.ogg
	sound/weapons/tagexp2.ogg
	sound/weapons/tagexp3.ogg
	sound/weapons/tag_fire.ogg
	sound/weapons/tag_impact.ogg
	sound/weapons/tag_rocket_fly.wav
	sound/weapons/uzi_fire.ogg
	sound/weapons/weaponpickup.ogg
	sound/weapons/weapon_switch.ogg
	textures/campingrifle_bump.tga
	textures/campingrifle_gloss.tga
	textures/campingrifle_glow.tga
	textures/campingrifle_pants.tga
	textures/campingrifle_shirt.tga
	textures/campingrifle.tga
	textures/crifleflashider_bump.tga
	textures/crifleflashider_gloss.tga
	textures/crifleflashider.tga
	textures/eggandbacon/black.tga
	textures/eggandbacon/platten_bump.tga
	textures/eggandbacon/platten_gloss.tga
	textures/eggandbacon/platten.tga
	textures/eggandbacon/upsign_bump.tga
	textures/eggandbacon/upsign_gloss.tga
	textures/eggandbacon/upsign.tga
	textures/flags/flag_blue_cloth.tga
	textures/flags/flag_blue_gloss.tga
	textures/flags/flag_blue_glow.tga
	textures/flags/flag_blue_laser.tga
	textures/flags/flag_blue_norm.tga
	textures/flags/flag_blue.tga
	textures/flags/flag_red_cloth.tga
	textures/flags/flag_red_gloss.tga
	textures/flags/flag_red_glow.tga
	textures/flags/flag_red_laser.tga
	textures/flags/flag_red_norm.tga
	textures/flags/flag_red.tga
	textures/hlac_accessory_gloss.tga
	textures/hlac_accessory_norm.tga
	textures/hlac_accessory_pants.tga
	textures/hlac_accessory_shirt.tga
	textures/hlac_accessory.tga
	textures/hlac_body_gloss.tga
	textures/hlac_body_glow.tga
	textures/hlac_body_norm.tga
	textures/hlac_body_pants.tga
	textures/hlac_body_shirt.tga
	textures/hlac_body.tga
	textures/hlac_glass.tga
	textures/hlac_metal.tga
	textures/hlac_plasma.tga
	textures/hlac.tga
	textures/hookgun_gloss.tga
	textures/hookgun_norm.tga
	textures/hookgun_pants.tga
	textures/hookgun.tga
	textures/nex_bump.tga
	textures/nex_gloss.tga
	textures/nex_glow.tga
	textures/nex_pants.tga
	textures/nex_shirt.tga
	textures/nex.tga
	textures/portalgun_gloss.tga
	textures/portalgun_glow.tga
	textures/portalgun_norm.tga
	textures/portalgun.tga
	textures/portals/portals_blue_gloss.tga
	textures/portals/portals_blue_glow.tga
	textures/portals/portals_blue_norm.tga
	textures/portals/portals_blue.tga
	textures/portals/portals_blue_vortex.tga
	textures/portals/portals_inactive.tga
	textures/portals/portals_inactive_vortex.tga
	textures/portals/portals_red_gloss.tga
	textures/portals/portals_red_glow.tga
	textures/portals/portals_red_norm.tga
	textures/portals/portals_red.tga
	textures/portals/portals_red_vortex.tga
	textures/seeker_gloss.tga
	textures/seeker_glow.tga
	textures/seeker_norm.tga
	textures/seeker_pants.tga
	textures/seeker.tga
"

rm -rf pack
mkdir pack
for F in $COMPAT_FILES; do
	mkdir -p pack/${F%/*}
	cp "$F" pack/"$F"
done

cd pack

find . -type f -print0 | qual=85 scaledown=256x256 xargs -0 ../../misc/jpeg-if-not-alpha.sh

find . -name \*.ogg | while IFS= read -r NAME; do
	oggdec -o "$NAME.wav" "$NAME"
	oggenc -q 0 -o "$NAME" "$NAME.wav"
	rm -f "$NAME.wav"
done

rev=`svnversion ..`
pack="zzz_svn-compat-$rev"
echo "Support files to play on svn servers of revision $rev" > "$pack.txt"
7za a -tzip -mx=9 "../$pack.pk3" .
rm -f "$pack.txt"

cd ..
rm -rf pack
