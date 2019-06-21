(global bool cutscene_running false)

(global weapon player_stubbs none)

(global weapon player_chump none)

(global bool open_doors false)

(global bool in_detention false)

(global bool boss_music_1 false)

(global bool boss_music_2 false)

(global bool muster_music false)

(global bool hand_music false)

(global bool pee_weapon0 false)

(global bool pee_weapon1 false)

(global bool stubbs_free false)

(global bool forensic_fight false)

(global bool possessing_cop false)

(global short possession_lts 0)

(global short possession_path 0)

(global bool show_cutscenes false)

(global short test 0)

(global bool gdc_demo true)

(global vehicle_name zombie_bill zombie_bill_inmate)

(script static weapon player_current0
(begin
(unit
(list_get
(players_current) 0))))

(script static weapon player_current1
(begin
(unit
(list_get
(players_current) 1))))

(script static weapon player_origin0
(begin
(unit
(list_get
(players_origin) 0))))

(script static weapon player_origin1
(begin
(unit
(list_get
(players_origin) 1))))

(script static weapon player_nonorigin0
(begin
(unit
(list_get
(players_nonorigin) 0))))

(script static weapon player_nonorigin1
(begin
(unit
(list_get
(players_nonorigin) 1))))

(script static bool cinematic_skip_start
(begin
(cinematic_skip_start_internal)
(game_save_totally_unsafe)
(sleep_until
(not
(game_saving)) 1)
(not
(game_reverted))))

(script static void cinematic_skip_stop
(begin
(cinematic_skip_stop_internal)))

(script static void start_cutscene
(begin
(show_hud false)
(player_enable_input false)
(player_camera_control false)
(camera_control true 0)
(image_effect_set image_effects\technicolor)
(cinematic_start)
(set cutscene_running true)))

(script static void stop_cutscene
(begin
(show_hud true)
(player_enable_input true)
(player_camera_control true)
(camera_control false 0)
(image_effect_end)
(cinematic_stop)
(set cutscene_running false)))

(script static void start_cutscene_no_effect
(begin
(show_hud false)
(player_enable_input false)
(player_camera_control false)
(camera_control true 0)
(cinematic_start)
(set cutscene_running true)))

(script static bool cutscene_in_progress
(begin
(if cutscene_running true false)))

(script static weapon player0
(begin
(unit
(list_get
(players) 0))))

(script static weapon player1
(begin
(unit
(list_get
(players) 1))))

(script static void a10
(begin
(map_name levels\a10_plaza\a10_plaza)))

(script static void a30
(begin
(map_name levels\a30_greenhouse\a30_greenhouse)))

(script static void a40
(begin
(map_name levels\a40_police_station\a40_police_station)))

(script static void a45
(begin
(map_name levels\a45_dance\a45_dance)))

(script static void a50
(begin
(map_name levels\a50_maul\a50_maul)))

(script static void a60
(begin
(map_name levels\a60_maulfight\a60_maulfight)))

(script static void b10
(begin
(map_name levels\b10_farm_house\b10_farm_house)))

(script static void b30
(begin
(map_name levels\b30_dam\b30_dam)))

(script static void c10
(begin
(map_name levels\c10_offender\c10_offender)))

(script static void c30
(begin
(map_name levels\c30_lab\c30_lab)))

(script static void c40
(begin
(map_name levels\c40_cityhall\c40_cityhall)))

(script static void c50
(begin
(map_name levels\c50_end\c50_end)))

(script static void return_players_to_bodies
(begin
(print return_players_to_bodies)
(if
(not
(object_is_instance return_players_to_bodies characters\stubbs\stubbs))
(begin
(print returning player 0 to body)
(damage_object globals\falling return_players_to_bodies)))
(if
(and
(game_is_cooperative)
(not
(object_is_instance return_players_to_bodies characters\stubbs\stubbs)))
(begin
(print returning player 1 to body)
(damage_object globals\falling return_players_to_bodies)))))

(script static void a40_10
(begin
(if
(= show_cutscenes true) a40_10)))

(script static void a40_20
(begin
(if
(= show_cutscenes true) a40_20)))

(script static void a40_30
(begin
(if
(= show_cutscenes true) a40_30)))

(script static void cutscenes_on
(begin
(set show_cutscenes true)))

(script continuous void blow_vents
(begin
(apply_impulse tunnel_crawl airduct_flag 0.20 0.20 effects\tubes\lift)
(apply_impulse vent_02 vent_02 0.20 0.20 effects\tubes\lift)
(apply_impulse vent_hide vent_03 0.20 0.20 effects\tubes\lift)
(apply_impulse vent_04 vent_04 0.20 0.20 effects\tubes\lift)))

(script startup void hallsave
(begin
(sleep_until
(volume_test_objects hall_save
(players_current)))
(game_save_cancel)
(game_save_no_timeout)))

(script startup void crawlsave
(begin
(sleep_until
(volume_test_objects crawl_save
(players_current)) 1)
(game_save_cancel)
(game_save_no_timeout)
(wake blow_vents)
(object_destroy wind_01)
(object_destroy wind_02)
(object_destroy wind_03)
(object_destroy wind_04)
(object_create wind_01)
(object_create wind_02)
(object_create wind_03)
(object_create wind_04)))

(script startup void detention_save
(begin
(sleep_until
(volume_test_objects detention_entrance
(players_current)))
(if
(< possession_path 3)
(begin
(ai_set_current_state guards/detention_guards guard)
(ai_magically_see_players guards/detention_guards)
(ai_force_active prisoners_enc true)))
(game_save_cancel)
(game_save_no_timeout)
(print saving checkpoint. . .please wait)))

(script startup void gastopia_opening
(begin gastopia_opening
(show_hud false)
(fade_out 0.00 0.00 0.00 0)
(if gastopia_opening gastopia_opening) gastopia_opening
(switch_bsp 1)
(ai_set_resurrection_group z_crypt/zombie_a)
(object_teleport gastopia_opening lineup_start)
(object_teleport gastopia_opening lineup_start_b)))

(script dormant void muster_waves
(begin
(ai_place muster_fight/cop_wave_01)
(sleep_until
(and
(<
(ai_living_count muster_fight/cop_wave_01) 3)
(volume_test_objects muster_fight
(players_current))))
(game_save_cancel)
(game_save_no_timeout)
(ai_place muster_fight/cop_wave_02)
(sleep_until
(and
(<
(ai_living_count muster_fight/cop_wave_02) 3)
(volume_test_objects muster_fight
(players_current))))
(game_save_cancel)
(game_save_no_timeout)
(ai_place muster_fight/cop_wave_03)
(sleep_until
(and
(<
(ai_living_count muster_fight/cop_wave_03) 2)
(volume_test_objects muster_fight
(players_current))))
(game_save_cancel)
(game_save_no_timeout)
(sleep 150)
(ai_place muster_fight)
(sleep_until
(<
(ai_strength muster_fight) 0.20))
(game_save_cancel)
(game_save_no_timeout)
(ai_place exit_defenders)
(device_group_set_immediate exit_lock 1.00)
(ai_try_to_fight_player exit_defenders)
(set muster_music false)))

(script startup void zombie_friends
(begin
(ai_allegiance zombie possessed)
(ai_allegiance_remove sheep zombie)))

(script dormant void muster_video_off
(begin
(sleep
(sound_impulse_time sound\dialog\a40\se_chief_masters_2))
(camera_video_enable false)
(object_activation_clear)))

(script dormant void muster_video
(begin
(camera_video_enable true)
(camera_video_set masterman_cam)
(object_activation_add_camera masterman_cam)
(sound_impulse_start sound\dialog\a40\se_chief_masters_2_lip_sync masterman 0.00)
(wake muster_video_off)
(sound_impulse_start sound\dialog\a40\se_chief_masters_2 muster_screen 1.00)
(custom_animation masterman cinematics\animations\masters\common\common alert unarmed threaten true)))

(script dormant void inmate_screams
(begin
(sleep 30)
(sound_impulse_start sound\dialog\inmate_1\surprise
(list_get
(ai_actors lineup_enc/inmates) 0) 1.00)
(sleep 30)
(sound_impulse_start sound\dialog\inmate_1\flee
(list_get
(ai_actors lineup_enc/inmates) 1) 1.00)
(sleep 30)
(sound_impulse_start sound\dialog\inmate_1\surprise
(list_get
(ai_actors lineup_enc/inmates) 2) 1.00)))

(script dormant void entry_floor
(begin
(ai_place lineup_enc/inmates)
(ai_begin_flee_with_cower_chance lineup_enc/inmates true 0 true 0.30)
(wake inmate_screams)
(game_save_no_timeout)
(fade_in 0.00 0.00 0.00 30)
(show_hud true)
(sleep_until
(volume_test_objects lineup_trigger
(players_current)) 15)
(ai_place lineup_enc/monitors)
(device_group_set lineup_opener 1.00)
(ai_attack lineup_enc/monitors)
(ai_try_to_fight_player lineup_enc/monitors)
(sleep_until
(volume_test_objects inter_drop
(players_current)) 15)
(game_save_cancel)
(game_save_no_timeout)
(ai_place interrogation)
(sleep_until
(volume_test_objects hall_drop
(players_current)) 15)
(game_save_cancel)
(game_save_no_timeout)
(ai_place hall_cops_main/wander_a)
(sleep_until
(volume_test_objects hall_drop_03
(players_current)) 15)
(ai_place hall_cops_main/wander_b)
(sleep_until
(volume_test_objects hall_drop_02
(players_current)) 15)
(game_save_cancel)
(game_save_no_timeout)
(ai_place hall_cops_side)
(sleep_until
(volume_test_objects muster_drop
(players_current)) 15)
(game_save_cancel)
(game_save_no_timeout)
(ai_place muster_room)
(sleep_until
(volume_test_objects muster_assault
(players_origin)) 15)
(volume_teleport_players_not_inside muster_assault muster_flag)
(device_group_set_immediate muster_opener 1.00)
(game_save_cancel)
(set muster_music true)
(wake muster_video)
(ai_braindead z_crypt true)
(ai_braindead muster_room true)
(ai_braindead hall_cops_side true)
(cinematic_start)
(fade_out 0.00 0.00 0.00 0)
(image_effect_set image_effects\zombie_color)
(player_enable_input false)
(player_camera_control false)
(camera_control true 0)
(fade_in 0.00 0.00 0.00 0)
(camera_set muster_cam_03 0)
(sleep 150)
(camera_set muster_cam_02 90)
(sleep 90)
(sleep 30)
(camera_set muster_cam_01 90)
(sleep 90)
(ai_command_list muster_room muster_surprise)
(player_enable_input true)
(player_camera_control true)
(camera_control false 0)
(cinematic_stop)
(game_save_no_timeout)
(ai_braindead muster_room false)
(ai_braindead z_crypt false)
(ai_berserk z_crypt true)
(ai_attack muster_room)
(ai_braindead hall_cops_side false)
(sleep_until
(and
(<
(ai_living_count muster_room/meeting) 3)
(volume_test_objects muster_fight
(players_current))))
(wake muster_waves)))

(script dormant void attack_riots
(begin
(sleep_until
(<
(ai_strength riot_assault/riot_01) 0.99))
(ai_command_list riot_assault/riot_01 riot_awake)))

(script continuous void jail_death
(begin
(sleep_until in_detention)
(print in detention)
(sleep_until
(and
(<
(list_count
(players_current)) 2)
(and
(volume_test_objects player1_jail
(players_origin))
(=
(device_group_get coop_lock) 0.00))) 1)
(if
(game_is_cooperative)
(begin
(print dead revert)
(sleep 60)
(game_revert)))))

(script dormant void hand_hud_tip_on
(begin
(print hand_hud_tip_on)
(show_hud_help_text true)
(hud_set_help_text handstubbs)
(sleep
(* 30.00 10.00))
(show_hud_help_text false)
(sleep -1)))

(script static void hand_hud_tip_off
(begin
(print hand_hud_tip_off)
(sleep -1 hand_hud_tip_on)
(enable_hud_help_flash false)
(show_hud_help_text false)))

(script dormant void hand2_hud_tip_on
(begin
(print hand2_hud_tip_on)
(show_hud_help_text true)
(hud_set_help_text handrecall)
(sleep
(* 30.00 5.00))
(show_hud_help_text false)
(sleep -1)))

(script static void hand2_hud_tip_off
(begin
(print hand2_hud_tip_off)
(sleep -1 hand2_hud_tip_on)
(enable_hud_help_flash false)
(show_hud_help_text false)))

(script dormant void explain_recalling_hand
(begin
(if
(not
(game_is_cooperative))
(begin
(player_action_test_reset)
(sleep_until
(player_action_test_hand) 1) explain_recalling_hand
(sleep
(* 30.00 10.00))
(wake hand2_hud_tip_on)
(player_action_test_reset)
(sleep_until
(player_action_test_abandon) 1) explain_recalling_hand))))

(script dormant void explain_throwing_hand
(begin
(sleep_until
(volume_test_objects trigger_riot_assault_b
(players_origin)) 1)
(sleep_until
(and
(=
(game_safe_to_save) true)
(or
(>
(unit_special_attack_get_count explain_throwing_hand 2) 0)
(>
(unit_special_attack_get_count explain_throwing_hand 2) 0))))
(wake hand_hud_tip_on)
(wake explain_recalling_hand)))

(script dormant void airduct_waypoint
(begin
(if
(not
(game_is_cooperative))
(begin
(show_hud_help_text true)
(hud_set_help_text blank)
(sleep 30)
(show_hud_help_text true)
(hud_set_help_text handmove)
(sleep
(* 30.00 10.00))
(show_hud_help_text true)
(hud_set_help_text handwalls)
(sleep
(* 30.00 10.00))
(show_hud_help_text true)
(hud_set_help_text blank)
(sleep
(* 30.00 15.00))
(activate_nav_point_flag default airduct_waypoint airduct_flag 0.25))
(begin
(show_hud_help_text true)
(show_hud_help_text_for_player true airduct_waypoint)
(show_hud_help_text_for_player false airduct_waypoint)
(hud_set_help_text blank)
(sleep 30)
(show_hud_help_text true)
(show_hud_help_text_for_player true airduct_waypoint)
(show_hud_help_text_for_player false airduct_waypoint)
(hud_set_help_text handmove)
(sleep
(* 30.00 10.00))
(show_hud_help_text true)
(show_hud_help_text_for_player true airduct_waypoint)
(show_hud_help_text_for_player false airduct_waypoint)
(hud_set_help_text handwalls)
(show_hud_help_text false)
(show_hud_help_text_for_player false airduct_waypoint)
(show_hud_help_text_for_player false airduct_waypoint)))))

(script startup void deactivate_airduct_waypoint
(begin
(sleep_until
(volume_test_objects tunnel_crawl
(players_current)) 1)
(sleep -1 airduct_waypoint)
(deactivate_nav_point_flag deactivate_airduct_waypoint airduct_flag)
(show_hud_help_text false)
(if
(not
(game_is_cooperative))
(begin
(sleep_until
(or
(object_is_instance deactivate_airduct_waypoint characters\beat_cop\beat_cop)
(object_is_instance deactivate_airduct_waypoint characters\lt_cop\lt_cop)
(object_is_instance deactivate_airduct_waypoint characters\beat_cop\beat_cop)
(object_is_instance deactivate_airduct_waypoint characters\lt_cop\lt_cop)))
(sleep 30)
(show_hud_help_text true)
(hud_set_help_text possedhol)
(sleep
(* 30.00 10.00))
(show_hud_help_text true)
(hud_set_help_text possedfire)
(sleep
(* 30.00 10.00))
(show_hud_help_text false)))))

(script dormant void detention_start
(begin
(show_hud false)
(set in_detention true)
(ai_erase z_crypt)
(ai_erase floor_01_end)
(switch_bsp 2)
(sleep 1)
(sleep -1 blow_vents)
(player_force_respawn)
(player_set_profile detention_start aint_got_shit true)
(player_set_profile detention_start aint_got_shit true)
(object_teleport detention_start detention_start)
(object_teleport detention_start detention_start_b)
(ai_set_resurrection_group z_crypt_a/zombie_a)
(if detention_start detention_start) detention_start
(object_create real_table)
(object_create held_stubbs)
(object_set_permutation held_stubbs armleft ~damaged)
(ai_place forensics/doctors)
(ai_place prisoners_enc)
(ai_place doctor_defense/hand_killers)
(ai_place doctor_defense/curious_cop)
(object_create rt_doc)
(object_create lt_doc)
(ai_attach rt_doc forensics/doctors)
(ai_attach lt_doc forensics/doctors)
(objects_cannot_take_damage
(players_current) false)
(camera_video_enable true)
(camera_video_set somethingstupid)
(show_hud false)
(cinematic_stop)
(ai_disregard
(players_current) false)
(fade_out 0.00 0.00 0.00 0)
(player_enable_input false)
(player_camera_control false)
(camera_control true 0)
(player_enable_input false)
(set player_stubbs detention_start)
(player_set_weapons detention_start unarmed true)
(player_set_weapons detention_start unarmed true)
(unit_special_attack detention_start 2)
(player_move_origin player_stubbs detention_start)
(object_teleport detention_start hand_start)
(object_teleport detention_start hand_start_b)
(show_hud true)
(player_enable_input true)
(player_camera_control true)
(camera_control false 0)
(sleep 60)
(set boss_music_1 true)
(player_enable_respawn false)
(game_save_cancel)
(game_save_no_timeout)
(garbage_collect_now)
(fade_in 0.00 0.00 0.00 120)
(wake airduct_waypoint)
(sleep 120)))

(script dormant void wrong_way_def
(begin
(sleep_until
(volume_test_objects wrong_way_01
(players_current)) 5)
(ai_place riot_watch)
(ai_conversation go_back)
(sleep_until
(volume_test_objects now_die
(players_current)) 5)
(ai_conversation go_back_02)
(sleep 90)
(if
(volume_test_objects now_die
(players_current))
(begin
(ai_magically_see_players riot_watch)
(ai_try_to_fight_player riot_watch)))))

(script dormant void escape_cams
(begin
(camera_video_set masterman_cam_02)
(object_activation_add_camera masterman_cam_02)
(sound_impulse_start sound\dialog\a40\se_chief_masters_4 hall_fight_screen_a 1.00)
(sound_impulse_start sound\dialog\a40\se_chief_masters_4_lip_sync detention_masters 0.00)
(custom_animation detention_masters cinematics\animations\masters\common\common alert unarmed threaten true)
(sleep 120)
(object_activation_add_camera assault_cam)
(camera_video_set assault_cam)
(sleep 120)
(object_activation_add_camera jigup_cam)
(camera_video_set jigup_cam)
(sleep 120)
(camera_video_enable false)
(object_activation_clear)))

(script dormant void showdown
(begin
(sleep_until
(volume_test_objects trigger_gauntlet
(players_current)) 1)
(game_save_cancel)
(game_save_no_timeout)
(device_group_set_immediate riot_defense_opener 1.00)
(ai_erase off_room_01)
(ai_place gauntlet)
(sleep -1 wrong_way_def)
(sleep_until
(volume_test_objects bad_room_01
(players_current)) 1)
(game_save_cancel)
(game_save_no_timeout)
(ai_berserk gauntlet true)
(sleep_until
(volume_test_objects bad_room_02
(players_current)) 1)
(game_save_cancel)
(game_save_no_timeout)
(sleep_until
(volume_test_objects now_die
(players_current)) 1)
(ai_magically_see_players gauntlet/last_battle)))

(script dormant void jail_break
(begin
(set boss_music_1 false)
(if
(game_is_cooperative)
(begin
(fade_out 0.00 0.00 0.00 0)
(player_enable_respawn true)
(camera_control true 0)
(player_enable_input false)
(object_destroy held_stubbs)
(object_destroy real_table)
(ai_disregard
(players_current) true)
(object_teleport jail_break detention_start)
(object_teleport jail_break detention_start_b)
(sleep 45)
(set player_chump jail_break)
(player_move_origin player_chump player_stubbs)
(unit_kill player_chump)
(unit_special_attack_set_count jail_break 2 1)
(object_teleport jail_break body_switch)
(object_teleport jail_break body_switch_b)
(object_create real_table)
(device_group_set_immediate detention_opener 0.00)
(game_save_cancel)
(game_save_no_timeout)
(sleep 10)
(ai_disregard
(players_current) false)
(show_hud true)
(player_enable_input true)
(player_camera_control true)
(camera_control false 0)
(ai_set_current_state forensics flee)
(fade_in 0.00 0.00 0.00 60))
(begin
(fade_out 0.00 0.00 0.00 0)
(player_enable_input false)
(player_camera_control false)
(object_destroy held_stubbs)
(object_destroy real_table)
(ai_erase doctor_defense)
(object_teleport jail_break detention_start)
(if jail_break jail_break) jail_break
(camera_control true 0)
(player_enable_input false)
(set player_chump jail_break)
(player_move_origin player_chump player_stubbs)
(unit_kill player_chump)
(unit_special_attack_set_count jail_break 2 1)
(object_teleport jail_break body_switch)
(object_create real_table)
(device_group_set_immediate detention_opener 0.00)
(game_save_cancel)
(game_save_no_timeout)
(sleep 10)
(show_hud true)
(player_enable_input true)
(player_camera_control true)
(camera_control false 0)
(ai_set_current_state forensics flee)
(player_enable_respawn true)
(fade_in 0.00 0.00 0.00 60)))
(device_group_set stubbs_opener 1.00)
(set stubbs_free true)
(set possessing_cop false)
(wake blow_vents)
(object_destroy wind_01)
(object_destroy wind_02)
(object_destroy wind_03)
(object_destroy wind_04)
(object_create wind_01)
(object_create wind_02)
(object_create wind_03)
(object_create wind_04)
(sleep 60)
(set open_doors true)
(wake explain_throwing_hand)
(ai_place riot_assault/detention_cops)
(ai_magically_see_players riot_assault/detention_cops)
(sleep_until
(volume_test_objects trigger_riot_assault
(players_current)))
(device_group_set detention_opener 1.00)
(device_group_set_immediate security_opener 1.00)
(device_operates_automatically_set riot_door_01 true)
(device_operates_automatically_set detention_opener true)
(device_operates_automatically_set riot_door_02 true)
(device_group_change_only_once_more_set detention_opener false)
(ai_place riot_assault/riot_01)
(wake attack_riots)
(wake escape_cams)
(ai_magically_see_players riot_assault/riot_01)
(ai_try_to_fight_player riot_assault)
(game_save_cancel)
(game_save_no_timeout)
(ai_magically_see_encounter z_crypt riot_assault)
(ai_try_to_fight z_crypt riot_assault)
(sleep_until
(volume_test_objects trigger_riot_assault_b
(players_current)))
(game_save_cancel)
(game_save_no_timeout)
(ai_place riot_assault/riot_02)
(ai_place riot_assault/riot_03)
(sleep_until
(volume_test_objects trigger_riot_assault_c
(players_current)) 5)
(game_save)
(wake showdown)
(sleep_until
(volume_test_objects bad_room_01
(players_origin)) 5)))

(script dormant void cop_remarks
(begin
(sleep_until
(volume_test_objects cop_sound_02
(players_current)))
(print getting ready to talk)
(ai_conversation hey_bill_01)
(sleep_until
(volume_test_objects cop_sound_02
(players_current)))
(ai_conversation hey_bill_02)
(sleep_until
(volume_test_objects cop_sound_03
(players_current)))
(ai_conversation hey_bill_03)
(sleep_until
(volume_test_objects cop_sound_04
(players_current)))
(ai_conversation hey_bill_04)))

(script startup void masters_scripted_snds_flr1
(begin
(sleep_until
(volume_test_objects masters_01
(players_current)) 1)
(camera_video_enable true)
(camera_video_set masterman_cam)
(object_activation_add_camera masterman_cam)
(sound_impulse_start sound\dialog\a40\se_chief_masters_1 masters_board 1.00)
(sound_impulse_start sound\dialog\a40\se_chief_masters_1_lip_sync masterman 0.00)
(custom_animation masterman cinematics\animations\masters\common\common alert unarmed point true)
(sleep 300)
(custom_animation masterman cinematics\animations\masters\common\common alert unarmed threaten true)
(sleep 150)
(custom_animation masterman cinematics\animations\masters\common\common alert unarmed wave true)
(sleep 90)
(camera_video_enable false)
(object_activation_clear)))

(script startup void masters_scripted_snds_flr2
(begin
(sleep_until
(volume_test_objects masters_03
(players_current)) 1)
(if
(not stubbs_free)
(begin
(camera_video_set masterman_cam_02)
(object_activation_add_camera masterman_cam_02)
(sound_impulse_start sound\dialog\a40\se_chief_masters_3 security_screen_02 1.00)
(sound_impulse_start sound\dialog\a40\se_chief_masters_3_lip_sync detention_masters 0.00)
(custom_animation detention_masters cinematics\animations\masters\common\common alert unarmed wave true)
(sleep 510)
(custom_animation masterman cinematics\animations\masters\common\common alert unarmed point true)
(sleep 90)
(custom_animation detention_masters cinematics\animations\masters\common\common alert unarmed threaten true)
(sleep 150)
(camera_video_set somethingstupid))
(object_activation_clear))
(sleep_until
(and
(volume_test_objects bad_room_02
(players_origin))
(= stubbs_free true)) 1)
(sound_impulse_start sound\dialog\a40\se_chief_masters_5 help_call 1.00)
(object_activation_clear)))

(script startup void forensic_possession
(begin
(sleep_until
(=
(ai_living_count forensics/doctors) 2))
(sleep_until
(<=
(ai_living_count forensics) 1))
(game_save_cancel)
(if
(and
(= open_doors false)
(not possessing_cop))
(begin
(set forensic_fight true)
(ai_place forensics/cheater_killers)
(set possession_path 3)
(device_group_set stubbs_opener 1.00)
(ai_command_list doctor_defense go_fight)
(sleep 30)
(ai_migrate doctor_defense forensics)
(ai_magically_see_players forensics)
(if
(not
(game_is_cooperative))
(begin
(objects_cannot_take_damage
(ai_actors forensics) true)
(objects_cannot_lose_regions
(ai_actors forensics) true)
(objects_cannot_be_finished
(ai_actors forensics) true)))
(ai_try_to_fight_player forensics)
(ai_berserk forensics true)
(ai_allow_charge forensics true)))))

(script dormant void prisoner_friends
(begin
(ai_allegiance_remove sheep cop)
(ai_set_disguise_knowable prisoners_enc possessed false)
(ai_set_current_state prisoners_enc guard)
(ai_try_to_fight prisoners_enc doctor_defense)
(ai_try_to_fight doctor_defense prisoners_enc)
(ai_try_to_fight riot_assault prisoners_enc)))

(script dormant void prisoner_possession
(begin
(ai_command_list doctor_defense/curious_cop go_look)
(set boss_music_2 false)
(sleep_until
(volume_test_objects prisoner_release
(ai_actors doctor_defense/curious_cop)) 1)
(device_set_position free_prisoner 1.00)
(set possession_path 4)
(set possessing_cop true)
(ai_set_disguise_known doctor_defense possessed true)
(wake prisoner_friends)
(game_save_cancel)
(game_save_no_timeout)
(sleep 90)
(sleep 15)
(device_group_set backway 1.00)
(print )))

(script dormant void security_possession
(begin
(device_group_set_immediate security_opener 1.00)
(sleep 90)
(set boss_music_2 false)
(activate_nav_point_object default security_possession detention_opener 0.05)
(activate_nav_point_object default security_possession detention_opener 0.05)
(if
(<
(ai_living_count lieutenants) possession_lts)
(ai_command_list lieutenants/security_cops security_run))
(set possessing_cop true)
(begin
(ai_place guards/desk_switch_guard)
(ai_place guards/wander_squads)
(ai_place guards/detention_guards))
(ai_set_current_state forensics alert)
(ai_erase doctor_defense)
(sleep 15)
(set boss_music_1 true)
(ai_place riot_defense/riot_02)
(device_group_set backway 1.00)
(print )
(sleep_until
(volume_test_objects trigger_jigup
(players_current)))
(game_save_cancel)
(game_save_no_timeout)
(sleep_until
(=
(device_group_get detention_opener) 1.00))
(deactivate_nav_point_object security_possession detention_opener)
(deactivate_nav_point_object security_possession detention_opener)
(activate_nav_point_object default security_possession stubbs_opener 0.05)
(activate_nav_point_object default security_possession stubbs_opener 0.05)
(ai_command_list guards/desk_guards_b draw_02)
(ai_command_list guards/desk_guards_e draw)
(ai_command_list guards/desk_guards_f draw)
(ai_command_list guards/desk_guards_g draw)
(set boss_music_1 false)
(sleep 30)
(print )
(ai_try_to_fight_player guards/desk_guards_b)))

(script dormant void shooting_spree
(begin
(sleep_until
(>=
(ai_disguise_knowledge_count guards/wander_squads possessed) 4))
(print the jig is up)
(device_group_set_immediate riot_defense_opener 1.00)
(ai_place riot_defense)
(ai_magically_see_players guards/wander_squads)
(ai_magically_see_players riot_defense)
(ai_try_to_fight_player riot_defense)))

(script startup void need_more_cops
(begin
(sleep_until
(volume_test_objects trigger_reinforcements
(ai_actors lieutenants)))
(ai_magically_see_players guards/desk_guards_c)
(ai_try_to_fight_player guards/desk_guards_c)))

(script startup void open_cells_01
(begin
(sleep_until
(=
(device_group_get cell_opener_01) 1.00))
(print running)
(ai_place doctor_defense/breakout)
(ai_set_disguise_known doctor_defense possessed true)
(ai_berserk doctor_defense true)
(ai_magically_see_players doctor_defense)
(ai_allegiance sheep possessed)
(sleep 15)
(ai_force_active prisoners_enc/convicts_02 true)
(object_create alarm)
(object_create alarm_02)
(object_create alarm_03)
(object_create alarm_04)
(object_create alarm_05)
(ai_command_list prisoners_enc/convicts_02 prison_run)
(ai_allegiance_remove sheep cop)))

(script startup void open_cells_02
(begin
(sleep_until
(=
(device_group_get cell_opener_02) 1.00))
(ai_allegiance sheep possessed)
(print running)
(ai_set_disguise_known doctor_defense possessed true)
(ai_berserk doctor_defense true)
(ai_magically_see_players doctor_defense)
(sleep 15)
(object_create alarm_06)
(object_create alarm_07)
(object_create alarm_08)
(ai_erase riot_defense)
(ai_force_active prisoners_enc/convicts_02 true)
(ai_command_list prisoners_enc/convicts_01 prison_run)
(ai_allegiance_remove sheep cop)))

(script startup void open_stubbscell
(begin
(sleep_until
(=
(device_group_get stubbs_opener) 1.00))
(deactivate_nav_point_object open_stubbscell stubbs_opener)
(deactivate_nav_point_object open_stubbscell stubbs_opener)
(ai_erase guards)
(ai_allegiance_remove sheep cop)))

(script continuous void nab_the_guard
(begin
(if
(or
(volume_test_object hand_crawl nab_the_guard)
(volume_test_object hand_crawl_02 nab_the_guard)
(volume_test_object hand_crawl_03 nab_the_guard)
(volume_test_object hand_crawl_04 nab_the_guard)
(volume_test_object vent_hide nab_the_guard))
(ai_disregard nab_the_guard true)
(ai_disregard nab_the_guard false))))

(script continuous void nab_the_guard_p2
(begin
(if
(or
(volume_test_object hand_crawl nab_the_guard_p2)
(volume_test_object hand_crawl_02 nab_the_guard_p2)
(volume_test_object hand_crawl_03 nab_the_guard_p2)
(volume_test_object hand_crawl_04 nab_the_guard_p2)
(volume_test_object vent_hide nab_the_guard_p2))
(ai_disregard nab_the_guard_p2 true)
(ai_disregard nab_the_guard_p2 false))))

(script continuous void flash_lights
(begin
(device_group_set cell_flasher_a 1.00)
(sleep 15)
(device_group_set cell_flasher_b 1.00)
(sleep 15)
(device_group_set cell_flasher_a 0.00)
(sleep 15)
(device_group_set cell_flasher_b 0.00)
(sleep 15)))

(script dormant void riot_capture_fake_foley
(begin
(sleep 60)
(sound_impulse_start sound\cinematics\a40\riot_foley none 1.00)))

(script startup void main_path
(begin
(set in_detention false)
(set forensic_fight false)
(sleep_until
(volume_test_objects main_flr_start
(players_current)) 15)
(wake entry_floor)
(sleep_until
(volume_test_objects detention_mug
(players_current)) 15)
(objects_cannot_take_damage
(players_current) true)
(fade_out 0.00 0.00 0.00 0)
(sleep 5)
(player_enable_input false)
(player_camera_control false)
(volume_teleport_players_not_inside player_return checkpoint_01)
(if
(game_is_cooperative)
(object_teleport main_path hidden_grubbs))
(device_operates_automatically_set riot_jump true)
(ai_place floor_01_end)
(ai_berserk floor_01_end true)
(ai_braindead exit_defenders true)
(ai_erase z_crypt)
(objects_cannot_take_damage
(ai_actors floor_01_end) true)
(player_force_respawn)
(sleep 5)
(cinematic_start)
(image_effect_set image_effects\technicolor)
(ai_disregard
(players_current) true)
(camera_control true 0)
(camera_set riot_01 0)
(wake riot_capture_fake_foley)
(fade_in 0.00 0.00 0.00 15)
(sleep 45)
(camera_set riot_02 30)
(sleep 60)
(camera_set riot_capture 0)
(sleep 30)
(fade_out 0.00 0.00 0.00 90)
(sleep 91)
(cinematic_stop)
(wake detention_start)
(sleep_until
(or
(volume_test_objects tunnel_crawl
(players_current))
(and
(=
(device_group_get coop_lock) 1.00)
(game_is_cooperative))))
(if
(and
(=
(device_group_get coop_lock) 1.00)
(game_is_cooperative))
(begin
(print coop stuff here)
(print coop stuff here)
(deactivate_nav_point_flag main_path airduct_flag)
(wake blow_vents)
(object_destroy wind_01)
(object_destroy wind_02)
(object_destroy wind_03)
(object_destroy wind_04)
(object_create wind_01)
(object_create wind_02)
(object_create wind_03)
(object_create wind_04))
(begin
(wake wrong_way_def)
(ai_place poss_prisoner)
(ai_place lieutenants)
(set possession_lts
(ai_living_count lieutenants))
(ai_place off_room_01)
(sleep_until
(or
(=
(ai_living_count poss_prisoner) 0)
(<
(ai_living_count lieutenants) possession_lts)
(<=
(ai_living_count off_room_01) 6)))
(if
(=
(ai_living_count poss_prisoner) 0)
(wake prisoner_possession)
(if
(or
(<=
(ai_living_count lieutenants) 1)
(<=
(ai_living_count off_room_01) 6))
(begin
(wake cop_remarks)
(wake security_possession)
(set possessing_cop true))))
(sleep_until
(volume_test_objects trigger_holding_cell
(players_current)))))
(sleep_until
(or
(and
(volume_test_objects trigger_body_switch
(players_origin))
(= possessing_cop true)
(=
(device_get_position holding_door) 1.00)
(not forensic_fight))
(and
(volume_test_objects coop_body_switch
(players_origin))
(game_is_cooperative))) 1)
(ai_place doctor_defense/breakout)
(ai_set_disguise_known doctor_defense possessed true)
(ai_berserk doctor_defense true)
(wake jail_break)
(sleep_until
(volume_test_objects trigger_endgame
(players_origin)))
(game_save_cancel)
(sleep_until
(=
(game_safe_to_save) true))
(fade_out 0.00 0.00 0.00 30)
(player_enable_input false)
(player_camera_control false)
(show_hud false)
(sleep 30)
(game_won)))

(script static void checkpoint1
(begin
(object_teleport checkpoint1 checkpoint_01)
(object_teleport checkpoint1 checkpoint_01a)))

(script static void checkpoint2
(begin
(switch_bsp 2)
(player_set_profile checkpoint2 enable_hand false)
(player_set_profile checkpoint2 enable_hand false)
(device_group_set_immediate security_opener 1.00)
(wake showdown)
(object_teleport checkpoint2 checkpoint_02)
(sleep_until
(volume_test_objects trigger_endgame
(players_origin)))
(game_save_cancel)
(sleep_until
(=
(game_safe_to_save) true))
(fade_out 0.00 0.00 0.00 30)
(game_revert)))

(script continuous void enable_hand_music
(begin
(if
(and
(not
(game_is_cooperative))
(>
(list_count
(players_nonorigin)) 0)
(not
(object_is_instance enable_hand_music characters\head\head))
(not enable_hand_music))
(set hand_music true)
(set hand_music false))))

(script continuous void hand_music_script
(begin
(sleep_until
(and
(= hand_music true)
(= boss_music_1 false)
(= boss_music_2 false)
(not hand_music_script)) 1)
(print hand_music: on)
(sound_looping_start sound\music\hand_5\hand_5 none 0.75)
(sleep_until
(or
(= hand_music false)
(= boss_music_1 true)
(= boss_music_2 true) hand_music_script) 1)
(print hand_music: off)
(sound_looping_stop sound\music\hand_5\hand_5)))

(script continuous void boss_music_1_script
(begin
(sleep_until
(and
(= boss_music_1 true)
(not boss_music_1_script)) 1)
(if hand_music
(sleep 30))
(print boss_music_1: on)
(sound_looping_start sound\music\hand_1\hand_1 none 0.70)
(sleep_until
(or
(= boss_music_1 false) boss_music_1_script) 1)
(print boss_music_1: off)
(sound_looping_stop sound\music\hand_1\hand_1)))

(script continuous void boss_music_2_script
(begin
(sleep_until
(and
(= boss_music_2 true)
(not boss_music_2_script)) 1)
(if hand_music
(sleep 30))
(print boss_music_2: on)
(sound_looping_start sound\music\hand_2\hand_2 none 0.50)
(sleep_until
(or
(= boss_music_2 false) boss_music_2_script) 1)
(print boss_music_2: off)
(sound_looping_stop sound\music\hand_2\hand_2)))

(script continuous void muster_music_script
(begin
(sleep_until
(and
(= muster_music true)
(not muster_music_script)) 1)
(if hand_music
(sleep 30))
(print muster_music: on)
(sound_looping_start sound\music\a40\battle_muster\battle_muster none 0.50)
(sleep_until
(or
(= muster_music false) muster_music_script) 1)
(print boss_music_2: off)
(sound_looping_stop sound\music\a40\battle_muster\battle_muster)))

(script stub void shot_list_gastopia_2
(begin
(print merging)))

(script stub void shot_list_gastopia_3
(begin
(print merging)))

(script dormant void gastopia_dialog
(begin
(sleep 10)
(sound_impulse_start sound\dialog\a40\pumpbot01 pumpy 1.00)
(sleep 41)
(sound_impulse_start sound\dialog\a40\hannity01 hannity 1.00)
(sleep 28)
(sound_impulse_start sound\dialog\a40\pumpbot02 pumpy 1.00)
(sleep 21)
(sound_impulse_start sound\dialog\a40\hannity02 hannity 1.00)
(sleep 98)
(sound_impulse_start sound\dialog\a40\pumpbot03 pumpy 1.00)
(sleep 117)
(sound_impulse_start sound\dialog\a40\hannity03 hannity 1.00)
(sleep 52)
(sound_impulse_start sound\dialog\a40\pumpbot04 pumpy 1.00)
(sleep 64)
(sound_impulse_start sound\dialog\a40\hannity04 hannity 1.00)
(sleep 38)
(sound_impulse_start sound\dialog\a40\pumpbot05 pumpy 1.00)
(sleep 135)
(sound_impulse_start sound\dialog\a40\pumpbot06 pumpy 1.00)
(sleep 109)
(sound_impulse_start sound\dialog\a40\pumpbot07 pumpy 1.00)
(sleep 171)
(sound_impulse_start sound\dialog\a40\pumpbot08 pumpy 1.00)
(sleep 64)
(sound_impulse_start sound\dialog\a40\hannity05 hannity 1.00)
(sound_impulse_start sound\dialog\a40\dupe01 dupe 1.00)
(sleep 30)
(sound_impulse_start sound\dialog\a40\dupe02 dupe 1.00)
(sleep 54)
(sound_impulse_start sound\dialog\a40\pumpbot09 pumpy 1.00)
(sleep 86)
(sound_impulse_start sound\dialog\a40\hannity06 hannity 1.00)
(sleep 122)
(sound_impulse_start sound\dialog\a40\pumpbot10 pumpy 1.00)
(sleep 122)
(sound_impulse_start sound\dialog\a40\hannity07 hannity 1.00)
(sleep 44)
(sound_impulse_start sound\dialog\a40\pumpbot11 pumpy 1.00)
(sleep 96)
(sound_impulse_start sound\dialog\a40\hannity08 hannity 1.00)
(sleep 184)
(if
(not gdc_demo)
(begin
(sound_impulse_start sound\dialog\a40\pumpbot12 pumpy 1.00)
(sleep 140)
(sound_impulse_start sound\dialog\a40\hannity09 hannity 1.00)
(sleep 73)
(sound_impulse_start sound\dialog\a40\pumpbot13 pumpy 1.00)
(sleep 62)
(sound_impulse_start sound\dialog\a40\pumpbot14 pumpy 1.00)
(sleep 4)
(sound_impulse_start sound\dialog\a40\hannity10 hannity 1.00)
(sleep 25)
(sound_impulse_start sound\dialog\a40\pumpbot15 pumpy 1.00)
(sleep 245)
(sound_impulse_start sound\dialog\a40\pumpbot16 pumpy 1.00)
(sleep 368)
(sound_impulse_start sound\dialog\a40\hannity11 hannity 1.00)
(sleep 64)
(sound_impulse_start sound\dialog\a40\dupe03 dupe 1.00)
(sleep 137)
(sound_impulse_start sound\dialog\a40\dupe04 dupe 1.00)
(sleep 100)
(sleep 206)
(sound_impulse_start sound\dialog\a40\stubbs01 stubbs_1 1.00)
(sleep 266)
(sleep 645))
(begin
(sound_impulse_start sound\dialog\a40\dupe03 dupe 1.00)
(sleep 137)
(sound_impulse_start sound\dialog\a40\dupe04 dupe 1.00)
(sleep 380)
(sound_impulse_start sound\dialog\a40\stubbs_belch stubbs_1 0.50)))))

(script dormant void fire_gun
(begin
(sleep 6)
(effect_new_on_object weapons\pistol\fire 15_pistol_1)
(sleep 22)
(effect_new_on_object weapons\pistol\fire 15_pistol_1)
(sleep 22)
(effect_new_on_object weapons\pistol\fire 15_pistol_1)
(sleep 21)
(effect_new_on_object weapons\pistol\fire 15_pistol_1)
(sleep 24)
(effect_new_on_object weapons\pistol\fire 15_pistol_1)))

(script static void stubbs_drives_off
(begin
(if
(= test 15)
(begin
(fade_in 0.00 0.00 0.00 0) stubbs_drives_off))
(object_create 15_hannity_1)
(object_create 15_stubbs_1)
(object_create 15_copcar_1)
(unit_custom_animation_at_frame 15_hannity_1 cinematics\animations\beat_cop\a40\a40 hannity10d false 1)
(camera_set 15_01 0)
(sleep 60)
(unit_custom_animation_at_frame 15_hannity_1 cinematics\animations\beat_cop\a40\a40 hannity10d false 60)
(unit_custom_animation_at_frame 15_stubbs_1 cinematics\animations\stubbs\a40\a40 stubbs10e false 60)
(camera_set 15_02 0)
(sleep 60)
(unit_custom_animation_at_frame 15_stubbs_1 cinematics\animations\stubbs\a40\a40 stubbs10e2quick false 90)
(unit_custom_animation_at_frame 15_copcar_1 cinematics\animations\cop_car\a40\a40 cop_car02_quick false 90)
(camera_set 15_02b 0)
(object_destroy 15_hannity_1)
(sleep 130)
(object_create 15_zombie_1)
(object_create 15_pistol_1)
(object_create 15_hannity_1)
(objects_attach 15_hannity_1 weapon 15_pistol_1 trigger hand)
(unit_custom_animation_at_frame 15_hannity_1 cinematics\animations\beat_cop\a40\a40 hannity10e false 120)
(unit_custom_animation_at_frame 15_zombie_1 cinematics\animations\zombie_cop\a40\a40 zombie_dupe10e false 120)
(wake fire_gun)
(camera_set z 0)
(sleep 15)
(camera_set aa 120)
(object_create cop_car_5)
(object_create stubbs_5)
(unit_enter_vehicle_now stubbs_5 cop_car_5 cr-driver)
(sleep
(-
(unit_get_custom_animation_time 15_hannity_1) 90.00))
(object_destroy 15_stubbs_1)
(object_destroy 15_copcar_1)
(recording_play cop_car_5 cop_car_stubbs)
(custom_animation stubbs_5 cinematics\animations\stubbs\a40\a40 stubbs10g true)
(custom_animation cop_car_5 cinematics\animations\cop_car\a40\a40 wiper_siren_trunk_cinema false)
(sleep 60)
(camera_set_relative ae 0 cop_car_5)
(object_destroy 15_hannity_1)
(object_destroy 15_zombie_1)
(sleep 50)
(object_create 15_copcar_3)
(object_create 15_civ_1)
(unit_set_seat 15_civ_1 alert)
(object_create 15_civ_2)
(unit_set_seat 15_civ_2 alert)
(recording_play 15_copcar_3 15_copcar_3)
(recording_play 15_civ_1 15_civ_1)
(recording_play 15_civ_2 15_civ_1)
(unit_enter_vehicle_now 15_stubbs_2 15_copcar_3 cr-driver)
(sleep 30)
(sleep 30)
(camera_set 15_05 0)
(sleep 30)
(object_destroy cop_car_5)
(custom_animation 15_civ_1 characters\beat_cop\beat_cop stand pistol dive l true)
(sleep 10)
(custom_animation 15_civ_2 characters\beat_cop\beat_cop stand pistol dive r true)
(object_create 15_copcar_2)
(object_create 15_stubbs_2)
(recording_play 15_copcar_2 15_copcar_2)
(sleep 60)
(camera_set_relative 15_04 0 15_copcar_2)
(sleep 65)
(fade_out 0.00 0.00 0.00 0)
(sleep 1)
(switch_bsp 1)
(object_activation_add_camera 15_06)
(object_create 15_inmate_1)
(object_create 15_inmate_2)
(object_create 15_stubbs_3)
(camera_set 15_06 0)
(fade_in 0.00 0.00 0.00 30)
(sleep 30)
(print stubbs stands up into frame)
(sleep 30)
(camera_set 15_07 60)
(sleep 30)
(recording_play 15_inmate_1 15_inmate_1)
(recording_play 15_inmate_2 15_inmate_2)
(sleep 60)
(fade_out 0.00 0.00 0.00 0)))

(script static void stubbs_walks_to_station
(begin
(object_create 15_stubbs_4)
(recording_play 15_stubbs_4 15_stubbs_4)
(ai_place 15_civilians_1)
(sleep 15)
(if
(= test 15)
(begin
(fade_in 0.00 0.00 0.00 0) stubbs_walks_to_station))
(sound_looping_start sound\cinematics\a40\10_foley_2 none 1.00)
(camera_set 15_09 0)
(fade_in 0.00 0.00 0.00 15)
(sleep 50)
(camera_set 15_10 0)
(sleep 80)
(object_destroy 15_stubbs_4)
(sleep 30)
(camera_set 15_11 60)
(sleep 30)
(camera_set 15_12b 60)
(sleep 90)
(sound_looping_predict sound\cinematics\a40\10_foley_3)
(fade_out 0.00 0.00 0.00 30)
(sleep 31)
(switch_bsp 1)
(sound_looping_start sound\cinematics\a40\10_foley_3 none 1.00)
(object_activation_add_camera 15_13)
(ai_place 10_inmate_1)
(sleep 30)
(object_create 15_stubbs_3)
(camera_set 15_13 0)
(fade_in 0.00 0.00 0.00 30)
(sleep 5)
(sound_impulse_start sound\dialog\a40\10_stubbs_3 15_stubbs_3 0.40)
(sleep 63)
(sound_impulse_start sound\dialog\inmate_1\surprise
(list_get
(ai_actors 10_inmate_1) 0) 1.00)
(sleep 2)
(sound_impulse_start sound\dialog\inmate_2\surprise
(list_get
(ai_actors 10_inmate_1) 1) 1.00)
(sleep 1)
(sound_impulse_start sound\dialog\inmate_1\surprise
(list_get
(ai_actors 10_inmate_1) 2) 1.00)
(sleep 19)
(camera_set 15_14 0)
(custom_animation 15_stubbs_3 cinematics\animations\stubbs\a40_15\a40_15 a40_15_stubbs_1 false)
(sleep
(unit_get_custom_animation_time 15_stubbs_3))
(fade_out 0.00 0.00 0.00 0)
(ai_erase 10_inmate_1)
(ai_erase 15_civilians_1)
(object_destroy 15_stubbs_3)))

(script static void shot_list_gastopia
(begin
(object_beautify pumpy true)
(unit_set_seat pumpbot asleep)
(unit_set_seat pumpy asleep)
(object_create dupe_2)
(object_beautify dupe_2 true)
(object_create hannity_2)
(object_beautify hannity_2 true)
(unit_enter_vehicle_now hannity_2 cop_car_1b cr-driver)
(unit_enter_vehicle_now dupe_2 cop_car_1b cr-passenger)
(sleep 5)
(if gdc_demo
(sound_looping_start sound\cinematics\a40\foleygdc none 0.75)
(sound_looping_start sound\cinematics\a40\foley01 none 0.75))
(unit_set_seat ted alert)
(unit_set_seat ted_2 alert)
(unit_set_seat judy_2 alert)
(recording_play ted ted_walk)
(recording_play ted_2 ted_2_walk)
(recording_play judy_2 ted_2_walk)
(recording_play cop_car_1b cop_car_opening)
(camera_set_relative a 0 cop_car_1b)
(fade_in 0.00 0.00 0.00 0)
(sleep 120)
(recording_play gaspumper gaspumper)
(recording_play ted_3 ted_3)
(recording_play ted_4 ted_4)
(camera_set_relative b 90 cop_car_1b)
(sleep 150)
(object_create cop_car)
(object_teleport cop_car cop_car_reset)
(recording_play cop_car cop_car_1)
(sleep 30)
(object_destroy cop_car_1b)
(unit_enter_vehicle_now hannity_2 cop_car cr-driver)
(unit_enter_vehicle_now dupe_2 cop_car cr-passenger)
(camera_set d 0)
(sleep 30)
(object_create cop_car_2)
(object_create hannity)
(object_create dupe)
(object_beautify hannity true)
(object_beautify dupe true)
(object_create dupe_gun)
(objects_attach dupe holster dupe_gun trigger hand)
(object_create gun_hannity)
(objects_attach hannity holster gun_hannity trigger hand)
(unit_enter_vehicle_now hannity cop_car_2 cr-driver)
(unit_enter_vehicle_now dupe cop_car_2 cr-passenger)
(recording_play cop_car_2 pull_into_gastopia2)
(sleep 30)
(object_create ted_5)
(recording_play ted_5 ted_5)
(camera_set e 0)
(sleep 30)
(object_destroy cop_car)
(object_destroy hannity_2)
(object_destroy dupe_2)
(sleep 70)
(camera_set f 0)
(sleep 75)
(object_destroy ted_5)
(camera_set g2 0)
(sleep 90)
(sleep 30)
(cinematic_set_near_clip_distance 0.01)
(custom_animation pumpy cinematics\animations\pumpbot\a40\a40 pumpbot10b false)
(custom_animation cop_car_2 cinematics\animations\cop_car\a40\a40 cop_car01 false)
(custom_animation dupe cinematics\animations\beat_cop\a40\a40 dupe10b false)
(custom_animation hannity cinematics\animations\beat_cop\a40\a40 hannity10b false)
(sound_impulse_start sound\cinematics\a40\pumpbot_activate pumpy 0.00)
(camera_set h 0)
(sleep 30)
(object_create car1)
(recording_play car1 car1)
(object_destroy ted)
(object_destroy ted_2)
(object_destroy judy_2)
(camera_set i 0)
(sleep 18)
(wake gastopia_dialog)
(sleep 197)
(object_create car2)
(recording_play car2 car2)
(camera_set j 0)
(sleep 95)
(camera_set k 0)
(sleep 142)
(object_create cop_car_gascap)
(objects_attach pumpy gascap cop_car_gascap gascap)
(sleep 88)
(camera_set l 0)
(sleep 270)
(camera_set m 0)
(sleep 75)
(camera_set n 0)
(sleep 30)
(camera_set o 0)
(sleep 50)
(camera_set p 0)
(sleep 95)
(camera_set o 0)
(sleep 60)
(object_create car3)
(recording_play car3 car3)
(camera_set p 0)
(sleep 120)
(object_destroy ted_3)
(camera_set n 0)
(sleep 40)
(unit_custom_animation_at_frame hannity cinematics\animations\beat_cop\a40\a40 hannity10c true 90)
(sleep 120)
(camera_set q 0)
(sleep 150)
(camera_set r2 180)
(object_destroy car1)
(object_destroy car2)
(object_destroy car3)
(object_create_anew dupe)
(unit_set_weapon dupe none)
(object_beautify dupe true)
(object_create_anew dupe_gun)
(objects_attach dupe holster dupe_gun trigger hand)
(sleep 150)
(if
(not gdc_demo)
(begin
(camera_set r 6)
(sleep 154)
(camera_set r2 6)
(sleep 153)
(camera_set r 6)
(sleep 606)
(camera_set r2 6)
(objects_detach hannity gun_hannity)
(objects_attach hannity weapon gun_hannity trigger hand)
(sleep
(-
(unit_get_custom_animation_time pumpy) 40.00))))
(unit_custom_animation_at_frame outhousedoor characters\outhousedoor\outhousedoor outhouse door false 30)
(camera_set s 0)
(sleep 30)
(custom_animation dupe cinematics\animations\beat_cop\a40\a40 dupe10d false)
(sleep 60)
(camera_set t 60)
(sleep 90)
(unit_exit_vehicle hannity)
(object_create stubbs_1)
(custom_animation stubbs_1 cinematics\animations\stubbs\a40\a40 stubbs10d false)
(camera_set u 0)
(sleep 33)
(object_set_permutation outhousedoor __unnamed ~damaged)
(effect_new_on_object effects\woodsplinter outhousedoor)
(sleep 27)
(camera_set v 90)
(effect_new_on_object effects\braineating dupe)
(sleep 90)
(custom_animation stubbs_1 cinematics\animations\stubbs\a40\a40 stubbs10d2 true)
(sleep 40)
(effect_new_on_object effects\woodsplinter_large outhousedoor)
(sleep 20)
(camera_set v 60)
(sleep
(-
(unit_get_custom_animation_time stubbs_1) 45.00))
(unit_custom_animation_at_frame hannity cinematics\animations\beat_cop\a40\a40 hannity10d false 30)
(unit_custom_animation_at_frame stubbs_1 cinematics\animations\stubbs\a40\a40 stubbs10e false 30)
(unit_custom_animation_at_frame pumpy cinematics\animations\pumpbot\a40\a40 pumpbot10e false 30)
(object_destroy dupe)
(fade_out 0.00 0.00 0.00 0)
(sound_looping_stop sound\cinematics\a40\foleygdc)
(sound_looping_predict sound\cinematics\a40\10_foley_2)
(sleep 30) shot_list_gastopia
(object_destroy outhousedoor)))

(script static void a40_10_run
(begin
(fade_out 0.00 0.00 0.00 0) a40_10_run
(camera_set_relative a 0 cop_car_1b)
(sound_class_set_gain vehicle_engine 0.00 0)
(object_activation_add_object pumpbot)
(if gdc_demo
(sound_looping_predict sound\cinematics\a40\foleygdc)
(sound_looping_predict sound\cinematics\a40\foley01))
(game_skip_ticks 15)
(sleep 15)
(game_skip_ticks 15)
(sleep 15)
(print a40_10:  gastopia) a40_10_run
(fade_out 0.00 0.00 0.00 0)
(sound_class_set_gain vehicle_engine 1.00 0) a40_10_run
(object_activation_clear)))

(script static void cutscene_gastopia
(begin
(if
(= show_cutscenes true) cutscene_gastopia)))

(script dormant void hand_animation
(begin
(custom_animation cinematic_hand_2 characters\hand\hand possess unarmed idle true)
(sleep
(unit_get_custom_animation_time cinematic_hand_2))
(custom_animation cinematic_hand_2 characters\hand\hand possess unarmed idle true)
(sleep
(unit_get_custom_animation_time cinematic_hand_2))
(custom_animation cinematic_hand_2 characters\hand\hand possess unarmed idle true)
(sleep
(unit_get_custom_animation_time cinematic_hand_2))
(custom_animation cinematic_hand_2 characters\hand\hand possess unarmed idle true)))

(script static void shot_list_detention_rescue
(begin
(fade_out 0.00 0.00 0.00 0)
(if
(object_is_instance shot_list_detention_rescue characters\beat_cop\beat_cop)
(set zombie_bill zombie_bill_beat_cop))
(if
(object_is_instance shot_list_detention_rescue characters\lt_cop\lt_cop)
(set zombie_bill zombie_bill_lt_cop))
(object_create exam_table_2)
(object_create stubbs_exam_table)
(object_create zombie_bill)
(object_teleport zombie_bill zombie_bill_start)
(object_create cinematic_hand_2)
(object_beautify zombie_bill true)
(object_beautify stubbs_exam_table true)
(object_activation_add_object exam_table_2)
(object_set_permutation stubbs_exam_table armleft ~damaged)
(object_clone_state zombie_bill shot_list_detention_rescue false)
(objects_attach zombie_bill possess cinematic_hand_2 )
(wake hand_animation)
(sound_class_set_gain weapon_ready 0.00 0)
(unit_set_seat
(unit zombie_bill) alert)
(sleep 50)
(recording_play
(unit zombie_bill) zombie_bill_walk)
(sound_looping_predict sound\cinematics\a40\30_foley_1)
(sleep 20)
(sound_looping_start sound\cinematics\a40\rescue_foley none 1.00)
(sleep 10)
(sound_looping_start sound\cinematics\a40\30_foley_1 none 0.60)
(sound_class_set_gain weapon_ready 1.00 0)
(camera_set 3a 0)
(fade_in 0.00 0.00 0.00 0)
(sleep 70)
(camera_set 3b_2 0)
(custom_animation
(unit zombie_bill) cinematics\animations\beat_cop\a40\a40 a40_10_k_bill2 false)
(custom_animation stubbs_exam_table cinematics\animations\stubbs\a40\a40 a40_10_k_stubbs2 false)
(sleep 50)
(device_set_position exam_table_2 1.00)
(sleep 79)
(camera_set 3c 0)
(sleep 15)
(object_destroy cinematic_hand_2)
(effect_new_on_flag cinematics\effects\a40\smack_hand_off_head hand_smack)
(sleep 55)
(sound_impulse_start sound\dialog\stubbs\eat_brains stubbs_exam_table 0.75)
(sleep 5)
(effect_new_on_object effects\braineating zombie_bill)
(sleep 140)
(camera_set 3d 0)
(sleep 30)
(object_set_permutation stubbs_exam_table armleft __base)
(sound_impulse_start sound\cinematics\a40\stubbs_grunt none 1.00)
(sleep
(-
(unit_get_custom_animation_time stubbs_exam_table) 60.00))
(fade_out 0.00 0.00 0.00 0)
(object_destroy exam_table_2)
(object_destroy stubbs_exam_table)
(object_destroy cinematic_hand_2)
(unit_stop_custom_animation
(unit zombie_bill))
(unit_kill_silent
(unit zombie_bill))
(sleep 10)
(object_teleport zombie_bill zombie_bill_dies)))

(script static void shot_list_detention
(begin
(object_create scientist_01)
(object_create scientist_02)
(object_create exam_table)
(object_create stubbs_exam_table)
(object_create science_stick_1)
(object_create science_stick_2)
(object_create guts)
(objects_attach scientist_01 meleel science_stick_1 science_stick)
(objects_attach scientist_02 meleer science_stick_2 science_stick)
(object_activation_add_object exam_table)
(object_create 30_masters_1)
(object_beautify 30_masters_1 true)
(unit_custom_animation_at_frame scientist_01 cinematics\animations\scientist\a40\a40 a40_10_k_scientist1 false 75)
(unit_custom_animation_at_frame scientist_02 cinematics\animations\scientist\a40\a40 a40_10_k_scientist2 false 75)
(unit_custom_animation_at_frame stubbs_exam_table cinematics\animations\stubbs\a40\a40 a40_10_j_stubbs false 35)
(sound_looping_start sound\cinematics\a40\20_foley_1 none 0.60)
(camera_set 2_a 0)
(fade_in 0.00 0.00 0.00 90)
(camera_set 2_c_2 210)
(sleep 90)
(sound_impulse_start sound\cinematics\a40\exam none 1.00)
(sleep 130)
(objects_attach science_stick_2 gutend guts bloodguts)
(sleep
(unit_get_custom_animation_time stubbs_exam_table))
(unit_custom_animation_at_frame stubbs_exam_table cinematics\animations\stubbs\a40\a40 a40_10_j_stubbs true 0)
(sleep 42)
(objects_detach science_stick_2 guts)
(effect_new_on_flag effects\zombie\zombie-blood-decal guts_land)
(object_teleport guts guts_land)
(sleep 118)
(camera_video_enable true)
(camera_video_set 2_ab)
(object_activation_add_camera 2_ab)
(unit_custom_animation_at_frame stubbs_exam_table cinematics\animations\stubbs\a40\a40 a40_10_j_stubbs false 0)
(unit_custom_animation_at_frame scientist_01 cinematics\animations\scientist\a40\a40 a40_10_k_02_scientist1 false 358)
(unit_custom_animation_at_frame scientist_02 cinematics\animations\scientist\a40\a40 a40_10_k_02_scientist2 false 380)
(camera_set 2_ac 0)
(custom_animation 30_masters_1 cinematics\animations\masters\a40\a40 a40_20_masters_1 false)
(sleep 15)
(sound_impulse_start sound\dialog\a40\30_masters_1 30_masters_1 1.00)
(sleep
(unit_get_custom_animation_time scientist_01))
(object_destroy scientist_01)
(sleep 60)
(camera_set 2_aa 60)
(sleep 210)
(unit_custom_animation_at_frame stubbs_exam_table cinematics\animations\stubbs\a40\a40 a40_10_j_stubbs false 170)
(camera_set 2_ac 0)
(sleep
(unit_get_custom_animation_time stubbs_exam_table))
(camera_set 2_aa 0)
(sleep
(unit_get_custom_animation_time 30_masters_1))
(camera_video_enable false)
(camera_set 2_e 0)
(object_destroy 30_masters_1)
(object_create scientist_01)
(custom_animation stubbs_exam_table cinematics\animations\stubbs\a40\a40 a40_10_j_stubbs false)
(unit_custom_animation_at_frame scientist_01 cinematics\animations\scientist\a40\a40 a40_10_k_02_scientist1 false 60)
(unit_custom_animation_at_frame scientist_02 cinematics\animations\scientist\a40\a40 a40_10_k_02_scientist2 false 60)
(sound_impulse_start sound\dialog\a40\scientist01 scientist_02 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\a40\scientist01) 10.00))
(sound_impulse_start sound\dialog\a40\scientist02 scientist_01 1.00)
(sleep 10)
(camera_set 2_d 0)
(sleep
(sound_impulse_time sound\dialog\a40\scientist02))
(camera_set 2_e 0)
(camera_set 2_b 150)
(custom_animation stubbs_exam_table cinematics\animations\stubbs\a40\a40 a40_10_k_stubbs3 false)
(sound_impulse_start sound\dialog\a40\scientist03 scientist_02 1.00)
(sleep
(unit_get_custom_animation_time scientist_02))
(object_destroy scientist_01)
(object_destroy scientist_02)
(sleep 33)
(sound_impulse_start sound\sfx\impulse\hand\detach stubbs_exam_table 1.00)
(object_create cinematic_hand)
(object_set_permutation stubbs_exam_table armleft ~damaged)
(objects_attach stubbs_exam_table limbspawn cinematic_hand )
(sleep 90)
(sound_impulse_start sound\sfx\impulse\hand\throw none 1.00)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\throw_hand throw_hand)
(object_destroy cinematic_hand)
(sleep 10)
(fade_out 0.00 0.00 0.00 0)
(sleep 1)
(object_destroy exam_table)
(object_destroy stubbs_exam_table)
(object_destroy science_stick_1)
(object_destroy science_stick_2)
(garbage_collect_now)
(object_destroy guts)))

(script static void a40_20_run
(begin
(switch_bsp 2)
(object_teleport a40_20_run detention)
(fade_out 0.00 0.00 0.00 0) a40_20_run
(object_activation_add_object exam_table)
(sound_looping_predict sound\cinematics\a40\20_foley_1)
(sleep 30)
(print a40_20: detention) a40_20_run
(fade_out 0.00 0.00 0.00 0) a40_20_run
(object_activation_clear)))

(script static void cutscene_detention
(begin
(if
(= show_cutscenes true) cutscene_detention)))

(script static void a40_30_run
(begin
(switch_bsp 2)
(object_teleport a40_30_run detention)
(fade_out 0.00 0.00 0.00 0) a40_30_run
(object_activation_add_object exam_table)
(sound_looping_predict sound\cinematics\a40\rescue_foley)
(sleep 30)
(print a40_30: detention rescue) a40_30_run
(fade_out 0.00 0.00 0.00 0) a40_30_run
(object_activation_clear)))

(script static void cutscene_detention_rescue
(begin
(if
(= show_cutscenes true) cutscene_detention_rescue)))

(script static void cutscenes_off
(begin
(set show_cutscenes false)))

(script static void preview
(begin preview preview preview preview))

(script startup void test
(begin
(if
(> test 0) test)
(if
(= test 10) test)
(if
(= test 15) test)
(if
(= test 20) test)
(if
(= test 30) test)))

(script static void next_cutscene
(begin
(map_name levels\a45_dance\a45_dance_cutscene)))

(script static void unlockable_pickup
(begin
(damage_object equipment\hippo\hippo_pickup unlockable_pickup)
(if
(game_is_cooperative)
(damage_object equipment\hippo\hippo_pickup unlockable_pickup))))

(script static void stop_commentary
(begin
(sound_looping_stop sound\commentary\a40_police_station\a40_police_station_01)
(sound_looping_stop sound\commentary\a40_police_station\a40_police_station_02)))

(script dormant void unlock_comment_1
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_1) 0.00) 7) unlock_comment_1
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_1
(sound_looping_start sound\commentary\a40_police_station\a40_police_station_01 none 1.00)
(sleep
(* 30.00 15.00))
(sleep 60)))

(script dormant void unlock_comment_2
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_2) 0.00) 7) unlock_comment_2
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_2
(sound_looping_start sound\commentary\a40_police_station\a40_police_station_02 none 1.00)
(sleep
(* 30.00 15.00))
(sleep 60)))

(script startup void drop_hippos
(begin
(if
(map_completed normal)
(begin
(object_create_containing unlockable_hippo)
(sleep 10)
(wake unlock_comment_1)
(wake unlock_comment_2)))))