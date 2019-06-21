(global bool cutscene_running false)

(global bool hand_music false)

(global bool library_music false)

(global bool lab_music false)

(global bool have_placed_dudes false)

(global bool tired_as_fuck false)

(global bool library_wall_encounter false)

(global short library_wall_health 300)

(global short library_wall_spots 4)

(global short library_wall_zombie_index 0)

(global short library_wall_spot 0)

(global ai_command_list library_wall_command_list attack_library_wall1)

(global weapon zombie_attacker_lib empty)

(global short library_wall_damage_rate 15)

(global short zombie_promotion 0)

(global weapon temp_unit empty)

(global real library_rounds 0.00)

(global bool end_library_wall_played false)

(global bool lab_wall_encounter false)

(global short lab_wall_health 600)

(global short lab_wall_spots 6)

(global short lab_wall_zombie_index 0)

(global weapon zombie_attacker empty)

(global ai_command_list lab_wall_command_list attack_lab_wall1)

(global short lab_wall_spot 0)

(global short lab_wall_damage_rate 15)

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
(map_name levels\c50_end\c5_end)))

(script static void c10_10
(begin
(if
(= show_cutscenes true) c10_10)))

(script static void c10_20
(begin
(if
(= show_cutscenes true) c10_20)))

(script static void c10_30
(begin
(if
(= show_cutscenes true) c10_30)))

(script static void cutscenes_on
(begin
(set show_cutscenes true)))

(script static void cutscenes_off
(begin
(set show_cutscenes false)))

(script static void game_save_pmc
(begin
(game_save_cancel)
(game_save_no_timeout)))

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

(script startup void zombie_friends
(begin
(ai_allegiance player zombie)))

(script startup void c10_offender_startup
(begin
(fade_out 0.00 0.00 0.00 0) c10_offender_startup
(if c10_offender_startup c10_offender_startup) c10_offender_startup
(ai_place zom01)
(ai_place civ01)
(ai_place army01/army01_01)
(ai_place army01/army01_02)
(ai_place army01/army01_03)
(ai_place army01/army01_04)
(object_create diner_truck)
(object_create diner_fire)
(object_teleport c10_offender_startup start_after_cinema_flag)
(object_teleport c10_offender_startup start_after_cinema_flag_p2) c10_offender_startup
(fade_in 0.00 0.00 0.00 30)))

(script startup void turn_on_jukebox
(begin
(sleep_until
(volume_test_objects jukebox_on
(players_current)))
(sound_looping_start sound\music\soundtrack\soundtrack jukebox 1.00)))

(script startup void turn_off_jukebox
(begin
(sleep_until
(volume_test_objects jukebox_off
(players_current)))
(sound_looping_stop sound\music\soundtrack\soundtrack)))

(script startup void army_gate_01_script
(begin
(sleep_until
(volume_test_objects army_gate_01_trigger
(players_current)))
(print army_gate_01)
(ai_set_current_state army01/army01_03 guard)
(ai_set_current_state army01/army01_04 guard) army_gate_01_script))

(script dormant void army02_placement
(begin
(sleep_until
(volume_test_objects save01
(players_current)))
(ai_place army02/army02_01)
(ai_place army02/army02_02)
(ai_place army02/army02_03)
(ai_place zom02/zom02_01)
(ai_place zom02/zom02_02)))

(script continuous void save01_trigger
(begin
(sleep_until
(volume_test_objects save01
(players_current))) save01_trigger
(sleep
(* 30.00 360.00))))

(script dormant void zom02_04_spawn_script
(begin
(if
(not
(game_is_cooperative))
(begin
(sleep_until
(volume_test_objects zom02_04_spawn
(players_current)))
(ai_place zom02/zom02_04)))))

(script dormant void zom02_05_spawn_script
(begin
(sleep_until
(volume_test_objects sniper_see_zombies_trigger
(players_current))) zom02_05_spawn_script
(if
(not
(game_is_cooperative))
(begin
(sleep
(* 30.00 30.00))
(ai_place zom02/zom02_05)))))

(script dormant void zom02_06_spawn_script
(begin
(sleep_until
(volume_test_objects send_in_the_zombies
(players_current))) zom02_06_spawn_script
(sleep_until
(not
(objects_can_see_flag
(players_current) send_zombies 55.00)) 1)
(if
(not
(game_is_cooperative))
(begin
(print send in the zombies)
(ai_place zom02/zom02_06)))))

(script dormant void army03_placement
(begin
(sleep_until
(or
(volume_test_objects power_up_civs01
(players_current))
(volume_test_objects save02
(players_current))))
(ai_place army03/army03_01)
(ai_place army03/army03_09_sniper)
(ai_place army03/army03_02)
(ai_command_list zom01 zom_pre_jeep)
(ai_command_list zom02 zom_pre_jeep)))

(script dormant void wake_up_army3_trigger
(begin
(sleep_until
(volume_test_objects wake_up_army3
(players_current)))
(ai_set_current_state army03 guard)))

(script startup void back_alley_save_script
(begin
(sleep_until
(volume_test_objects back_alley_save
(players_current))) back_alley_save_script))

(script continuous void save02_trigger_save
(begin
(if
(volume_test_objects save02
(players_current))
(begin save02_trigger_save
(sleep
(* 30.00 60.00))))))

(script static void place_army03_dudes
(begin
(if
(= have_placed_dudes false)
(begin
(ai_place army03/army03_03)
(ai_place army03/army03_04)
(ai_place army03/army03_05)
(ai_place army03/army03_08_bazooka)
(ai_place army02/army02_04)
(if
(not
(game_is_cooperative))
(ai_kill army03/army03_01))
(ai_place zom02/zom02_06)
(set have_placed_dudes true)))
(ai_set_current_state army03/army03_05 sleep)
(ai_set_current_state army03/army03_08_bazooka sleep)))

(script dormant void army03_mid_point_trigger
(begin
(sleep_until
(volume_test_objects army03_mid_point
(players_current))) army03_mid_point_trigger))

(script continuous void save_army03_mid
(begin
(sleep_until
(volume_test_objects army03_mid_point
(players_current))) save_army03_mid
(sleep
(* 30.00 360.00))))

(script dormant void army03_end_trigger
(begin
(sleep_until
(volume_test_objects army03_end
(players_current)))
(ai_set_current_state army03/army03_05 move_loop)
(ai_set_current_state army03/army03_08_bazooka move_loop)
(ai_kill army03/army03_01)
(ai_kill army03/army03_02)
(ai_kill army03/army03_03)))

(script continuous void save_army03_end
(begin
(sleep_until
(volume_test_objects army03_end
(players_current))) save_army03_end
(sleep
(* 30.00 360.00))))

(script dormant void save03_trigger
(begin
(sleep_until
(volume_test_objects save03
(players_current)))
(ai_place civ02/civ02_04)
(print saving3) save03_trigger))

(script continuous void sleepy_time
(begin
(print sleepy_time)
(if
(not
(game_is_cooperative))
(begin
(sleep_until
(and
(volume_test_objects save03
(players_current))
(= tired_as_fuck false)))
(ai_set_current_state army03/army03_05 sleep)
(ai_set_current_state army03/army03_08_bazooka sleep)
(print put to sleep...)
(set tired_as_fuck true)))))

(script continuous void wakey_wakey_eggs_n_bakey
(begin
(print wakey_wakey)
(if
(not
(game_is_cooperative))
(begin
(sleep_until
(and
(or
(volume_test_objects army03_end
(players_current))
(volume_test_objects library_wall_attack
(players_current))
(volume_test_objects sneaky_sneaky01
(players_current)))
(= tired_as_fuck true)))
(ai_set_current_state army03 guard)
(ai_set_current_state army03/army03_08_bazooka guard)
(print woke them up...)
(set tired_as_fuck false)))))

(script dormant void power_up_trigger
(begin
(sleep_until
(volume_test_objects power_up_civs01
(players_current)))
(ai_place civ02/civ02_02) power_up_trigger power_up_trigger))

(script dormant void sniper_save
(begin
(sleep_until
(volume_test_objects sniper_save_trigger
(players_current))) sniper_save))

(script continuous void final_fight_respawners
(begin
(sleep
(* 30.00 30.00))
(if
(=
(ai_living_count army05/army05_spawn) 0)
(ai_place army05/army05_spawn))
(if
(<
(ai_living_count army05/food) 2)
(ai_place army05/food))))

(script startup void blorg
(begin
(sleep -1 final_fight_respawners)))

(script static void final_fight_trigger
(begin
(sleep -1 final_fight_respawners)
(sleep_until
(volume_test_objects final_fight
(players_current)))
(fade_out 0.00 0.00 0.00 0) final_fight_trigger
(game_save_cancel)
(if final_fight_trigger final_fight_trigger) final_fight_trigger
(ai_place army05/army05_ground)
(ai_place army05/army05_towers)
(ai_place army05/food)
(ai_place army05/army05_spawn)
(object_teleport final_fight_trigger start_final_fight)
(object_teleport final_fight_trigger start_final_fight_p2)
(print saving5) final_fight_trigger
(fade_in 0.00 0.00 0.00 30)
(wake final_fight_respawners)))

(script static void final_fight_go
(begin
(fade_out 0.00 0.00 0.00 0) final_fight_go
(game_save_cancel)
(if final_fight_go final_fight_go) final_fight_go
(ai_place army05/army05_ground)
(ai_place army05/army05_towers)
(ai_place army05/food)
(ai_place army05/army05_spawn)
(object_teleport final_fight_go start_final_fight)
(object_teleport final_fight_go start_final_fight_p2)
(print saving5) final_fight_go
(fade_in 0.00 0.00 0.00 30)
(wake final_fight_respawners)))

(script dormant void library_jeep_arrive
(begin
(sleep_until
(and
(volume_test_objects library_wall_attack
(players_current))
(and
(<
(ai_strength army03/army03_05) 0.50)
(<
(ai_strength army03/army03_08_bazooka) 0.50)))) library_jeep_arrive
(sleep_until
(and
(not
(objects_can_see_flag
(players_current) lib_jeep 50.00))
(not
(volume_test_objects lib_jeep_zone
(players_current)))) 1)
(object_create library_wall_jeep)
(ai_place army03/army03_06_jeep)
(ai_force_active army03/army03_06_jeep true)
(object_activation_add_object library_wall_jeep)
(vehicle_load_magic library_wall_jeep 
(ai_actors army03/army03_06_jeep))
(sleep 60)
(object_activation_clear)
(recording_play library_wall_jeep jeep_drives_in)
(sleep
(recording_time library_wall_jeep))
(ai_exit_vehicle army03/army03_06_jeep)))

(script dormant void save04_trigger
(begin
(sleep_until
(volume_test_objects save04
(players_origin)))
(print saving4) save04_trigger
(ai_place civ02/civ02_03)))

(script continuous void zombies_exit_jeep
(begin
(if library_wall_encounter
(begin
(if
(volume_test_objects exit_jeep
(players_current))
(begin
(ai_exit_vehicle zom02)))))
(sleep 19)))

(script static void set_random_library_wall_spot
(begin
(set library_wall_spot
(random_range 0 library_wall_spots))
(if
(= library_wall_spot 0)
(begin
(set library_wall_command_list attack_library_wall1))
(if
(= library_wall_spot 1)
(begin
(set library_wall_command_list attack_library_wall2))
(if
(= library_wall_spot 2)
(begin
(set library_wall_command_list attack_library_wall3))
(if
(= library_wall_spot 3)
(begin
(set library_wall_command_list attack_library_wall4))))))))

(script dormant void library_wall_message_script
(begin
(sleep_until
(volume_test_objects library_wall_message
(players_current)))
(if library_wall_encounter
(begin
(show_hud_help_text true)
(hud_set_help_text wall1)
(sleep
(* 30.00 15.00))
(show_hud_help_text false)))))

(script continuous void library_wall_command_list
(begin
(if library_wall_encounter
(begin
(activate_nav_point_object default library_wall_command_list library_wall 0.00)
(activate_nav_point_object default library_wall_command_list library_wall 0.00)
(set library_wall_zombie_index
(+ library_wall_zombie_index 1.00))
(if
(>= library_wall_zombie_index library_wall_spots)
(set library_wall_zombie_index 0))
(set zombie_attacker_lib
(unit
(list_get
(ai_actors zombies_attack_library_wall/attack_wall) library_wall_zombie_index)))
(if
(and
(=
(ai_command_list_status zombie_attacker_lib) 0)
(=
(volume_test_object library_wall_bang zombie_attacker_lib) false))
(begin library_wall_command_list
(ai_command_list_by_unit zombie_attacker_lib library_wall_command_list))))
(begin
(deactivate_nav_point_object library_wall_command_list library_wall)
(deactivate_nav_point_object library_wall_command_list library_wall)))
(sleep 15)))

(script continuous void zombies_attack_library_wall
(begin
(if library_wall_encounter
(begin
(if
(<
(ai_living_count zombies_attack_library_wall/attack_wall) library_wall_spots)
(begin
(set zombie_promotion
(random_range 0
(list_count
(ai_actors zom02))))
(set zombie_attacker_lib
(unit
(list_get
(ai_actors zom02) zombie_promotion)))
(if
(volume_test_object library_wall_attack zombie_attacker_lib)
(begin
(if
(not
(object_region_destroyed zombie_attacker_lib legs))
(ai_migrate_by_unit zombie_attacker_lib zombies_attack_library_wall/attack_wall)
(unit_kill_silent zombie_attacker_lib))))))))
(sleep 17)))

(script continuous void army_fight_lib_wall
(begin
(if
(and library_wall_encounter
(< library_rounds 10.00)
(<
(ai_strength army03/army03_05) 0.20)
(<
(ai_strength army03/army03_08_bazooka) 0.20))
(begin
(sleep
(* 30.00 5.00))
(print library round:)
(inspect library_rounds)
(if
(and
(not
(objects_can_see_flag
(players_current) lib_spawn1 30.00))
(not
(objects_can_see_flag
(players_current) lib_spawn2 30.00))
(not
(objects_can_see_flag
(players_current) lib_spawn3 30.00))
(not
(objects_can_see_flag
(players_current) lib_spawn4 30.00)))
(ai_place army03/army03_07)
(if
(and
(not
(objects_can_see_flag
(players_current) lib_spawn8 30.00))
(not
(objects_can_see_flag
(players_current) lib_spawn9 30.00))
(not
(objects_can_see_flag
(players_current) lib_spawn10 30.00))
(not
(objects_can_see_flag
(players_current) lib_spawn11 30.00)))
(ai_place army03/army03_07_03)
(if
(and
(not
(objects_can_see_flag
(players_current) lib_spawn5 30.00))
(not
(objects_can_see_flag
(players_current) lib_spawn6 30.00))
(not
(objects_can_see_flag
(players_current) lib_spawn7 30.00))
(not
(volume_test_objects i_suck_trigger
(players_current)))
(not
(volume_test_objects bazooka_nest
(players_current))))
(ai_place army03/army03_07_02)
(begin
(sleep_until
(and
(not
(objects_can_see_flag
(players_current) lib_spawn8 30.00))
(not
(objects_can_see_flag
(players_current) lib_spawn9 30.00))
(not
(objects_can_see_flag
(players_current) lib_spawn10 30.00))
(not
(objects_can_see_flag
(players_current) lib_spawn11 30.00))))
(ai_place army03/army03_07_03)))))
(sleep 5)
(ai_force_active army03/army03_07 true)
(ai_force_active army03/army03_07_02 true)
(ai_force_active army03/army03_07_03 true)
(set library_rounds
(+ library_rounds 1.00))
(sleep_until
(and
(<
(ai_strength army03/army03_07) 0.10)
(<
(ai_strength army03/army03_07_02) 0.10)
(<
(ai_strength army03/army03_07_03) 0.10)))
(sleep
(* 30.00 10.00))))))

(script continuous void damage_the_library_wall
(begin
(if library_wall_encounter
(begin
(set library_wall_health
(- library_wall_health
(* library_wall_damage_rate
(list_count
(objects_in_volume
(ai_actors zombies_attack_library_wall/attack_wall) library_wall_bang)))))
(object_set_current_vitality library_wall
(-
(*
(object_get_health library_wall) 2500.00)
(* library_wall_damage_rate
(list_count
(objects_in_volume
(ai_actors zombies_attack_library_wall/attack_wall) library_wall_bang)))) 1.00)
(inspect
(object_get_health library_wall))))
(sleep 30)))

(script dormant void library_wall_smoke
(begin
(sleep_until
(>
(device_get_position library_wall) 0.70) 1)
(object_create lw_dust_1)
(object_create lw_dust_2)
(object_create lw_dust_3)
(object_create lw_dust_4)
(object_create lw_dust_5)
(sleep 30)
(object_destroy lw_dust_1)
(object_destroy lw_dust_2)
(object_destroy lw_dust_3)
(object_destroy lw_dust_4)
(object_destroy lw_dust_5)))

(script dormant void lab_wall_smoke
(begin
(sleep_until
(>
(device_get_position lab_wall) 0.70) 1)
(object_create lab_dust_1)
(object_create lab_dust_2)
(object_create lab_dust_3)
(object_create lab_dust_4)
(object_create lab_dust_5)
(sleep 30)
(object_destroy lab_dust_1)
(object_destroy lab_dust_2)
(object_destroy lab_dust_3)
(object_destroy lab_dust_4)
(object_destroy lab_dust_5)))

(script static void end_library_wall
(begin
(if
(not end_library_wall_played)
(begin
(set end_library_wall_played true) end_library_wall
(ai_disregard
(players_origin) true)
(camera_set temp_library_cutscene 45)
(sleep 45)
(object_activation_add_object library_wall)
(device_set_position library_wall 1.00)
(wake library_wall_smoke)
(sleep_until
(=
(device_get_position library_wall) 1.00))
(ai_command_list zombies_attack_library_wall run_to_library) end_library_wall
(sleep
(* 30.00 5.00))
(ai_disregard
(players_origin) false)))))

(script continuous void kill_the_library_wall
(begin
(if library_wall_encounter
(begin
(if
(<=
(object_get_health library_wall) 0.00)
(begin
(set library_wall_encounter false)
(set library_music false) kill_the_library_wall))))))

(script dormant void make_bazooka_aggro
(begin
(sleep_until
(or
(volume_test_objects library_wall_attack
(players_current))
(volume_test_objects near_lib_wall
(players_current))))
(ai_magically_see_players army03/army03_08_bazooka)))

(script dormant void start_library_wall
(begin
(sleep_until
(or
(volume_test_objects army03_end
(players_current))
(volume_test_objects library_wall_attack
(players_current))))
(ai_set_current_state army03/army03_05 guard)
(set library_wall_encounter true) start_library_wall))

(script dormant void spawn_ass_fuckers
(begin
(sleep_until
(<=
(object_get_health lab_wall) 0.75)) spawn_ass_fuckers
(if
(not
(objects_can_see_flag
(players_current) zooka1 30.00))
(begin
(ai_place army05/army05_fuck_you_up)
(ai_force_active army05/army05_fuck_you_up true))
(begin
(ai_place army05/army05_fuck_you_up_good)
(ai_force_active army05/army05_fuck_you_up_good true)))
(print bazooka dude is placed... watch out!)
(sleep_until
(<=
(object_get_health lab_wall) 0.45)) spawn_ass_fuckers
(print here come reinforcements!)
(if
(and
(not
(objects_can_see_flag
(players_current) lab_spawn1 30.00))
(not
(objects_can_see_flag
(players_current) lab_spawn2 30.00))
(not
(objects_can_see_flag
(players_current) lab_spawn3 30.00))
(not
(objects_can_see_flag
(players_current) lab_spawn4 30.00)))
(begin
(ai_place army06/army06_01))
(begin
(if
(and
(not
(objects_can_see_flag
(players_current) lab_spawn5 30.00))
(not
(objects_can_see_flag
(players_current) lab_spawn6 30.00)))
(begin
(ai_place army06/army06_03))
(ai_place army06/army06_04))))
(sleep_until
(<=
(object_get_health lab_wall) 0.25)) spawn_ass_fuckers
(print chaaaarge!!!)
(ai_migrate army06/army06_01 army06/army06_02)
(ai_migrate army06/army06_03 army06/army06_02)))

(script static void set_random_lab_wall_spot
(begin
(set lab_wall_spot
(random_range 0 lab_wall_spots))
(if
(= lab_wall_spot 0)
(begin
(set lab_wall_command_list attack_lab_wall1))
(if
(= lab_wall_spot 1)
(begin
(set lab_wall_command_list attack_lab_wall2))
(if
(= lab_wall_spot 2)
(begin
(set lab_wall_command_list attack_lab_wall3))
(if
(= lab_wall_spot 3)
(begin
(set lab_wall_command_list attack_lab_wall4))
(if
(= lab_wall_spot 4)
(begin
(set lab_wall_command_list attack_lab_wall5))
(if
(= lab_wall_spot 5)
(begin
(set lab_wall_command_list attack_lab_wall6))))))))))

(script continuous void lab_wall_command_list
(begin
(if lab_wall_encounter
(begin
(set lab_wall_zombie_index
(+ lab_wall_zombie_index 1.00))
(if
(>= lab_wall_zombie_index lab_wall_spots)
(set lab_wall_zombie_index 0))
(set zombie_attacker
(unit
(list_get
(ai_actors zombies_attack_lab_wall/lab_wall) lab_wall_zombie_index)))
(if
(and
(=
(ai_command_list_status zombie_attacker) 0)
(=
(volume_test_object lab_wall_bang zombie_attacker) false)
(not
(object_region_destroyed zombie_attacker legs)))
(begin lab_wall_command_list
(ai_command_list_by_unit zombie_attacker lab_wall_command_list)))))
(sleep 15)))

(script dormant void zombie_help_at_lab_wall
(begin
(sleep_until
(or
(volume_test_object lab_wall_break zombie_help_at_lab_wall)
(volume_test_object lab_wall_break zombie_help_at_lab_wall))) zombie_help_at_lab_wall
(print placing some zombies for help...)
(ai_place zom04/help_from_your_friends)
(sleep
(* 30.00 30.00))
(ai_migrate zom04/help_from_your_friends zombie_squad/zombie_squad_squad)))

(script continuous void zombies_attack_wall
(begin
(if lab_wall_encounter
(begin
(if
(<
(ai_living_count zombies_attack_lab_wall/lab_wall) lab_wall_spots)
(begin
(set temp_unit
(unit
(list_get
(ai_actors zombie_squad) 0)))
(if
(not
(object_region_destroyed temp_unit legs))
(ai_migrate_by_unit temp_unit zombies_attack_lab_wall/lab_wall)
(unit_kill_silent temp_unit))))))
(sleep 30)))

(script static void finish_level
(begin finish_level
(ai_disregard
(players_origin) true)
(camera_set temp_ending_cutscene 45)
(sleep 45)
(if
(or
(volume_test_objects right_behind_lab_wall
(players_current))
(volume_test_objects right_behind_lab_wall
(players_origin)))
(begin
(object_teleport finish_level end_stubbs)
(object_teleport finish_level end_grubbs)
(object_teleport finish_level end_pos1)
(object_teleport finish_level end_pos2)))
(object_activation_add_object lab_wall)
(device_set_position lab_wall 1.00)
(wake lab_wall_smoke)
(sleep_until
(=
(device_get_position lab_wall) 1.00))
(ai_command_list zombies_attack_lab_wall run_to_lab)
(fade_out 0.00 0.00 0.00 30)
(sleep 30) finish_level
(fade_out 0.00 0.00 0.00 0)
(object_teleport finish_level end_stubbs)
(object_teleport finish_level end_grubbs)
(object_teleport finish_level end_pos1)
(object_teleport finish_level end_pos2) finish_level
(game_save_cancel)
(if finish_level finish_level) finish_level
(game_won)))

(script continuous void damage_the_wall
(begin
(if lab_wall_encounter
(begin
(set lab_wall_health
(- lab_wall_health
(* lab_wall_damage_rate
(list_count
(objects_in_volume
(ai_actors zombies_attack_lab_wall/lab_wall) lab_wall_bang)))))
(object_set_current_vitality lab_wall
(-
(*
(object_get_health lab_wall) 11000.00)
(* lab_wall_damage_rate
(list_count
(objects_in_volume
(ai_actors zombies_attack_lab_wall/lab_wall) lab_wall_bang)))) 1.00)
(inspect
(object_get_health lab_wall))))
(sleep 30)))

(script continuous void kill_the_wall
(begin
(if lab_wall_encounter
(begin
(if
(<=
(object_get_health lab_wall) 0.00)
(begin
(set lab_wall_encounter false)
(set lab_music false) kill_the_wall))))))

(script dormant void lab_wall_start
(begin
(sleep_until
(volume_test_objects final_fight
(players_current)))
(set lab_wall_encounter true)
(set lab_music true)))

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
(= library_music false)
(= lab_music false)) 1)
(print hand_music: on)
(sound_looping_start sound\music\hand_3\hand_3 none 1.00)
(sleep_until
(or
(= hand_music false)
(= library_music true)
(= lab_music true) hand_music_script) 1)
(print hand_music: off)
(sound_looping_stop sound\music\hand_3\hand_3)))

(script continuous void library_wall_music_script
(begin
(sleep_until
(= library_music true) 1)
(if hand_music
(sleep 30))
(print library_wall_music: on)
(sound_looping_start sound\music\c10\library_wall none 0.85)
(sleep_until
(or
(= library_music false) library_wall_music_script) 1)
(print library_wall_music: off)
(sound_looping_stop sound\music\c10\library_wall)))

(script continuous void lab_wall_music_script
(begin
(sleep_until
(= lab_music true) 1)
(if hand_music
(sleep 30))
(print lab_wall_music: on)
(sound_looping_start sound\music\c10\lab_wall none 0.85)
(sleep_until
(or
(= lab_music false) lab_wall_music_script) 1)
(print lab_wall_music: off)
(sound_looping_stop sound\music\c10\lab_wall)))

(script dormant void library_bsp_switch_script
(begin
(sleep_until
(volume_test_objects library_bsp_switch
(players_current)))
(set library_wall_encounter false)
(set library_music false)
(fade_out 0.00 0.00 0.00 30)
(sleep 30)
(volume_teleport_players_not_inside library_not_in_trig library_bsp_switch_pos2)
(switch_bsp 2)
(wake spawn_ass_fuckers)
(wake zombie_help_at_lab_wall)
(wake lab_wall_start) library_bsp_switch_script))

(script startup void diner_bsp_switch_script
(begin
(sleep_until
(volume_test_objects diner_bsp_switch
(players_origin)))
(sound_looping_stop sound\music\soundtrack\soundtrack)
(volume_teleport_players_not_inside diner_bsp_switch diner_bsp_switch_pos2)
(sleep 30)
(switch_bsp 1)
(wake wake_up_army3_trigger)
(wake army02_placement)
(wake army03_placement)
(wake army03_mid_point_trigger)
(wake army03_end_trigger)
(wake zom02_05_spawn_script)
(wake library_jeep_arrive)
(wake zom02_04_spawn_script)
(wake zom02_06_spawn_script)
(wake save03_trigger)
(wake power_up_trigger)
(wake sniper_save)
(wake save04_trigger)
(wake library_wall_message_script)
(wake start_library_wall)
(wake library_bsp_switch_script)
(object_create_anew diner_back_door)))

(script static void checkpoint2
(begin
(switch_bsp 1)
(wake wake_up_army3_trigger)
(wake army02_placement)
(wake army03_placement)
(wake army03_mid_point_trigger)
(wake army03_end_trigger)
(wake zom02_05_spawn_script)
(wake library_jeep_arrive)
(wake zom02_04_spawn_script)
(wake zom02_06_spawn_script)
(wake save03_trigger)
(wake power_up_trigger)
(wake sniper_save)
(wake save04_trigger)
(wake library_wall_message_script)
(wake start_library_wall)
(wake library_bsp_switch_script)
(wake make_bazooka_aggro)
(object_teleport checkpoint2 checkpoint2_start)
(object_teleport checkpoint2 checkpoint2_start_p2) checkpoint2))

(script static void checkpoint3
(begin
(switch_bsp 1)
(wake wake_up_army3_trigger)
(wake army02_placement)
(wake army03_placement)
(wake army03_mid_point_trigger)
(wake army03_end_trigger)
(wake zom02_05_spawn_script)
(wake library_jeep_arrive)
(wake zom02_04_spawn_script)
(wake zom02_06_spawn_script)
(wake save03_trigger)
(wake power_up_trigger)
(wake sniper_save)
(wake save04_trigger)
(wake library_wall_message_script)
(wake start_library_wall)
(wake library_bsp_switch_script)
(wake make_bazooka_aggro)
(object_teleport checkpoint3 checkpoint3_start)
(object_teleport checkpoint3 checkpoint3_start_p2)
(if
(= have_placed_dudes false)
(begin
(ai_place army03/army03_05)
(ai_place army03/army03_08_bazooka)
(set have_placed_dudes true)))
(ai_set_current_state army03/army03_05 move_loop)
(ai_set_current_state army03/army03_08_bazooka move_loop)))

(script static void checkpoint4
(begin
(switch_bsp 0)
(object_teleport checkpoint4 jukebox_test_flag)
(object_teleport checkpoint4 jukebox_test_flag_p2)))

(script static void checkpoint5
(begin
(switch_bsp 2)
(wake spawn_ass_fuckers)
(wake zombie_help_at_lab_wall)
(wake lab_wall_start) checkpoint5
(set lab_wall_encounter true)))

(script dormant void animate_monday
(begin
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep 83)
(unit_stop_custom_animation 10_monday_1)
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed no true)
(sleep
(unit_get_custom_animation_time 10_monday_1))
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep 18)
(unit_stop_custom_animation 10_monday_1)
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed point true)
(sleep
(unit_get_custom_animation_time 10_monday_1))
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep 36)
(unit_stop_custom_animation 10_monday_1)
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed laugh true)
(sleep
(unit_get_custom_animation_time 10_monday_1))
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep 10)
(unit_stop_custom_animation 10_monday_1)
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed point true)
(sleep
(unit_get_custom_animation_time 10_monday_1))
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 10_monday_1))
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep 10)
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed shrug true)
(sleep
(unit_get_custom_animation_time 10_monday_1))
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 10_monday_1))
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed shrug true)
(sleep
(unit_get_custom_animation_time 10_monday_1))
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed yes true)
(sleep
(unit_get_custom_animation_time 10_monday_1))
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed laugh true)
(sleep
(unit_get_custom_animation_time 10_monday_1))
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 10_monday_1))
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)))

(script dormant void 10_dialog_1
(begin
(sleep 10)
(sound_impulse_start sound\dialog\c10\10_maggie_1 10dd_tv_1 1.00)
(sleep 113)
(sound_impulse_start sound\dialog\c10\10_monday_1 10dd_tv_1 1.00)
(sleep 395)
(sound_impulse_start sound\dialog\c10\10_maggie_2 10dd_tv_1 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\c10\10_maggie_2) 10.00))
(sound_impulse_start sound\dialog\c10\10_maggie_3 10dd_tv_1 1.00)
(sleep 145)
(sound_impulse_start sound\dialog\c10\10_monday_2 10dd_tv_1 1.00)))

(script dormant void 10_foley
(begin
(sound_looping_start sound\cinematics\c10\10_foley_1 none 1.00)
(sleep 1417)
(sound_impulse_start sound\cinematics\c10\10_foley_2 none 1.00)
(sleep 637)
(sound_impulse_start sound\cinematics\c10\10_foley_3 none 1.00)))

(script static void c10_10_run
(begin
(fade_out 0.00 0.00 0.00 0)
(sound_looping_predict sound\cinematics\c10\10_foley_1) c10_10_run
(object_activation_add_camera 10_07)
(object_teleport c10_10_run 10_hide_player)
(object_teleport c10_10_run 10_hide_player)
(sound_class_set_gain ambient_nature 0.50 0)
(sound_class_set_gain ambient_machinery 0.50 0)
(sleep 5)
(wake 10_foley)
(print c10_10: introduction)
(object_create 10_stubbs_1)
(object_beautify 10_stubbs_1 true)
(object_create 10_maggie_1)
(object_beautify 10_maggie_1 true)
(objects_cannot_take_damage 10_maggie_1 true)
(objects_cannot_lose_regions 10_maggie_1 true)
(object_create 10_monday_1)
(object_beautify 10_monday_1 true)
(unit_set_weapon 10_monday_1 none)
(objects_cannot_take_damage 10_monday_1 true)
(objects_cannot_lose_regions 10_monday_1 true)
(object_create 10_skegness_1)
(unit_set_weapon 10_skegness_1 none)
(objects_cannot_take_damage 10_skegness_1 true)
(objects_cannot_lose_regions 10_skegness_1 true)
(object_create 10_civ_1)
(object_create 10_army_1)
(object_create 10_army_2)
(ai_place 10_panic)
(ai_place 10_target)
(camera_set 10_01 0)
(fade_in 0.00 0.00 0.00 30)
(camera_set 10_02 90)
(sleep 90)
(camera_set 10_03 90)
(sleep 90)
(camera_set 10_04 120)
(sleep 90)
(camera_set 10_04b 60)
(sleep 30)
(camera_set 10_05 90)
(sleep 60)
(camera_set 10_06 90)
(sleep 30)
(custom_animation 10_stubbs_1 cinematics\animations\stubbs\c10\c10 c10_10_stubbs_1 false)
(sleep 30)
(camera_set 10_07 90)
(sleep 30)
(sound_impulse_start sound\dialog\c10\10_chumley_1 10dd_tv_1 1.00)
(sleep
(unit_get_custom_animation_time 10_stubbs_1))
(camera_video_enable true)
(camera_video_set 10_10)
(camera_set 10_08 0)
(camera_set 10_08c 300)
(sleep 60)
(custom_animation 10_stubbs_1 cinematics\animations\stubbs\c10\c10 c10_10_stubbs_turncorner false)
(sleep
(unit_get_custom_animation_time 10_stubbs_1))
(custom_animation 10_stubbs_1 cinematics\animations\stubbs\c10\c10 c10_10_stubbs_seetv false)
(camera_set 10_08b 0)
(camera_set 10_09 90)
(object_teleport 10_maggie_1 10_maggie_1)
(sleep 60)
(ai_erase_all)
(unit_custom_animation_at_frame 10_maggie_1 cinematics\animations\maggie\c10\c10 c10_10_maggie_1 false 370)
(unit_custom_animation_at_frame 10_monday_1 cinematics\animations\monday\c10\c10 c10_10_monday_1 false 370)
(unit_custom_animation_at_frame 10_skegness_1 cinematics\animations\skegness\c10\c10 c10_10_skegness_1 false 370)
(wake 10_dialog_1)
(camera_set 10_09c 60)
(sleep 61)
(camera_set 10_09d 1200)
(sleep
(unit_get_custom_animation_time 10_maggie_1))
(object_destroy 10_maggie_1)
(sleep
(-
(unit_get_custom_animation_time 10_monday_1) 45.00))
(camera_video_enable false)
(object_teleport 10_stubbs_1 10_stubbs_kick)
(custom_animation 10_stubbs_1 cinematics\animations\stubbs\c10\c10 c10_10_stubbs_kick false)
(camera_set 10_11 0)
(sleep 25)
(object_create 10_tv_2)
(object_destroy 10dd_tv_1)
(sleep 4)
(fade_out 0.00 0.00 0.00 0) c10_10_run
(object_teleport c10_10_run 10_player0_start)
(object_teleport c10_10_run 10_player1_start)
(object_activation_clear)
(ai_erase 10_panic)
(object_destroy_containing 10_)
(object_create 10dd_tv_1)
(sound_class_set_gain ambient_nature 1.00 30)
(sound_class_set_gain ambient_machinery 1.00 30)))

(script dormant void animate_20_wye
(begin
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed threaten true)
(sleep
(unit_get_custom_animation_time 20_wye_1))
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep -1)
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_wye_1))
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep -1)
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed point true)
(sleep
(unit_get_custom_animation_time 20_wye_1))
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_wye_1))
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed threaten true)
(sleep
(unit_get_custom_animation_time 20_wye_1))
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed shrug true)
(sleep
(unit_get_custom_animation_time 20_wye_1))
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_wye_1))
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_wye_1))
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep 59)
(unit_stop_custom_animation 20_wye_1)
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed laugh true)
(sleep
(unit_get_custom_animation_time 20_wye_1))
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed point true)
(sleep
(unit_get_custom_animation_time 20_wye_1))
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_wye_1))
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed threaten true)
(sleep
(unit_get_custom_animation_time 20_wye_1))
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_wye_1))
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep 41)
(unit_stop_custom_animation 20_wye_1)
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed shrug true)
(sleep
(unit_get_custom_animation_time 20_wye_1))
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_wye_1))
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_wye_1))
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_wye_1))
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_wye_1))
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_wye_1))
(custom_animation 20_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)))

(script dormant void animate_20_commander
(begin
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle false)
(sleep
(unit_get_custom_animation_time 20_commander_1))
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_commander_1))
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_commander_1))
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep -1)
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle false)
(sleep
(unit_get_custom_animation_time 20_commander_1))
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_commander_1))
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep -1)
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle false)
(sleep
(unit_get_custom_animation_time 20_commander_1))
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep -1)
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed no true)
(sleep
(unit_get_custom_animation_time 20_commander_1))
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep 32)
(unit_stop_custom_animation 20_commander_1)
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed point true)
(sleep
(unit_get_custom_animation_time 20_commander_1))
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_commander_1))
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_commander_1))
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_commander_1))
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_commander_1))
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_commander_1))
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_commander_1))
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep 24)
(unit_stop_custom_animation 20_commander_1)
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed threaten true)
(sleep
(unit_get_custom_animation_time 20_commander_1))
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed no true)
(sleep
(unit_get_custom_animation_time 20_commander_1))
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep 56)
(unit_stop_custom_animation 20_commander_1)
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed laugh true)
(sleep
(unit_get_custom_animation_time 20_commander_1))
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_commander_1))
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_commander_1))
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 20_commander_1))
(custom_animation 20_commander_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)))

(script static void c10_20_run
(begin
(fade_out 0.00 0.00 0.00 0)
(switch_bsp 2)
(sound_looping_predict sound\cinematics\c10\20_foley_1) c10_20_run
(object_activation_add_camera 20_01)
(sound_class_set_gain ambient_nature 0.25 10)
(sound_class_set_gain ambient_machinery 0.25 10)
(sound_class_set_gain device_machinery 0.25 10)
(object_create 20_wye_1)
(object_beautify 20_wye_1 true)
(object_set_permutation 20_wye_1 forcefield ~damaged)
(object_create 20_commander_1)
(object_beautify 20_commander_1 true)
(unit_set_weapon 20_commander_1 weapons\m14_rifle\m14_rifle)
(unit_set_seat 20_commander_1 alert)
(object_create 20_army_2)
(unit_set_seat 20_army_2 alert)
(unit_set_weapon 20_army_2 weapons\m14_rifle\m14_rifle)
(object_create 20_army_3)
(unit_set_seat 20_army_3 alert)
(unit_set_weapon 20_army_3 weapons\m14_rifle\m14_rifle)
(object_create 20_army_4)
(unit_set_seat 20_army_4 alert)
(object_create 20_army_5)
(unit_set_seat 20_army_5 alert)
(unit_set_weapon 20_army_5 weapons\m14_rifle\m14_rifle)
(object_create 20_army_6)
(unit_set_seat 20_army_6 alert)
(unit_set_weapon 20_army_6 weapons\m14_rifle\m14_rifle)
(object_create 20_army_7)
(unit_set_seat 20_army_7 alert)
(unit_set_weapon 20_army_7 weapons\m14_rifle\m14_rifle)
(object_create 20_stubbs_1)
(sleep 30)
(sound_looping_start sound\cinematics\c10\20_foley_1 none 1.00)
(print c10_20:  outside lab)
(wake animate_20_commander)
(custom_animation 20_wye_1 cinematics\animations\wye\c10\c10 c10_20_wye_1 false)
(sleep 1)
(camera_set 20_02 0)
(camera_set 20_02b 300)
(fade_in 0.00 0.00 0.00 0)
(sleep 27)
(sound_impulse_start sound\dialog\c10\20_wye_1 20_wye_1 1.00)
(sleep
(sound_impulse_time sound\dialog\c10\20_wye_1))
(custom_animation 20_commander_1 cinematics\animations\commander\c10\c10 c10_20_commander_1 false)
(camera_set 20_03 0)
(camera_set 20_03b 180)
(sleep 6)
(sound_impulse_start sound\dialog\c10\20_commander_1 20_commander_1 1.00)
(sleep
(unit_get_custom_animation_time 20_commander_1))
(custom_animation 20_wye_1 cinematics\animations\wye\c10\c10 c10_20_wye_2 false)
(camera_set 20_02b 0)
(sleep 2)
(sound_impulse_start sound\dialog\c10\20_wye_2 20_wye_1 1.00)
(sleep
(sound_impulse_time sound\dialog\c10\20_wye_2))
(custom_animation 20_commander_1 cinematics\animations\commander\c10\c10 c10_20_commander_2 false)
(camera_set 20_03b 0)
(sound_impulse_start sound\dialog\c10\20_commander_2 20_commander_1 1.00)
(sleep
(sound_impulse_time sound\dialog\c10\20_commander_2))
(custom_animation 20_wye_1 cinematics\animations\wye\c10\c10 c10_20_wye_jetpack false)
(unit_stop_custom_animation 20_commander_1)
(camera_set 20_02 0)
(camera_set 20_04 180)
(sound_impulse_start sound\dialog\c10\20_wye_3 20_wye_1 1.00)
(sleep
(sound_impulse_time sound\dialog\c10\20_wye_3))
(sleep 150)
(custom_animation 20_commander_1 cinematics\animations\commander\c10\c10 c10_20_commander_3 false)
(camera_set 20_05 0)
(sleep 19)
(sound_impulse_start sound\dialog\c10\20_commander_3 20_commander_1 1.00)
(sleep 20)
(unit_set_seat 20_army_2 stand)
(sleep 2)
(unit_set_seat 20_army_3 stand)
(unit_set_seat 20_army_4 stand)
(sleep 4)
(unit_set_seat 20_army_5 stand)
(unit_set_seat 20_army_6 stand)
(sleep 2)
(unit_set_seat 20_army_7 stand)
(sleep
(unit_get_custom_animation_time 20_commander_1))
(camera_set 20_06 0)
(camera_set 20_06b 90)
(sleep 30)
(recording_play 20_stubbs_1 20_stubbs_1)
(sleep 120)
(fade_out 0.00 0.00 0.00 0) c10_20_run
(object_activation_clear)
(object_destroy_containing 20_)
(sound_class_set_gain ambient_nature 1.00 10)
(sound_class_set_gain ambient_machinery 1.00 10)
(sound_class_set_gain device_machinery 1.00 10)))

(script static void c10_30_run
(begin
(fade_out 0.00 0.00 0.00 0)
(switch_bsp 2)
(sound_looping_predict sound\cinematics\c10\30_foley_1) c10_30_run
(object_activation_add_camera 30_02)
(sleep 30)
(sound_looping_start sound\cinematics\c10\30_foley_1 none 1.00)
(print c10_30:  barricade is breached)
(object_create 30_stubbs_1)
(object_beautify 30_stubbs_1 true)
(object_create 30_zombie_1)
(object_beautify 30_zombie_1 true)
(object_create 30_zombie_2)
(object_beautify 30_zombie_2 true)
(object_create 30_zombie_3)
(object_beautify 30_zombie_3 true)
(object_create 30_zombie_4)
(object_beautify 30_zombie_4 true)
(object_create 30_tank_1)
(camera_set 30_01 0)
(recording_play 30_zombie_1 30_zombie_1)
(recording_play 30_zombie_2 30_zombie_1)
(recording_play 30_zombie_3 30_zombie_1)
(recording_play 30_zombie_4 30_zombie_1)
(sleep 10)
(custom_animation 30_stubbs_1 cinematics\animations\stubbs\c10\c10 c10_30_stubbs_1 false)
(fade_in 0.00 0.00 0.00 0)
(camera_set 30_02 120)
(sleep 45)
(recording_play 30_tank_1 30_tank_1)
(sleep 45)
(camera_set 30_03 0)
(sleep 90)
(fade_out 0.00 0.00 0.00 0) c10_30_run
(object_activation_clear)
(object_destroy_containing 30_)))

(script static void preview
(begin preview preview preview preview))

(script startup void test
(begin
(if
(> test 0) test)
(if
(= test 10) test)
(if
(= test 20) test)
(if
(= test 30) test)))

(script static void next_cutscene
(begin
(map_name levels\c30_lab\c30_lab_cutscene)))

(script static void unlockable_pickup
(begin
(damage_object equipment\hippo\hippo_pickup unlockable_pickup)
(if
(game_is_cooperative)
(damage_object equipment\hippo\hippo_pickup unlockable_pickup))))

(script dormant void unlock_comment_1
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_1) 0.00) 7) unlock_comment_1
(sleep 90)
(cinematic_set_title unlockable_comment)
(sound_looping_start sound\commentary\c10_offender\c10_offender_01 none 1.00)
(sleep
(* 30.00 15.00))
(sleep 60)))

(script dormant void unlock_comment_2
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_2) 0.00) 7) unlock_comment_2
(sleep 90)
(cinematic_set_title unlockable_comment)
(sound_looping_start sound\commentary\c10_offender\c10_offender_02 none 1.00)
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