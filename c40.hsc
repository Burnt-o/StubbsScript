(global bool cutscene_running false)

(global bool far_int_save_enable false)

(global bool slow_grim_music false)

(global bool hand_music false)

(global bool intro_cinema_has_run false)

(global weapon nobody none)

(global weapon barrage_me none)

(global object_list barrage_mes nobody)

(global bool tankfight1 false)

(global bool saved_b false)

(global bool c_sniper false)

(global bool chubby_has_started false)

(global bool tank_d_saved false)

(global bool no_billboard false)

(global bool in_vehicle false)

(global bool tank4_dead false)

(global bool tank5_dead false)

(global cutscene camera point drown_flag water_drowned0)

(global real flag_distance 0.00)

(global vehicle teleport_player a60)

(global bool show_cutscenes false)

(global short test 0)

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

(script static void street_a_setup
(begin
(switch_bsp 0)
(object_teleport street_a_setup street_a_teleport)
(fade_in 0.00 0.00 0.00 0)))

(script static void street_b_setup
(begin
(switch_bsp 1)
(object_teleport street_b_setup street_b_teleport)
(fade_in 0.00 0.00 0.00 0)
(if intro_cinema_has_run
(game_save))
(print saving)))

(script static void street_c_setup
(begin
(switch_bsp 2)
(object_teleport street_c_setup street_c_teleport)
(fade_in 0.00 0.00 0.00 0)
(if intro_cinema_has_run
(game_save))
(print saving)))

(script static void street_d_setup
(begin
(switch_bsp 3)
(object_teleport street_d_setup street_d_teleport)
(fade_in 0.00 0.00 0.00 0)
(if intro_cinema_has_run
(game_save))
(print saving)))

(script static void plaza_setup
(begin
(switch_bsp 4)
(object_teleport plaza_setup plaza_teleport)
(fade_in 0.00 0.00 0.00 0)
(if intro_cinema_has_run
(game_save))
(print saving)))

(script static void checkpoint1
(begin checkpoint1))

(script static void checkpoint2
(begin checkpoint2))

(script static void checkpoint4
(begin checkpoint4))

(script static void checkpoint5
(begin checkpoint5))

(script static void checkpoint6
(begin checkpoint6))

(script static void c40_10
(begin
(if
(= show_cutscenes true) c40_10)))

(script static void c40_15
(begin
(if
(= show_cutscenes true) c40_15)))

(script stub void c40_20
(begin
(print c40_20 stub)))

(script static void cutscenes_on
(begin
(set show_cutscenes true)))

(script static void look_at_billboard
(begin
(player_enable_input false)
(player_camera_control false)
(camera_control true 0)
(camera_set billboard_look 60)
(sound_impulse_start sound\dialog\c40\10_maggie_1 billboard_2 1.00)
(sleep 90)
(player_enable_input true)
(player_camera_control true)
(camera_control false 60)))

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

(script startup void allegiance
(begin
(ai_allegiance zombie possessed)
(ai_allegiance zombie player)))

(script continuous void man_hole_a2
(begin
(sleep_until
(volume_test_objects trigger_manhole2
(players_current)))
(player_action_test_reset)
(sleep_until
(player_action_test_jump))
(sleep 3)
(apply_impulse trigger_manhole2 blower_manhole2 0.33 0.33 effects\tubes\wind)))

(script continuous void man_hole_a1
(begin
(sleep_until
(volume_test_objects trigger_manhole1
(players_current)))
(player_action_test_reset)
(sleep_until
(player_action_test_jump))
(apply_impulse trigger_manhole1 blower_manhole1 0.33 0.33 effects\tubes\wind)))

(script continuous void manhole_a3
(begin
(sleep_until
(volume_test_objects trigger_manhole3
(players_current)))
(player_action_test_reset)
(sleep_until
(player_action_test_jump))
(apply_impulse trigger_manhole3 blower_manhole3 0.33 0.33 effects\tubes\wind)))

(script continuous void man_hole_b1
(begin
(sleep_until
(volume_test_objects trigger_manhole_b1
(players_current)))
(player_action_test_reset)
(sleep_until
(player_action_test_jump))
(apply_impulse trigger_manhole_b1 blower_manhole_b1 0.33 0.33 effects\tubes\wind)))

(script continuous void man_hole_b2
(begin
(sleep_until
(volume_test_objects trigger_manhole_b2
(players_current)))
(player_action_test_reset)
(sleep_until
(player_action_test_jump))
(apply_impulse trigger_manhole_b2 blower_manhole_b2 0.33 0.33 effects\tubes\wind)))

(script continuous void man_hole_b3
(begin
(sleep_until
(volume_test_objects trigger_manhole_b3
(players_current)))
(player_action_test_reset)
(sleep_until
(player_action_test_jump))
(apply_impulse trigger_manhole_b3 blower_manhole_b3 0.33 0.33 effects\tubes\wind)))

(script continuous void man_hole_c1
(begin
(sleep_until
(volume_test_objects trigger_manhole_c1
(players_current)))
(player_action_test_reset)
(sleep_until
(player_action_test_jump))
(apply_impulse trigger_manhole_c1 blower_manhole_c1 0.33 0.33 effects\tubes\wind)))

(script continuous void man_hole_c2
(begin
(sleep_until
(volume_test_objects trigger_manhole_c2
(players_current)))
(player_action_test_reset)
(sleep_until
(player_action_test_jump))
(apply_impulse trigger_manhole_c2 blower_manhole_c2 0.33 0.33 effects\tubes\wind)))

(script continuous void man_hole_d1
(begin
(sleep_until
(volume_test_objects trigger_manhole_d1
(players_current)))
(player_action_test_reset)
(sleep_until
(player_action_test_jump))
(apply_impulse trigger_manhole_d1 blower_manhole_d1 0.33 0.33 effects\tubes\wind)))

(script continuous void zombie_killoff
(begin
(if
(>
(ai_living_count zombies_d/zombie_runoff) 5)
(begin
(unit_kill
(unit
(list_get
(ai_actors zombies_d/zombie_runoff) 0))))
(if
(>
(ai_living_count zombies_c/zombie_runoff) 5)
(begin
(unit_kill
(unit
(list_get
(ai_actors zombies_c/zombie_runoff) 0))))
(if
(>
(ai_living_count zombies_b/zombie_runoff) 5)
(begin
(unit_kill
(unit
(list_get
(ai_actors zombies_b/zombie_runoff) 0))))
(if
(>
(ai_living_count zombies_a/zombie_runoff) 5)
(begin
(unit_kill
(unit
(list_get
(ai_actors zombies_plaza/zombie_runoff) 0))))
(if
(>
(ai_living_count zombies_a/zombie_runoff) 5)
(begin
(unit_kill
(unit
(list_get
(ai_actors zombies_plaza/zombie_runoff) 0)))))))))))

(script startup void street_a1_1
(begin
(ai_set_resurrection_group zombies_a/zombie_squad)
(fade_out 0.00 0.00 0.00 0)
(object_teleport street_a1_1 hide_stubbs)
(object_teleport street_a1_1 hide_stubbs)
(ai_place existing_zombies_a/4)
(ai_place street_a/civ2)
(ai_place street_a/driver_jeep5) street_a1_1
(game_save_cancel)
(if street_a1_1 street_a1_1
(sleep 10))
(set intro_cinema_has_run true) street_a1_1
(game_save_cancel)
(game_save_no_timeout)
(ai_braindead street_a/driver_jeep5 true)
(ai_command_list street_a/driver_jeep5 a_drive_away)
(object_teleport street_a1_1 player0_start)
(object_teleport street_a1_1 player1_start)
(fade_in 0.00 0.00 0.00 0)
(sleep_until
(volume_test_objects trigger_street_a5_1
(ai_actors street_a/driver_jeep5)))
(vehicle_unload jeep5 je-driver)
(ai_kill street_a/driver_jeep5)
(ai_kill zombies_a/zombie_runoff)
(unit_set_enterable_by_player jeep5 true)))

(script startup void street_a1
(begin
(sleep 1)
(sleep_until
(volume_test_objects trigger_street_a1
(players_current)))
(ai_place street_a/civ1)
(ai_place street_a/civ1a)
(ai_place existing_zombies_a/1)
(ai_place street_a/civ5)
(ai_command_list street_a/civ1 flee1)
(ai_command_list street_a/civ1a a_flee2)
(ai_attack existing_zombies_a/1)))

(script startup void barrage_zom
(begin
(sleep 2)
(sleep_until
(volume_test_objects trigger_street_a2_1
(players_current)) 5)
(ai_place existing_zombies_a/3)
(ai_place existing_zombies_a/8)
(ai_command_list existing_zombies_a/3 into_barrage2)
(ai_command_list existing_zombies_a/8 into_barrage3)
(sound_impulse_start sound\dialog\army_sergeant_combat\sighed_enemy_zombie barrage 1.00)
(sleep 30)
(sound_impulse_start sound\dialog\c40\se_army_soldier_5 barrage 1.00)
(sleep_until intro_cinema_has_run)
(game_save_cancel)
(game_save_no_timeout)))

(script continuous void barrage
(begin
(sleep -1)
(sound_impulse_start sound\sfx\weapons\mortar_incoming\mortar none 1.00)
(sleep 8)
(sound_impulse_start sound\sfx\weapons\mortar_incoming\mortar none 1.00)
(sleep 4)
(effect_new_on_flag cinematics\effects\c40\artillery shelling1)
(sleep 14)
(effect_new_on_flag cinematics\effects\c40\artillery shelling2)
(sleep 8)
(effect_new_on_flag cinematics\effects\c40\artillery shelling3)
(sound_impulse_start sound\sfx\weapons\mortar_incoming\mortar none 1.00)
(effect_new_on_flag cinematics\effects\c40\artillery shelling5)
(sleep 14)
(sound_impulse_start sound\sfx\weapons\mortar_incoming\mortar none 1.00)
(effect_new_on_flag cinematics\effects\c40\artillery shelling4)
(sleep 14)
(effect_new_on_flag cinematics\effects\c40\artillery shelling3)
(sleep 8)
(effect_new_on_flag cinematics\effects\c40\artillery shelling1)
(sleep 20)
(sound_impulse_start sound\sfx\weapons\mortar_incoming\mortar none 1.00)
(effect_new_on_flag cinematics\effects\c40\artillery shelling2)
(sleep 8)
(effect_new_on_flag cinematics\effects\c40\artillery shelling4)
(effect_new_on_flag cinematics\effects\c40\artillery shelling7)
(sleep 14)
(effect_new_on_flag cinematics\effects\c40\artillery shelling9)
(sleep 8)
(effect_new_on_flag cinematics\effects\c40\artillery shelling8)
(effect_new_on_flag cinematics\effects\c40\artillery shelling10)
(sleep 14)
(sound_impulse_start sound\sfx\weapons\mortar_incoming\mortar none 1.00)
(effect_new_on_flag cinematics\effects\c40\artillery shelling12)
(sleep 35)
(effect_new_on_flag cinematics\effects\c40\artillery shelling8)
(sleep 8)
(effect_new_on_flag cinematics\effects\c40\artillery shelling7)
(sound_impulse_start sound\sfx\weapons\mortar_incoming\mortar none 1.00)
(effect_new_on_flag cinematics\effects\c40\artillery shelling10)
(sleep 8)
(effect_new_on_flag cinematics\effects\c40\artillery shelling11)
(effect_new_on_flag cinematics\effects\c40\artillery shelling16)
(sleep 6)
(sound_impulse_start sound\sfx\weapons\mortar_incoming\mortar none 1.00)
(effect_new_on_flag cinematics\effects\c40\artillery shelling18)
(effect_new_on_flag cinematics\effects\c40\artillery shelling11)
(sleep 14)
(effect_new_on_flag cinematics\effects\c40\artillery shelling13)
(sound_impulse_start sound\sfx\weapons\mortar_incoming\mortar none 1.00)
(effect_new_on_flag cinematics\effects\c40\artillery shelling11)
(sleep 8)
(effect_new_on_flag cinematics\effects\c40\artillery shelling17)
(sleep 14)
(sound_impulse_start sound\sfx\weapons\mortar_incoming\mortar none 1.00)
(effect_new_on_flag cinematics\effects\c40\artillery shelling15)))

(script continuous void barrage_on
(begin
(set barrage_mes
(objects_in_volume
(ai_actors existing_zombies_a) trigger_street_a2))
(if
(= 0
(list_count barrage_mes))
(set barrage_mes
(objects_in_volume
(players_current) trigger_street_a2)))
(if
(= 0
(list_count barrage_mes))
(set barrage_mes
(objects_in_volume
(ai_actors zombies_a) trigger_street_a2)))
(if
(>
(list_count barrage_mes) 0)
(begin
(wake barrage)))
(sleep 60)))

(script dormant void save_a_1
(begin
(ai_braindead street_a true)
(sleep 30)
(sleep_until intro_cinema_has_run)
(game_save_cancel)
(game_save_no_timeout)
(print saving)
(sleep 30)
(ai_braindead street_a false)))

(script startup void street_a1_2
(begin
(sleep 3)
(sleep_until
(volume_test_objects trigger_street_a4_1
(players_current)))
(sleep_until intro_cinema_has_run)
(game_save_cancel)
(game_save_no_timeout)
(ai_place street_a/civ3)
(ai_place existing_zombies_a/5)
(ai_place street_a/army6)
(ai_command_list street_a/civ3 civ3_run)
(sleep_until
(=
(ai_living_count street_a/army6) 0))
(sleep -1 barrage)
(sleep -1 barrage_on)
(wake save_a_1)))

(script startup void street_a2
(begin
(sleep 4)
(sleep_until
(volume_test_objects trigger_street_a5
(players_current)))
(ai_place street_a/army1)
(ai_place existing_zombies_a/2)
(ai_place street_a/driver_jeep1)
(ai_place street_a/army2)
(ai_attack existing_zombies_a/2)
(ai_prefer_target
(ai_actors existing_zombies_a/2) true)
(ai_try_to_fight street_a/army1 existing_zombies_a/2)
(sleep 45)
(vehicle_load_magic jeep1 driver
(ai_actors street_a/driver_jeep1))
(vehicle_load_magic jeep1 passenger
(ai_actors street_a/army2))
(sleep_until
(<=
(ai_strength existing_zombies_a/2) 0.50))
(ai_migrate street_a/driver_jeep1 street_a/driver_jeep1a_blank)
(ai_try_to_fight_player street_a/driver_jeep1a_blank)))

(script startup void street_a3
(begin
(sleep 5)
(sleep_until
(volume_test_objects trigger_street_a6
(players_current)))
(ai_place street_a/army3)
(ai_magically_see_players street_a/army3)
(ai_place street_a/army4)
(sleep -1 barrage)
(sleep -1 barrage_on)))

(script startup void street_a3_1
(begin
(sleep 3)
(sleep_until
(volume_test_objects trigger_street2
(players_current)))
(ai_place existing_zombies_a/6)
(ai_place street_a/army7)))

(script startup void street_a4
(begin
(sleep 7)
(sleep_until
(volume_test_objects trigger_street_a7
(players_current)))
(ai_place street_a/army5)
(ai_place street_a/army_gunner1)
(ai_vehicle_encounter browning1 street_a/army_gunner1)
(ai_command_list street_a/army_gunner1 man_gun)
(ai_kill zombies_a/zombie_runoff)
(sleep_until
(volume_test_objects trigger_street_a9
(players_current)))
(vehicle_unload browning1 )))

(script startup void street_a4_1
(begin
(sleep 8)
(sleep_until
(volume_test_objects trigger_street_a8
(players_current)))))

(script startup void street_a5
(begin
(sleep_until
(volume_test_objects trigger_street_a8
(ai_actors street_a/driver_jeep1)) 5)
(vehicle_unload jeep1 driver)
(vehicle_unload jeep1 passenger)))

(script startup void street_a6
(begin
(sleep 9)
(sleep_until
(volume_test_objects trigger_street_a7_1
(players_current)))
(ai_place existing_zombies_a/7)
(device_set_position a1 1.00)
(sleep_until
(=
(device_get_position a1) 1.00))
(ai_command_list existing_zombies_a/7 zombie7_out)
(sleep 90)
(device_set_position a1 0.00)))

(script startup void a_end_save
(begin
(sleep_until
(or
(volume_test_objects bsp 0,1 a_end_save)
(volume_test_objects bsp 0,1 a_end_save)))
(device_set_position a1 0.00)
(device_operates_automatically_set a1 false)
(ai_set_resurrection_group zombies_b/zombie_squad)
(ai_braindead street_a true)
(sleep 30)
(sleep_until intro_cinema_has_run)
(game_save_cancel)
(game_save_no_timeout)
(print saving)
(sleep 60)
(ai_braindead street_a false)
(device_set_position a2 1.00)))

(script startup void street_b1
(begin
(sleep 1)
(sleep_until
(volume_test_objects trigger_street_b1
(players_current)))
(ai_place street_b/army1)
(ai_place street_b/army2)
(ai_place street_b/army3)
(ai_dialogue_triggers false)
(ai_set_blind street_b/army1 true)
(ai_set_blind street_b/army2 true)
(ai_set_blind street_b/army3 true)
(sleep 30)
(ai_command_list street_b/army2 talk1)
(sleep_until
(or
(<
(ai_strength street_b) 0.95)
(volume_test_objects blind_off
(players_current))))
(ai_set_blind street_b/army1 false)
(ai_set_blind street_b/army2 false)
(ai_set_blind street_b/army3 false)
(ai_magically_see_players street_b)))

(script startup void street_b2
(begin
(sleep_until
(volume_test_objects trigger_street_b2
(players_current)))
(sleep_until intro_cinema_has_run)
(game_save_cancel)
(game_save_no_timeout)
(sound_impulse_start sound\dialog\c40\se_army_sergeant_1 sergeant1 1.00)
(ai_command_list street_b/army3 b_army3_idle)
(sleep
(sound_impulse_time sound\dialog\c40\se_army_sergeant_1))
(sound_impulse_start sound\dialog\c40\se_army_corporal_1 sergeant1 1.00)
(sleep
(sound_impulse_time sound\dialog\c40\se_army_corporal_1))
(sound_impulse_start sound\dialog\c40\se_army_sergeant_2 sergeant1 1.00)
(sleep
(sound_impulse_time sound\dialog\c40\se_army_sergeant_2))
(ai_command_list street_b/army2 talk2)
(ai_dialogue_triggers true)
(ai_set_blind street_b/army1 false)
(ai_set_blind street_b/army2 false)
(ai_set_blind street_b/army3 false)))

(script startup void street_b2_1
(begin
(sleep_until
(or
(volume_test_objects trigger_street_b2_1
(players_current))
(volume_test_objects trigger_b_antispawn1
(players_current))))
(sleep 30)
(ai_place street_b/army4_1)
(ai_place street_b/civ1)
(sound_impulse_start sound\dialog\c40\se_army_soldier_1
(list_get
(ai_actors street_b/army4_1) 0) 1.00)
(ai_set_deaf street_b/civ1 true)
(ai_set_deaf street_b/army4_1 true)
(ai_place street_b/army4)
(sleep_until
(or
(volume_test_objects trigger_street_b2_2
(ai_actors street_b/civ1))
(<=
(ai_strength street_b/civ1) 0.50)))
(ai_set_deaf street_b/civ1 false)
(ai_set_deaf street_b/army4_1 false)
(ai_magically_see_players street_b/army4)))

(script startup void b2_2
(begin
(sleep_until
(volume_test_objects trigger_street_b2_2
(players_current)))
(ai_place street_b/army4_2)
(ai_place street_b/army4_3)))

(script startup void new_save
(begin
(sleep_until
(and
(volume_test_objects trigger_street_b3
(players_current))
(not
(volume_test_objects trigger_street_b3
(ai_actors street_b)))))
(ai_braindead street_b true)
(sleep 30)
(print saving)
(sleep_until intro_cinema_has_run)
(game_save_cancel)
(game_save_no_timeout)
(sleep 30)
(ai_braindead street_b false)
(set saved_b true)))

(script startup void street_b3
(begin
(sleep 3)
(sleep_until
(volume_test_objects trigger_street_b3a
(players_current)))
(ai_place street_b/army5)
(ai_place street_b/army_gunner2)
(ai_vehicle_encounter browning2 street_b/army_gunner2)
(ai_place street_b/army_gunner3)
(ai_vehicle_encounter browning3 street_b/army_gunner3)
(ai_command_list street_b/army_gunner2 man_gun)
(ai_command_list street_b/army_gunner3 man_gun)
(sleep 60)
(ai_place street_b/driver_tank1)
(ai_command_list street_b/driver_tank1 man_gun)
(sleep_until
(=
(vehicle_test_seat_list tank1 t-driver
(ai_actors street_b/driver_tank1)) true))
(print tank loaded)
(ai_command_list street_b/driver_tank1 tank1_drive1)
(sleep_until
(volume_test_objects trigger_street_b_tank_off
(ai_actors street_b/driver_tank1)))
(ai_braindead street_b/driver_tank1 true)))

(script startup void the_tankman_cometh
(begin
(sleep_until
(and
(volume_test_objects trigger_street_b_fighting_tank
(players_current))
(and
(=
(ai_living_count street_b/army5) 0)
(and
(=
(ai_living_count street_b/army_gunner2) 0)
(=
(ai_living_count street_b/army_gunner3) 0)))))
(ai_braindead street_b true)
(sleep 30)
(print saving)
(sleep_until intro_cinema_has_run)
(game_save_cancel)
(game_save_no_timeout)
(sleep 60)
(ai_braindead street_b false)
(ai_braindead street_b/driver_tank1 false)
(sleep 30)
(ai_migrate street_b/driver_tank1 street_b/driver_tank1_combat)
(ai_magically_see_players street_b/driver_tank1_combat)
(ai_command_list street_b/driver_tank1_combat tank_start_combat)
(ai_try_to_fight_player street_b/driver_tank1_combat)))

(script startup void tankfight_on
(begin
(sleep_until
(and
(=
(ai_living_count street_b/army5) 0)
(and
(=
(ai_living_count street_b/driver_tank1_combat) 1)
(or
(volume_test_objects trigger_street_b_fighting_tank tankfight_on)
(volume_test_objects trigger_street_b_fighting_tank tankfight_on)))))
(set tankfight1 true)))

(script continuous void tankfight_ammo
(begin
(sleep_until
(and
(= tankfight1 true)
(and
(=
(unit_special_attack_get_count tankfight_ammo 1) 0)
(<
(ai_living_count street_b/civ_tankfight_ammo) 5))))
(sleep
(random_range
(* 30.00 6.00)
(* 30.00 13.00)))
(ai_place street_b/civ_tankfight_ammo)
(ai_dialogue_triggers false)
(sleep 60)
(sound_impulse_start sound\dialog\c40\se_civ_male_biz_1
(list_get
(ai_actors street_b/civ_tankfight_ammo) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\c40\se_civ_male_biz_1))
(ai_dialogue_triggers true)
(ai_command_list street_b/civ_tankfight_ammo tankfight_ammo_run)
(sleep 270)))

(script startup void tank1_bail
(begin
(sleep_until
(volume_test_objects trigger_street_b_fighting_tank
(players_current)))
(sleep 9000)
(sleep_until
(and
(=
(ai_living_count street_b/driver_tank1) 1)
(=
(vehicle_test_seat_list tank1 t-driver
(players_current)) false)))
(ai_migrate street_b/driver_tank1 street_b/driver_tank1_bail_blank)
(ai_vehicle_encounter tank1 street_b/driver_tank1_bail_blank)
(unit_exit_vehicle
(unit
(list_get
(ai_actors street_b/driver_tank1_bail_blank) 0)))
(sound_impulse_start sound\dialog\army_soldier_combat\investigate_first_investigate
(list_get
(ai_actors street_b/driver_tank1_bail_blank) 0) 1.00)))

(script startup void tank1_dead
(begin
(sleep_until
(and
(=
(ai_living_count street_b/driver_tank1_combat) 0)
(=
(vehicle_test_seat_list tank1 t-driver
(players_current)) true)))
(sleep -1 tankfight_ammo)
(ai_braindead street_b true)
(sleep 30)
(sleep_until intro_cinema_has_run)
(game_save_cancel)
(game_save_no_timeout)
(print saving)
(sleep 30)
(ai_braindead street_b false)
(sleep 180)
(sleep_until
(and
(=
(objects_can_see_flag
(players_current) spawn_test2 30.00) false)
(not
(volume_test_objects trigger_street_b7
(players_current)))))
(ai_place street_b/army7)
(ai_command_list street_b/army7 recon_walk2)
(ai_magically_see_players street_b/army7)
(sleep 120)
(sleep_until
(=
(objects_can_see_flag
(players_current) spawn_test4 30.00) false))
(ai_place street_b/army7_1)
(ai_place street_b/army7_2)
(sleep_until
(<=
(ai_living_count street_b/army7) 1))
(ai_place street_b/army6)
(device_set_power door_b_c 1.00)
(activate_nav_point_object default tank1_dead door_b_c 0.00)
(activate_nav_point_object default tank1_dead door_b_c 0.00)
(ai_command_list street_b/army6 army6_out)
(sleep_until
(<=
(ai_living_count street_b/army6) 1))
(ai_place street_b/army8)))

(script startup void turn_off_b_c_navpoint
(begin
(sleep_until
(volume_test_objects in_bsp_switch_b_c
(players_current)))
(deactivate_nav_point_object turn_off_b_c_navpoint door_b_c)
(deactivate_nav_point_object turn_off_b_c_navpoint door_b_c)))

(script startup void open_sez_me_dammit
(begin
(sleep_until
(or
(volume_test_objects trigger_street_b_fighting_tank open_sez_me_dammit)
(volume_test_objects trigger_street_b_fighting_tank open_sez_me_dammit)))
(sleep 8000)
(device_set_position door_b_c 1.00)))

(script startup void street_b4
(begin
(sleep_until
(volume_test_objects trigger_street_b4
(players_current)))
(vehicle_unload browning2 )))

(script startup void street_b5
(begin
(sleep_until
(volume_test_objects trigger_street_b5
(players_current)))
(vehicle_unload browning3 )))

(script startup void bsp_1_2
(begin
(sleep_until
(or
(volume_test_objects bsp 1,2 bsp_1_2)
(volume_test_objects bsp 1,2 bsp_1_2)))
(ai_set_resurrection_group zombies_c/zombie_squad)
(device_set_position a3 0.00)
(device_operates_automatically_set a3 false)
(device_set_position a4 1.00)))

(script continuous void magic_sight_c
(begin
(ai_magically_see_players street_c/sniper2a_blank)
(ai_magically_see_players street_c/army3a_blank)
(ai_magically_see_players street_c/army4)
(ai_magically_see_players street_c/army5)
(ai_magically_see_players street_c/sniper3)
(ai_magically_see_players street_c_jetpack)
(ai_magically_see_players street_c/sniper1)))

(script dormant void chubby_kitten
(begin
(set chubby_has_started true)
(sound_impulse_start sound\dialog\c40\se_army_sergeant_3
(list_get
(ai_actors street_c/army1) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\c40\se_army_sergeant_3))
(sound_impulse_start sound\dialog\c40\se_army_corporal_3
(list_get
(ai_actors street_c/army1) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\c40\se_army_corporal_3))
(sound_impulse_start sound\dialog\c40\se_army_sergeant_4
(list_get
(ai_actors street_c/army1) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\c40\se_army_sergeant_4))
(sound_impulse_start sound\dialog\c40\se_army_corporal_4
(list_get
(ai_actors street_c/army1) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\c40\se_army_corporal_4))
(sound_impulse_start sound\dialog\c40\se_army_sergeant_5
(list_get
(ai_actors street_c/army1) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\c40\se_army_sergeant_5))
(sleep 45)
(sound_impulse_start sound\dialog\c40\se_army_corporal_5
(list_get
(ai_actors street_c/army1) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\c40\se_army_corporal_5))
(sound_impulse_start sound\dialog\c40\se_army_sergeant_6
(list_get
(ai_actors street_c/army1) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\c40\se_army_sergeant_6))))

(script startup void street_c1
(begin
(sleep 4)
(sleep_until
(or
(volume_test_objects trigger_street_c1 street_c1)
(volume_test_objects trigger_street_c1 street_c1)))
(ai_braindead street_b true)
(sleep_until intro_cinema_has_run)
(game_save_cancel)
(game_save_no_timeout)
(ai_braindead street_b false)
(ai_place street_c/army1)
(ai_place street_c/sniper1)
(ai_place street_c/army2)
(ai_set_deaf street_c/army2 true)
(ai_dialogue_triggers false)
(sleep 60)
(wake chubby_kitten)
(sleep_until
(or
(<
(ai_strength street_c/army1) 0.90)
(<
(ai_strength street_c/army2) 0.90)))
(sleep -1 chubby_kitten)
(ai_set_deaf street_c/army2 false)
(ai_set_deaf street_c/army1 false)
(ai_dialogue_triggers true)
(sleep_until
(not
(objects_can_see_flag
(players_current) civ_spawn 45.00)) 1)
(ai_place street_c/civ1)
(ai_begin_flee_with_cower_chance street_c/civ1 true 0 true 1.00)
(sleep_until
(or
(<
(ai_living_count street_c/army2) 3)
(volume_test_objects trigger_street_c2
(players_current))) 1)
(sleep_until intro_cinema_has_run)
(game_save_cancel)
(game_save_no_timeout)
(sleep 30)
(ai_place street_c/sniper2)
(ai_place street_c/army3)
(ai_place street_c/army7)
(ai_force_active street_c/sniper1 true)
(ai_command_list zombies_c zombies_c_up)))

(script continuous void not_the_chubby
(begin
(sleep_until chubby_has_started)
(sleep_until
(or
(volume_test_objects trigger_street_c1_1
(players_current))
(and
(<
(ai_strength street_c/army1) 0.95)
(volume_test_objects trigger_street_c1
(players_current)))))
(sleep -1 chubby_kitten)
(ai_magically_see_players street_c/army1)
(ai_magically_see_players street_c/army2)))

(script startup void sniper1
(begin
(sleep_until
(and
(volume_test_objects trigger_street_c2 sniper1)
(and
(=
(ai_living_count street_c/sniper1) 0)
(<=
(ai_living_count street_c/army3) 3))))
(sleep_until intro_cinema_has_run)
(game_save_cancel)
(game_save_no_timeout)
(set c_sniper true)
(ai_migrate street_c/sniper2 street_c/sniper2a_blank)
(ai_migrate street_c/army3 street_c/army3a_blank)
(sleep 60)
(ai_command_list street_c/sniper2a_blank sniper_move1)
(ai_try_to_fight_player street_c/sniper2a_blank)
(ai_force_active street_c/sniper2a_blank true)))

(script startup void truck_guys
(begin
(sleep_until
(or
(volume_test_objects trigger_street_c4
(players_current))
(<=
(ai_living_count street_c/army3a_blank) 2)))
(sleep_until intro_cinema_has_run)
(game_save_cancel)
(game_save_no_timeout)
(ai_place street_c/army6)
(ai_try_to_fight_player street_c/army6)
(ai_place street_c/army6a)
(ai_try_to_fight_player street_c/army6a)))

(script startup void sniper2
(begin
(sleep_until
(and
(= c_sniper true)
(<
(ai_living_count street_c/army3a_blank) 2)))
(ai_place street_c/army4)
(ai_try_to_fight_player street_c/army4)
(sleep_until
(or
(<=
(ai_living_count street_c/army4) 6)
(volume_test_objects trigger_street_c4
(players_current))))
(ai_place street_c/army5)
(ai_command_list street_c/army5 army5_out)
(ai_try_to_fight_player street_c/army4)))

(script startup void street_c3
(begin
(sleep 1)
(sleep_until
(volume_test_objects trigger_street_c3
(players_current)))
(sleep_until
(=
(ai_living_count street_c/sniper3) 0))
(ai_place street_c_jetpack/1)
(ai_magically_see_players street_c_jetpack/1)
(objects_cannot_be_possessed
(ai_actors street_c_jetpack/1) true)))

(script startup void bsp_2_3
(begin
(sleep_until
(or
(volume_test_objects bsp 2,3 bsp_2_3)
(volume_test_objects bsp 2,3 bsp_2_3)))
(device_set_position a5 0.00)
(device_operates_automatically_set a5 false)
(device_set_position a6 1.00)
(ai_set_resurrection_group zombies_d)))

(script startup void street_d1a
(begin
(sleep 4)
(sleep_until
(volume_test_objects trigger_street_d1a
(players_current)))
(sleep_until intro_cinema_has_run)
(game_save_cancel)
(game_save_no_timeout)
(print saving)
(sleep 30)
(ai_place street_d/civ1a)
(ai_set_deaf street_d/civ1a true)
(ai_place street_d/civ1b)))

(script startup void street_d1
(begin
(sleep 3)
(sleep_until
(volume_test_objects trigger_street_d1
(players_current)))
(sleep 10)
(ai_place street_d/army1)
(ai_place existing_zombies_d/1_swarm1)
(ai_command_list street_d/army1 fallback1)
(ai_attack existing_zombies_d/1_swarm1)
(sound_impulse_start sound\dialog\army_sergeant_combat\retreat
(list_get
(ai_actors street_d/army1) 0) 1.00)
(sleep 90)
(sound_impulse_start sound\dialog\army_sergeant_combat\flee
(list_get
(ai_actors street_d/army1) 0) 1.00)
(sleep 10)
(player_action_test_reset)
(ai_place street_d/army1a)
(ai_disregard
(ai_actors street_d/army1a) true)
(ai_command_list street_d/army1a possess_me_d)
(sleep_until
(<
(ai_living_count street_d/army1) 2))
(ai_place street_d/army1b)
(ai_command_list street_d/army1b possess_me_d2)
(sleep_until
(=
(ai_living_count street_d/army1) 0))
(ai_place street_d/driver_tank2)
(ai_command_list street_d/driver_tank2 man_gun)
(sleep_until
(=
(vehicle_test_seat_list tank2 t-driver
(ai_actors street_d/driver_tank2)) true))
(ai_try_to_fight_player street_d/driver_tank2)
(ai_force_active street_d/driver_tank2 true)
(sleep 90)
(ai_place street_d/army4)
(sleep_until
(=
(ai_living_count street_d/driver_tank2) 0))
(sleep 30)
(ai_place street_d/army2)
(ai_place street_d/army3)))

(script startup void tank_d_save
(begin
(sleep_until
(=
(vehicle_test_seat_list tank2 t-driver
(players_current)) true))
(ai_braindead street_d true)
(sleep 30)
(sleep_until intro_cinema_has_run)
(print saving)
(game_save_cancel)
(game_save_no_timeout)
(sleep 30)
(ai_braindead street_d false)
(set tank_d_saved true)))

(script continuous void magic_sight_tank
(begin
(sleep_until
(and
(=
(vehicle_test_seat_list tank2 t-driver
(players_current)) true)
(= tank_d_saved true)))
(ai_magically_see_players street_d)))

(script startup void street_d2
(begin
(sleep 4)
(sleep_until
(volume_test_objects trigger_street_d2
(players_current)))
(ai_place street_d/driver_jeep2)
(ai_place street_d/army_jeep2)
(ai_place street_d/security1_mon)
(vehicle_load_magic jeep2 driver
(ai_actors street_d/driver_jeep2))
(sleep 30)
(ai_vehicle_enterable_actors jeep2 street_d)
(ai_set_deaf street_d/driver_jeep2 true)
(vehicle_load_magic jeep2 passenger
(ai_actors street_d/army_jeep2))
(print jeep2 loaded)
(sleep 30)
(ai_place street_d/sniper1)))

(script startup void street_d5
(begin
(sleep 5)
(sleep_until
(volume_test_objects trigger_street_d5
(players_current)))
(ai_place street_d/driver_jeep3)
(ai_place street_d/army_jeep3)
(vehicle_load_magic jeep3 driver
(ai_actors street_d/driver_jeep3))
(ai_place street_d/army5)
(sleep 30)
(ai_vehicle_enterable_actors jeep3 street_d)
(ai_set_deaf street_d/driver_jeep2 true)
(vehicle_load_magic jeep3 passenger
(ai_actors street_d/army_jeep3))
(ai_magically_see_players street_d/driver_jeep3)
(print jeep3 loaded)))

(script startup void street_d8
(begin
(sleep 8)
(sleep_until
(volume_test_objects trigger_street_d9
(players_current)))
(ai_place existing_zombies_d/4_swarm2)
(ai_place street_d/civ1)
(sleep 30)
(object_create jeep6)
(ai_place street_d/driver_jeep6)
(vehicle_load_magic jeep6 je-driver
(ai_actors street_d/driver_jeep6))
(ai_place street_d/army_jeep6)
(vehicle_load_magic jeep6 je-passenger
(ai_actors street_d/army_jeep6))
(ai_vehicle_enterable_actors jeep6 street_d)
(ai_place street_d/army8)
(sleep_until
(volume_test_objects trigger_street_d_flowers
(players_current)))
(ai_place existing_zombies_d/5_flowers)
(sleep 60)
(object_create jeep7)
(ai_place street_d/driver_jeep7)
(vehicle_load_magic jeep7 je-driver
(ai_actors street_d/driver_jeep7))
(ai_place street_d/army_jeep7)
(vehicle_load_magic jeep7 je-passenger
(ai_actors street_d/army_jeep7))
(ai_vehicle_enterable_actors jeep7 street_d)
(sleep 60)
(ai_place street_d/security7_doom)
(ai_try_to_fight_player street_d/security7_doom)))

(script startup void pistil_pete
(begin
(sleep 1)
(sleep_until
(and
(volume_test_objects trigger_street_d_pistil_pete
(players_current))
(= no_billboard false))) pistil_pete
(activate_nav_point_flag default pistil_pete pistil_flag 0.50)
(activate_nav_point_flag default pistil_pete pistil_flag 0.50)))

(script continuous void so_many_vehicles
(begin
(sleep_until
(or
(=
(vehicle_test_seat_list tank2 t-driver
(players_current)) true)
(=
(vehicle_test_seat_list players_jeep je-driver
(players_current)) true)) 5)
(set in_vehicle true)))

(script continuous void so_many_vehicles2
(begin
(sleep_until
(or
(=
(vehicle_test_seat_list tank2 t-driver
(players_current)) false)
(=
(vehicle_test_seat_list players_jeep je-driver
(players_current)) false)) 5)
(set in_vehicle false)))

(script dormant void turn_off_navpoint_to_bsp_e
(begin
(sleep_until
(volume_test_objects inside_d_e_switch
(players_current)))
(deactivate_nav_point_object turn_off_navpoint_to_bsp_e d_e1)
(deactivate_nav_point_object turn_off_navpoint_to_bsp_e d_e1)))

(script startup void street_d4
(begin
(sleep_until
(volume_test_objects quiet_zone
(players_current)))
(activate_nav_point_flag default street_d4 pistil_flag 0.00)
(activate_nav_point_flag default street_d4 pistil_flag 0.00)
(sleep_until
(and
(volume_test_objects trigger_street_d8
(players_origin)) true))
(fade_out 0.00 0.00 0.00 30)
(sleep 30)
(ai_braindead street_d true)
(objects_cannot_take_damage
(players_current) true)
(objects_destroy
(objects_in_volume
(ai_actors street_d) trigger_street_d8))
(if
(volume_test_object trigger_street_d8 tank2)
(object_teleport tank2 away_from_pistil))
(if
(volume_test_object trigger_street_d8 players_jeep)
(object_teleport players_jeep away_from_pistil)) street_d4
(deactivate_nav_point_flag street_d4 pistil_flag)
(deactivate_nav_point_flag street_d4 pistil_flag)
(fade_in 0.00 0.00 0.00 30)
(sleep_until intro_cinema_has_run)
(game_save_cancel)
(game_save_no_timeout)
(set no_billboard true)
(device_operates_automatically_set d_e1 true)
(ai_braindead street_d false)
(sleep
(* 30.00 5.00))
(objects_cannot_take_damage
(players_current) false)
(sleep 30)
(ai_place street_d/exit_attract)
(ai_magically_see_players street_d/exit_attract)
(ai_command_list street_d/exit_attract tank6_attract)
(sleep
(* 30.00 15.00))
(activate_nav_point_object default street_d4 d_e1 0.00)
(activate_nav_point_object default street_d4 d_e1 0.00)
(wake turn_off_navpoint_to_bsp_e)))

(script continuous void magic_attract
(begin
(ai_magically_see_players street_d/exit_attract)))

(script startup void exit_d
(begin
(sleep_until
(and
(= no_billboard true)
(or
(volume_test_objects trigger_street_d3 exit_d)
(volume_test_objects trigger_street_d3 exit_d))))
(sleep_until
(volume_test_objects bsp 3,4
(players_origin)))
(device_set_position d_e1 0.00)
(device_operates_automatically_set d_e1 false)
(device_set_position d_e2 1.00)
(ai_set_resurrection_group zombies_plaza/zombie_squad)))

(script static void music_on
(begin
(set slow_grim_music true)
(sleep
(* 130.00 30.00))
(set slow_grim_music false)))

(script startup void plaza1
(begin
(sleep 3)
(sleep_until
(volume_test_objects trigger_plaza1
(players_current)))
(if
(begin
(=
(vehicle_test_seat_list tank2 t-driver
(players_current)) false))
(object_create backup_d))
(sleep_until intro_cinema_has_run)
(print trying to save)
(game_save_cancel)
(game_save_no_timeout)
(print saving) plaza1))

(script startup void plaza1_1
(begin
(sleep 4)
(sleep_until
(volume_test_objects trigger_plaza2
(players_current)))
(ai_place plaza/driver_tank3)
(vehicle_load_magic tank3 t-driver
(ai_actors plaza/driver_tank3))
(ai_place plaza/army1)
(ai_magically_see_players plaza/army1)))

(script startup void plaza1_2
(begin
(sleep 5)
(sleep_until
(volume_test_objects trigger_plaza_entrance
(players_current)))
(ai_attack plaza/army1)
(sleep_until
(or
(<
(ai_strength plaza/army1) 0.40)
(volume_test_objects trigger_plaza_position1
(players_current))))
(ai_command_list plaza/army1 army1_retreat)))

(script continuous void tanks_harder
(begin
(sleep_until
(=
(vehicle_test_seat_list tank2 t-driver
(players_current)) true))
(objects_set_current_vitality
(ai_actors plaza/driver_tank3) 220.00 1.00)
(objects_set_current_vitality
(ai_actors plaza/driver_tank4) 220.00 1.00)
(objects_set_current_vitality
(ai_actors plaza/driver_tank5) 220.00 1.00)
(objects_set_current_vitality
(ai_actors plaza/driver_tank7) 220.00 1.00)
(sleep_until
(=
(vehicle_test_seat_list tank2 t-driver
(players_current)) false))
(objects_set_current_vitality
(ai_actors plaza/driver_tank3) 110.00 1.00)
(objects_set_current_vitality
(ai_actors plaza/driver_tank3) 110.00 1.00)
(objects_set_current_vitality
(ai_actors plaza/driver_tank3) 110.00 1.00)
(objects_set_current_vitality
(ai_actors plaza/driver_tank3) 110.00 1.00)))

(script startup void tank3
(begin
(sleep 6)
(sleep_until
(volume_test_objects trigger_plaza_left
(players_current)))
(ai_magically_see_players plaza/driver_tank3)
(ai_try_to_fight_player plaza/driver_tank3)
(ai_place plaza/army2)
(ai_place plaza/army3)
(sleep 1)
(set far_int_save_enable true)
(sleep_until
(<
(ai_strength plaza/driver_tank3) 0.50))
(ai_migrate plaza/driver_tank3 plaza/driver_tank3a_blank)))

(script startup void far_intersection
(begin
(sleep 2)
(sleep_until
(volume_test_objects trigger_plaza_far_intersection
(players_current)))
(ai_magically_see_players plaza/army2)
(ai_magically_see_players plaza/army3)
(sleep 15)
(ai_place plaza/driver_jeep4)
(ai_place plaza/army_jeep4)
(vehicle_load_magic jeep4 je-driver
(ai_actors plaza/driver_jeep4))
(vehicle_load_magic jeep4 je-passenger
(ai_actors plaza/army_jeep4))
(ai_magically_see_players plaza/army_jeep4)
(sleep_until
(volume_test_objects trigger_plaza_far_intersection
(ai_actors plaza/driver_jeep4)))
(ai_migrate plaza/driver_jeep4 plaza/driver_jeep4a_blank)))

(script startup void jeep8
(begin
(sleep_until
(volume_test_objects trigger_plaza_far_intersection
(players_current)))
(sleep 60)
(ai_place plaza/driver_jeep8)
(ai_place plaza/army_jeep8)
(vehicle_load_magic jeep8 je-driver
(ai_actors plaza/driver_jeep8))
(vehicle_load_magic jeep8 je-passenger
(ai_actors plaza/army_jeep8))
(ai_magically_see_players plaza/army_jeep8)
(sleep 60)
(ai_place plaza/army_skirt_front)
(ai_magically_see_players plaza/army_skirt_front)))

(script startup void far_intersection_save
(begin
(sleep_until
(and far_int_save_enable
(and
(=
(ai_living_count plaza/army2) 0)
(and
(=
(ai_living_count plaza/army3) 0)
(and
(=
(ai_living_count plaza/driver_jeep8) 0)
(=
(ai_living_count plaza/army_jeep8) 0))))))
(ai_braindead plaza true)
(sleep 30)
(sleep_until intro_cinema_has_run)
(game_save_cancel)
(game_save_no_timeout)
(sleep 30)
(ai_braindead plaza false)))

(script startup void tank4
(begin
(sleep_until
(or
(volume_test_objects trigger_plaza_skirt_front
(players_current))
(volume_test_objects trigger_plaza_skirt_back
(players_current))))
(sleep 90)
(ai_place plaza/driver_tank4)
(vehicle_load_magic tank4 driver
(ai_actors plaza/driver_tank4))
(ai_magically_see_players plaza/driver_tank4)
(sleep_until
(=
(ai_living_count plaza/driver_tank4) 0))
(set tank4_dead true)))

(script startup void tank5
(begin
(sleep_until
(and
(= tank4_dead true)
(or
(volume_test_objects trigger_plaza_skirt_front
(players_current))
(volume_test_objects trigger_plaza_skirt_back
(players_current)))))
(sleep 60)
(ai_place plaza/driver_tank5)
(vehicle_load_magic tank5 driver
(ai_actors plaza/driver_tank5))
(ai_magically_see_players plaza/driver_tank5)
(sleep_until
(=
(ai_living_count plaza/driver_tank5) 0))
(set tank5_dead true)))

(script startup void plaza_right
(begin
(sleep 8)
(sleep_until
(volume_test_objects trigger_plaza_right
(players_current)))
(ai_place plaza/army9_sniper1)
(ai_magically_see_players plaza/army9_sniper1)
(ai_place plaza/security1_mono)
(ai_attack plaza/security1_mono)
(sleep_until
(<
(ai_living_count plaza/security1_mono) 2))
(ai_place plaza_jetpacks/mono_tunnel)
(ai_magically_see_players plaza_jetpacks/mono_tunnel)
(ai_try_to_fight_player plaza_jetpacks/mono_tunnel)
(objects_cannot_be_possessed
(ai_actors plaza_jetpacks) true)))

(script startup void open_sez_me_dammit2
(begin
(sleep_until
(= tank4_dead true))
(sleep 8000)
(device_set_position hall_l 1.00)
(device_set_position hall_r 1.00)
(print doors open)
(ai_place plaza/steps_security1)
(ai_place plaza/steps_army1)
(ai_magically_see_players plaza/steps_security1)
(ai_magically_see_players plaza/steps_army1)
(ai_try_to_fight_player plaza/steps_security1)
(ai_try_to_fight_player plaza/steps_army1)))

(script startup void done_tanks
(begin
(sleep_until
(and
(= tank4_dead true)
(= tank5_dead true)))
(ai_place plaza_jetpacks/hall_top)
(ai_magically_see_players plaza_jetpacks/hall_top)
(ai_try_to_fight_player plaza_jetpacks/hall_top)
(ai_place plaza/army10_sniper2)
(ai_magically_see_players plaza/army10_sniper2)
(sleep 90)
(object_create tank7)
(ai_place plaza/driver_tank7)
(vehicle_load_magic tank7 driver
(ai_actors plaza/driver_tank7))
(sleep_until
(=
(vehicle_test_seat_list tank7 t-driver
(ai_actors plaza/driver_tank7)) true))
(ai_command_list plaza/driver_tank7 tank7_drive)
(ai_magically_see_players plaza/driver_tank7)))

(script startup void begin_steps
(begin
(sleep_until
(and
(volume_test_objects trigger_plaza_before_steps
(players_current))
(and
(= tank4_dead true)
(= tank5_dead true))))
(ai_place plaza/steps_security1)
(ai_place plaza/steps_army1)
(device_set_position hall_l 1.00)
(device_set_position hall_r 1.00)
(sleep_until
(=
(device_get_position hall_l) 1.00))
(device_set_power hall_l 0.00)
(sleep_until
(=
(device_get_position hall_r) 1.00))
(device_set_power hall_r 0.00)
(ai_magically_see_players plaza/steps_security1)
(ai_magically_see_players plaza/steps_army1)
(ai_try_to_fight_player plaza/steps_security1)
(ai_try_to_fight_player plaza/steps_army1)))

(script startup void out_of_hall
(begin
(sleep_until
(and
(volume_test_objects trigger_plaza_on_steps
(players_current))
(=
(vehicle_test_seat_list backup_d t-driver
(players_current)) false)))
(ai_command_list plaza/steps_army1 hall_out)
(ai_command_list plaza/steps_security1 hall_out)
(sleep 60)
(device_set_position hall_l 0.00)
(device_set_position hall_r 0.00)
(sleep_until
(and
(=
(ai_living_count plaza/steps_army1) 0)
(=
(ai_living_count plaza/steps_security1) 0)))
(device_set_position hall_l 1.00)
(device_set_position hall_r 1.00)))

(script startup void hq1
(begin
(sleep 2)
(sleep_until
(volume_test_objects trigger_plaza_hq
(players_current)))
(ai_place hq/rifle1)
(ai_playfight hq/rifle1 true)))

(script static void find_closest_camera_point
(begin
(set flag_distance
(object_distance_to_camera_point water_drowned0 teleport_player))
(set drown_flag water_drowned0)
(if
(<
(object_distance_to_camera_point water_drowned1 teleport_player) flag_distance)
(begin
(set flag_distance
(object_distance_to_camera_point water_drowned1 teleport_player))
(set drown_flag water_drowned1)))
(if
(<
(object_distance_to_camera_point water_drowned2 teleport_player) flag_distance)
(begin
(set flag_distance
(object_distance_to_camera_point water_drowned2 teleport_player))
(set drown_flag water_drowned2)))
(if
(<
(object_distance_to_camera_point water_drowned3 teleport_player) flag_distance)
(begin
(set flag_distance
(object_distance_to_camera_point water_drowned3 teleport_player))
(set drown_flag water_drowned3)))
(if
(<
(object_distance_to_camera_point water_drowned4 teleport_player) flag_distance)
(begin
(set flag_distance
(object_distance_to_camera_point water_drowned4 teleport_player))
(set drown_flag water_drowned4)))
(if
(<
(object_distance_to_camera_point water_drowned5 teleport_player) flag_distance)
(begin
(set flag_distance
(object_distance_to_camera_point water_drowned5 teleport_player))
(set drown_flag water_drowned5)))
(if
(<
(object_distance_to_camera_point water_drowned6 teleport_player) flag_distance)
(begin
(set flag_distance
(object_distance_to_camera_point water_drowned6 teleport_player))
(set drown_flag water_drowned6)))
(if
(<
(object_distance_to_camera_point water_drowned7 teleport_player) flag_distance)
(begin
(set flag_distance
(object_distance_to_camera_point water_drowned7 teleport_player))
(set drown_flag water_drowned7)))
(if
(<
(object_distance_to_camera_point water_drowned8 teleport_player) flag_distance)
(begin
(set flag_distance
(object_distance_to_camera_point water_drowned8 teleport_player))
(set drown_flag water_drowned8)))
(if
(<
(object_distance_to_camera_point water_drowned9 teleport_player) flag_distance)
(begin
(set flag_distance
(object_distance_to_camera_point water_drowned9 teleport_player))
(set drown_flag water_drowned9)))
(if
(<
(object_distance_to_camera_point water_drowned10 teleport_player) flag_distance)
(begin
(set flag_distance
(object_distance_to_camera_point water_drowned10 teleport_player))
(set drown_flag water_drowned10)))))

(script continuous void river_kill_player
(begin
(sleep_until
(volume_test_objects trigger_river_kill
(players_current)) 15)
(if
(volume_test_objects trigger_river_kill river_kill_player)
(set teleport_player river_kill_player)
(set teleport_player river_kill_player))
(damage_object globals\falling teleport_player)
(if
(not
(game_is_cooperative))
(begin river_kill_player
(player_enable_input false)
(player_camera_control false)
(camera_control true 0)
(camera_set drown_flag 30)
(sleep 90)
(player_enable_input true)
(player_camera_control true)
(camera_control false 30)))
(sleep 180)))

(script startup void into_hall
(begin
(sleep_until
(or
(volume_test_objects trigger_teleport_to_hall into_hall)
(or
(volume_test_objects trigger_teleport_to_hall2 into_hall)
(or
(volume_test_objects trigger_teleport_to_hall into_hall)
(volume_test_objects trigger_teleport_to_hall2 into_hall)))))
(game_won)))

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

(script continuous void hand_music
(begin
(sleep_until
(and
(= hand_music true)
(= slow_grim_music false)) 1)
(sound_looping_start sound\music\hand_2\hand_2 none 1.00)
(sleep_until
(or
(= hand_music false)
(= slow_grim_music true) hand_music) 1)
(sound_looping_stop sound\music\hand_2\hand_2)))

(script continuous void slow_grim_music
(begin
(sleep_until
(= slow_grim_music true) 1)
(if hand_music
(sleep 30))
(sound_looping_start sound\music\barbershop\slow_grim none 1.00)
(sleep_until
(or
(= slow_grim_music false) slow_grim_music) 1)
(sound_looping_stop sound\music\barbershop\slow_grim)))

(script dormant void 10_stubbs_dialog
(begin
(sleep 380)
(sound_impulse_start sound\cinematics\c40\10_stubbs_1 10_stubbs_1 1.00)))

(script static void c40_10_run
(begin
(fade_out 0.00 0.00 0.00 0)
(sound_looping_predict sound\cinematics\c40\10_foley_1) c40_10_run
(object_activation_add_camera 10_01)
(cinematic_set_near_clip_distance 0.01)
(game_skip_ticks 15)
(sleep 15)
(sound_looping_start sound\cinematics\c40\10_foley_1 none 0.75)
(wake 10_stubbs_dialog)
(print c40_10:  introduction)
(camera_set 10_01 0)
(fade_in 0.00 0.00 0.00 0)
(camera_set 10_02 60)
(sleep 90)
(camera_set 10_03 150)
(sleep 120)
(camera_set 10_04 90)
(sleep 60)
(camera_set 10_05 90)
(sleep 60)
(object_create 10_stubbs_1)
(object_beautify 10_stubbs_1 true)
(camera_set 10_06 90)
(sleep 30)
(custom_animation 10_stubbs_1 cinematics\animations\stubbs\c40\c40 c40_10_stubbs_1 false)
(sleep 90)
(camera_set 10_07 0)
(sound_impulse_start sound\dialog\c40\10_maggie_1 billboard_1 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\c40\10_maggie_1) 120.00))
(camera_set 10_08 0)
(effect_new_on_object effects\hearts 10_stubbs_1)
(sleep
(unit_get_custom_animation_time 10_stubbs_1))
(fade_out 0.00 0.00 0.00 0) c40_10_run
(object_activation_clear)
(object_destroy_containing 10_)))

(script static void c40_15_run
(begin
(fade_out 0.00 0.00 0.00 0)
(sleep 15)
(sound_looping_predict sound\cinematics\c40\15_foley_1) c40_15_run
(switch_bsp 3)
(object_activation_add_camera 15_01)
(object_create 15_stubbs_1)
(object_beautify 15_stubbs_1 true)
(object_teleport c40_15_run hide_player)
(object_teleport c40_15_run hide_player)
(sleep 30)
(recording_play 15_stubbs_1 15_stubbs_1)
(sound_looping_start sound\cinematics\c40\15_foley_1 none 1.00)
(sound_impulse_start sound\cinematics\c40\15_stubbs_1 15_stubbs_1 1.00)
(print c40_15:  pistol pete's)
(camera_set 15_01 0)
(camera_set 15_01b 90)
(fade_in 0.00 0.00 0.00 15)
(sleep 90)
(camera_set 15_02 0)
(print screams)
(sleep 150)
(recording_kill 15_stubbs_1)
(object_teleport 15_stubbs_1 15_stubbs_1)
(object_create 15_candy_1)
(object_create 15_flowers_1)
(objects_attach 15_stubbs_1 melee 15_flowers_1 melee)
(objects_attach 15_stubbs_1 meleel 15_candy_1 melee)
(camera_set 15_03 0)
(camera_set 15_03b 10)
(sleep 90)
(fade_out 0.00 0.00 0.00 15)
(sleep 15) c40_15_run
(object_activation_clear)
(object_destroy_containing 15_)
(object_teleport c40_15_run start_pistol0)
(object_teleport c40_15_run start_pistol1)))

(script static void cutscenes_off
(begin
(set show_cutscenes false)))

(script startup void test
(begin
(if
(> test 0) test)
(if
(= test 10) test)
(if
(= test 15) test)))

(script static void preview
(begin preview preview preview))

(script static void unlockable_pickup
(begin
(damage_object equipment\hippo\hippo_pickup unlockable_pickup)
(if
(game_is_cooperative)
(damage_object equipment\hippo\hippo_pickup unlockable_pickup))))

(script static void stop_commentary
(begin
(sound_looping_stop sound\commentary\c40_cityhall\c40_cityhall_01)
(sound_looping_stop sound\commentary\c40_cityhall\c40_cityhall_02)
(sound_looping_stop sound\commentary\c40_cityhall\c40_cityhall_03)
(sound_looping_stop sound\commentary\c40_cityhall\c40_cityhall_04)
(sound_looping_stop sound\commentary\c40_cityhall\c40_cityhall_05)))

(script dormant void unlock_comment_1
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_1) 0.00) 7) unlock_comment_1
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_1
(sound_looping_start sound\commentary\c40_cityhall\c40_cityhall_01 none 1.00)
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
(sound_looping_start sound\commentary\c40_cityhall\c40_cityhall_02 none 1.00)
(sleep
(* 30.00 15.00))
(sleep 60)))

(script dormant void unlock_comment_3
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_3) 0.00) 7) unlock_comment_3
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_3
(sound_looping_start sound\commentary\c40_cityhall\c40_cityhall_03 none 1.00)
(sleep
(* 30.00 15.00))
(sleep 60)))

(script dormant void unlock_comment_4
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_4) 0.00) 7) unlock_comment_4
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_4
(sound_looping_start sound\commentary\c40_cityhall\c40_cityhall_04 none 1.00)
(sleep
(* 30.00 15.00))
(sleep 60)))

(script dormant void unlock_comment_5
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_5) 0.00) 7) unlock_comment_5
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_5
(sound_looping_start sound\commentary\c40_cityhall\c40_cityhall_05 none 1.00)
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
(wake unlock_comment_2)
(wake unlock_comment_3)
(wake unlock_comment_4)
(wake unlock_comment_5)))))