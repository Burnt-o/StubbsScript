(global bool cutscene_running false)

(global bool hand_music false)

(global bool boss_music false)

(global bool desk_battle false)

(global long cover_1_counter 0)

(global long cover_2_counter 0)

(global long cover_timeout 90)

(global short battle_phase 1)

(global bool shield_breached1 false)

(global bool shield_breached2 false)

(global real health_threshold 0.50)

(global bool health_breached false)

(global bool load_monday false)

(global short single 1)

(global short double 2)

(global short current_weapon single)

(global long last_civ_drop 0)

(global long last_sec_drop 0)

(global short civ_spawn_time 0)

(global short sec_spawn_time 0)

(global weapon nobody none)

(global object_list close_zombies nobody)

(global object_list attacking_zombies nobody)

(global bool close_main_door false)

(global bool gal_left_clear false)

(global bool gal_right_clear false)

(global bool in_rotunda false)

(global bool skegness_fight false)

(global long last_head_time 0)

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

(script static void office_setup
(begin
(switch_bsp 5)
(object_teleport office_setup office_teleport)
(fade_in 0.00 0.00 0.00 0)
(game_save)))

(script static void checkpoint8
(begin checkpoint8))

(script static void c50_10
(begin
(if
(= show_cutscenes true) c50_10)))

(script static void c50_20
(begin
(if
(= show_cutscenes true) c50_20)))

(script static void c50_30
(begin
(if
(= show_cutscenes true) c50_30)))

(script static void cutscenes_on
(begin
(set show_cutscenes true)))

(script startup void allegiance
(begin
(ai_allegiance zombie possessed)
(ai_allegiance zombie player)))

(script startup void into_hall
(begin
(fade_out 0.00 0.00 0.00 0)
(switch_bsp 1)
(sleep 1)
(object_teleport into_hall in_hall_teleport)
(object_teleport into_hall in_hall_teleport2)
(image_effect_set image_effects\zombie_color) into_hall
(device_set_position office_outer 0.00)
(camera_set level_start 0)
(fade_in 0.00 0.00 0.00 30)
(sleep 30)
(camera_control false 90)
(sleep 90) into_hall
(game_save)))

(script startup void hall1
(begin
(sleep 1)
(sleep_until
(volume_test_objects trigger_hall1
(players_current)))
(ai_place hall/balcony_pistols)
(ai_place hall/civ1)
(ai_place hall/civ2)
(ai_place hall/greeter)
(ai_place hall/greeter2)
(ai_place hall/more_stairs1)
(sleep 30)
(device_set_position main_door 1.00)
(ai_set_blind hall true)))

(script startup void hall2
(begin
(sleep 2)
(sleep_until
(or
(volume_test_objects trigger_hall2
(players_current))
(volume_test_objects trigger_hall3
(players_current))
(volume_test_objects trigger_hall_stairs1
(players_current))
(volume_test_objects trigger_hall_floor_right
(players_current))
(volume_test_objects trigger_hall_floor_left
(players_current))))
(ai_place existing_zombies_hall/1)
(ai_place existing_zombies_hall/2)
(ai_set_blind hall false)
(ai_command_list hall/greeter greeter_run)
(ai_berserk hall/greeter true)
(sleep 30)
(set close_main_door true)
(set in_rotunda true)
(sleep 30)
(ai_place hall/stairs_pistol)
(ai_command_list hall/stairs_pistol down_stairs)
(sleep 240)
(ai_command_list hall/stairs_pistol down_stairs2)))

(script startup void civs_flee
(begin
(sleep 4)
(sleep_until
(volume_test_objects trigger_hall3
(players_current)))
(ai_dialogue_triggers false)
(sound_impulse_start sound\dialog\civilian_man_combat\saw_device_killthrough
(list_get
(ai_actors hall/civ1) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\civilian_man_combat\saw_device_killthrough))
(ai_dialogue_triggers true)
(ai_begin_flee hall/civ1 true 60)
(ai_begin_flee hall/civ2 true 60)
(sleep 60)
(ai_command_list hall/civ1 civ1_flee)
(ai_command_list hall/civ2 civ2_flee)
(sleep 150)
(ai_begin_flee_with_cower_chance hall/civ1 false
(* 30.00 10.00) true 0.30)
(ai_begin_flee_with_cower_chance hall/civ2 false
(* 30.00 10.00) true 0.30)))

(script continuous void zombie_spawner
(begin
(sleep_until
(and
(= in_rotunda true)
(and
(<
(ai_living_count existing_zombies_hall/1) 2)
(<
(ai_living_count existing_zombies_hall/2) 2))))
(sleep 30)
(ai_spawn_actor existing_zombies_hall/1)
(sleep 90)
(ai_spawn_actor existing_zombies_hall/2)
(ai_command_list existing_zombies_hall/1 zombies_into_hall3)
(ai_command_list existing_zombies_hall/2 zombies_into_hall4)))

(script continuous void zombie_spawner_off
(begin
(sleep_until
(or
(>
(ai_living_count existing_zombies_hall) 6)
(volume_test_objects trigger_move_zombies
(players_current))))
(sleep -1 zombie_spawner)))

(script startup void zombie_spawner_on
(begin
(sleep_until
(and
(= in_rotunda true)
(<
(ai_living_count existing_zombies_hall) 2)))
(wake zombie_spawner)))

(script continuous void close_main
(begin
(sleep_until
(and
(= close_main_door true)
(volume_test_objects trigger_hall1a
(players_current))))
(device_set_position main_door 0.00)))

(script continuous void open_main
(begin
(sleep_until
(and
(= close_main_door true)
(not
(volume_test_objects trigger_hall1a
(players_current)))))
(device_set_position main_door 1.00)))

(script startup void galleries1
(begin
(sleep 1)
(sleep_until
(volume_test_objects trigger_hall3
(players_current)))
(sleep 45)
(ai_place hall/stairs_doom)
(ai_command_list hall/stairs_doom down_stairs)
(ai_place hall/floor_right_pistols)))

(script startup void galleries2
(begin
(sleep 2)
(sleep_until
(volume_test_objects trigger_hall_floor_right
(players_current)) 1)
(ai_command_list hall/civ1 hall_civ_bath)))

(script startup void hall7
(begin
(sleep 2)
(sleep_until
(volume_test_objects trigger_hall5
(players_current)) 1)
(ai_place hall/bath_pistols_r)
(ai_place hall/bath_pistols_l)
(ai_place hall/bath_civs)
(ai_braindead hall/bath_pistols_r true)
(ai_braindead hall/bath_pistols_l true)))

(script startup void bath_ambush
(begin
(sleep 3)
(sleep_until
(volume_test_objects trigger_right_bath
(players_current)))
(sleep 180)
(ai_braindead hall/bath_pistols_r false)
(ai_braindead hall/bath_pistols_l false)
(device_set_position stall_left 1.00)
(device_set_position stall_right 1.00)
(ai_command_list hall/bath_pistols_r bath_out_r)
(ai_command_list hall/bath_pistols_l bath_out_l)
(device_operates_automatically_set next_left true)
(device_operates_automatically_set next_right true)))

(script startup void gal_right_clear
(begin
(sleep_until
(and
(volume_test_objects trigger_right_bath
(players_current))
(and
(=
(ai_living_count hall/bath_pistols_r) 0)
(and
(=
(ai_living_count hall/floor_right_pistols) 0)
(=
(ai_living_count hall/bath_pistols_l) 0)))))
(ai_braindead hall true)
(sleep 30)
(game_save)
(sleep 60)
(ai_braindead hall false)
(set gal_right_clear true)))

(script startup void lefty1
(begin
(sleep_until
(or
(volume_test_objects trigger_hall6
(players_current))
(volume_test_objects trigger_hall6a
(players_current))))
(ai_place hall/floor_left_pistols2)
(ai_place hall/floor_left_doom)
(ai_command_list hall/floor_left_doom doom_left)
(device_set_position door_floor_left 1.00)
(sleep_until
(=
(device_get_position door_floor_left) 0.00))))

(script continuous void lefty_see
(begin
(sleep_until
(or
(volume_test_objects trigger_hall6
(players_current))
(volume_test_objects trigger_hall6a
(players_current))))
(ai_command_list hall/floor_left_pistols2 left_out)))

(script startup void gal_left_clear
(begin
(sleep_until
(and
(volume_test_objects trigger_hall6
(players_current))
(and
(=
(ai_living_count hall/floor_left_pistols2) 0)
(=
(ai_living_count hall/floor_left_doom) 0))))
(game_save)
(set gal_left_clear true)))

(script dormant void hall_jetpacks
(begin
(ai_spawn_actor hall_jetpacks/1)
(ai_spawn_actor hall_jetpacks/1)
(ai_force_active hall_jetpacks/1 true)))

(script startup void gal_right_safe
(begin
(sleep_until
(and
(= gal_right_clear true)
(= gal_left_clear false)))
(sleep 120)
(wake hall_jetpacks)
(ai_migrate hall/lt_gallery hall/attack_from_left_blank)))

(script startup void gal_left_safe
(begin
(sleep_until
(and
(= gal_left_clear true)
(= gal_right_clear false)))
(sleep 120)
(wake hall_jetpacks)
(ai_migrate hall/rt_gallery hall/attack_from_right_blank)
(ai_command_list hall/stairs_doom down_stairs2)))

(script startup void up_stairs
(begin
(sleep_until
(volume_test_objects trigger_hall_stairs1
(players_current)))
(ai_place hall/bal1_def)
(sleep 60)
(ai_place hall/bal2_pistols)))

(script startup void jet_again
(begin
(sleep_until
(and
(volume_test_objects trigger_hall_stairs1
(players_current))
(and
(= gal_left_clear false)
(= gal_left_clear false))))
(wake hall_jetpacks)))

(script startup void up_stairs1
(begin
(sleep_until
(and
(volume_test_objects trigger_hall_stairs1
(players_origin))
(and
(= gal_left_clear true)
(= gal_left_clear true))))
(ai_migrate hall/balcony_pistols hall/balcony1_a_blank)))

(script startup void skegness_for_real_this_time
(begin
(sleep_until
(or
(volume_test_objects top_stairs skegness_for_real_this_time)
(volume_test_objects top_stairs skegness_for_real_this_time)))
(fade_out 0.00 0.00 0.00 0)
(ai false)
(object_teleport skegness_for_real_this_time stair_top)
(object_teleport skegness_for_real_this_time stair_top)
(object_teleport skegness_for_real_this_time stair_top)
(object_teleport skegness_for_real_this_time stair_top)
(ai_erase hall/bal2_pistols)
(ai_erase hall/bal2_doom)
(device_set_position_immediate office_outer 1.00)
(game_save_cancel) skegness_for_real_this_time
(if skegness_for_real_this_time skegness_for_real_this_time) skegness_for_real_this_time
(player_force_respawn)
(player_set_profile skegness_for_real_this_time full_health false)
(player_set_profile skegness_for_real_this_time full_health false)
(ai true)
(object_create sonny)
(ai_attach sonny skegness/1)
(ai_place hall/skeg_guard)
(device_set_position_immediate office_outer 0.00)
(object_teleport skegness_for_real_this_time skeg_player0_current)
(object_teleport skegness_for_real_this_time skeg_player1_current)
(object_teleport skegness_for_real_this_time skeg_player0_origin)
(object_teleport skegness_for_real_this_time skeg_player1_origin)
(set skegness_fight true)
(fade_in 0.00 0.00 0.00 30)
(sleep_until
(and
(=
(ai_living_count skegness/1) 0)
(=
(ai_living_count hall/skeg_guard) 0)))
(object_create monday_guide)
(object_cannot_take_damage monday_guide)
(object_create monday_phone)
(object_cannot_take_damage monday_phone)
(device_operates_automatically_set office_outer true)))

(script continuous void jetpack_ammo
(begin
(sleep_until
(and
(>
(ai_living_count hall_jetpacks) 0)
(or
(volume_test_objects skeg_cut
(players_current))
(volume_test_objects skeg_cut2
(players_current)))))
(sleep_until
(and
(=
(objects_can_see_flag
(players_current) see_civs_left 45.00) false)
(=
(objects_can_see_flag
(players_current) see_civs_right 45.00) false)))
(ai_kill existing_zombies_hall/1)
(ai_kill existing_zombies_hall/2)
(sleep
(random_range
(* 30.00 1.00)
(* 30.00 3.00)))
(ai_spawn_actor ammo_civs/left)
(ai_spawn_actor ammo_civs/right)
(print spawning ammo civs)
(sleep -1 zombie_spawner)))

(script continuous void jetpack_ammo_off
(begin
(sleep_until
(>
(ai_living_count ammo_civs) 5))
(sleep -1 jetpack_ammo)
(print stopping ammo civs)))

(script startup void open_office
(begin
(sleep 5)
(sleep_until
(volume_test_objects monday_office_start
(players_origin)))
(device_operates_automatically_set office_outer false)
(device_set_position office_outer 0.00)))

(script static bool shield_breached_test1
(begin
(if
(or
(<
(object_get_health shield11) 0.00)
(<
(object_get_health shield12) 0.00)
(<
(object_get_health shield13) 0.00)
(<
(object_get_health shield14) 0.00)
(<
(object_get_health shield15) 0.00)
(<
(object_get_health shield16) 0.00)) true false)))

(script static bool shield_breached_test2
(begin
(if
(or
(<
(object_get_health shield21) 0.00)
(<
(object_get_health shield22) 0.00)
(<
(object_get_health shield23) 0.00)
(<
(object_get_health shield24) 0.00)
(<
(object_get_health shield25) 0.00)
(<
(object_get_health shield26) 0.00)) true false)))

(script continuous void battle_phase_manager
(begin
(if desk_battle
(begin
(if
(and
(= shield_breached1 false)
(= battle_phase_manager true))
(begin
(set shield_breached1 true)
(set battle_phase
(+ battle_phase 1.00))
(print now entering battle phase:)
(inspect battle_phase)
(sleep 60)))
(if
(and
(= shield_breached2 false)
(= battle_phase_manager true))
(begin
(set shield_breached2 true)
(set battle_phase
(+ battle_phase 1.00))
(print now entering battle phase:)
(inspect battle_phase)
(sleep 60)))))
(sleep 30)))

(script static void monday_desk_on
(begin
(sleep_until
(vehicle_test_seat monday_desk d-driver
(unit
(list_get
(ai_actors monday/monday) 0))))
(set load_monday false)
(unit_set_weapon monday_desk vehicles\desk\desk_cannon)
(set current_weapon single)
(object_create shield11)
(objects_attach monday_desk shield11 shield11 )
(object_create shield12)
(objects_attach monday_desk shield12 shield12 )
(object_create shield13)
(objects_attach monday_desk shield13 shield13 )
(object_create shield14)
(objects_attach monday_desk shield14 shield14 )
(object_create shield15)
(objects_attach monday_desk shield15 shield15 )
(object_create shield16)
(objects_attach monday_desk shield16 shield16 )
(object_create shield21)
(objects_attach monday_desk shield21 shield21 )
(object_create shield22)
(objects_attach monday_desk shield22 shield22 )
(object_create shield23)
(objects_attach monday_desk shield23 shield23 )
(object_create shield24)
(objects_attach monday_desk shield24 shield24 )
(object_create shield25)
(objects_attach monday_desk shield25 shield25 )
(object_create shield26)
(objects_attach monday_desk shield26 shield26 )))

(script static void monday_desk_off
(begin
(object_destroy shield11)
(object_destroy shield12)
(object_destroy shield13)
(object_destroy shield14)
(object_destroy shield15)
(object_destroy shield16)
(object_destroy shield21)
(object_destroy shield22)
(object_destroy shield23)
(object_destroy shield24)
(object_destroy shield25)
(object_destroy shield26)))

(script continuous void zombie_dump
(begin
(set attacking_zombies
(ai_actors zombies_hall))
(set close_zombies
(objects_in_volume attacking_zombies kill_zone))))

(script continuous void weapon_switcher
(begin
(if
(= current_weapon single)
(begin
(if
(volume_test_objects kill_zone
(players_current))
(begin
(unit_set_weapon monday_desk vehicles\desk\desk_cannon_double_barrel)
(set current_weapon double))
(if
(>
(list_count close_zombies) 0)
(begin
(unit_set_weapon monday_desk vehicles\desk\desk_cannon_double_barrel)
(set current_weapon double)))))
(begin
(sleep_until
(and
(=
(volume_test_objects kill_zone
(players_current)) false)
(=
(volume_test_objects kill_zone
(ai_actors zombies_hall)) false)) 1)
(unit_set_weapon monday_desk vehicles\desk\desk_cannon)
(set current_weapon single)))))

(script continuous void spawner
(begin
(sleep 180)
(if
(and desk_battle
(volume_test_objects_all monday_office
(players_current)))
(begin
(if
(= battle_phase 1)
(begin
(begin
(set civ_spawn_time
(random_range
(* 30.00 5.00)
(* 30.00 10.00)))
(set sec_spawn_time
(random_range
(* 30.00 45.00)
(* 30.00 60.00)))))
(if
(= battle_phase 2)
(begin
(begin
(set civ_spawn_time
(random_range
(* 30.00 8.00)
(* 30.00 12.00)))
(set sec_spawn_time
(random_range
(* 30.00 30.00)
(* 30.00 45.00)))))
(if
(= battle_phase 3)
(begin
(begin
(set civ_spawn_time
(random_range
(* 30.00 12.00)
(* 30.00 15.00)))
(set sec_spawn_time
(random_range
(* 30.00 10.00)
(* 30.00 30.00))))))))
(if
(and
(<
(ai_living_count office_civilian/civilian) 5)
(> civ_spawn_time 0)
(>
(-
(game_time) last_civ_drop) civ_spawn_time))
(begin
(print spawning a civilian)
(ai_spawn_actor office_civilian/civilian)
(set last_civ_drop
(game_time))))
(if
(and
(<
(ai_living_count office_security/security_pistol) 3)
(> sec_spawn_time 0)
(>
(-
(game_time) last_sec_drop) sec_spawn_time))
(begin
(print spawning a security)
(ai_spawn_actor office_security/security_pistol)
(sleep_until
(not
(volume_test_objects monday_office_start
(players_current))))
(set last_sec_drop
(game_time))))))))

(script continuous void spawner_off
(begin
(sleep_until
(or
(volume_test_objects trigger_mon_el_left
(players_current))
(volume_test_objects trigger_mon_el_right
(players_current))
(volume_test_objects computer_office
(players_current))
(volume_test_objects media_office
(players_current))))
(sleep -1 spawner)
(if
(game_is_cooperative)
(sleep_until
(and
(volume_test_objects monday_office spawner_off)
(volume_test_objects monday_office spawner_off)))
(sleep_until
(volume_test_objects monday_office spawner_off)))
(wake spawner)))

(script continuous void zombies_out
(begin
(sleep_until
(or
(volume_test_objects computer_office
(ai_actors zombies_hall))
(volume_test_objects media_office
(ai_actors zombies_hall))))
(ai_command_list zombies_hall zombies_out)))

(script continuous void out_of_left_elevator
(begin
(sleep_until
(or
(volume_test_objects trigger_mon_el_left
(ai_actors office_security))
(volume_test_objects trigger_mon_el_left
(ai_actors existing_zombies_hall))))
(sleep 30)
(ai_command_list office_security out_el_left)
(ai_command_list existing_zombies_hall out_el_left)))

(script continuous void out_of_right_elevator
(begin
(sleep_until
(or
(volume_test_objects trigger_mon_el_right
(ai_actors office_security))
(volume_test_objects trigger_mon_el_right
(ai_actors existing_zombies_hall))))
(sleep 30)
(ai_command_list office_security out_el_right)
(ai_command_list existing_zombies_hall out_el_right)))

(script dormant void battle_save1
(begin
(device_set_position monday_bath 0.00)
(sleep_until
(=
(device_get_position monday_bath) 0.00))
(device_operates_automatically_set monday_bath false)
(print door closed)
(sleep 30)
(ai_braindead office_security true)
(ai_braindead monday true)
(ai_braindead office_civilian true)
(ai_braindead ammo_civs true)
(ai_set_blind office_security true)
(ai_set_blind office_civilian true)
(ai_set_blind monday true)
(ai_set_blind ammo_civs true)
(sleep 60)
(game_save_no_timeout)
(sleep 60)
(ai_braindead office_security false)
(ai_braindead monday false)
(ai_braindead office_civilian false)
(ai_braindead ammo_civs false)
(ai_set_blind office_security false)
(ai_set_blind office_civilian false)
(ai_set_blind monday false)
(ai_set_blind ammo_civs false)
(print can see)
(sleep 30)
(device_operates_automatically_set monday_bath true)
(print door open)))

(script dormant void battle_save2
(begin
(device_set_position monday_bath 0.00)
(sleep_until
(=
(device_get_position monday_bath) 0.00))
(device_operates_automatically_set monday_bath false)
(sleep 30)
(ai_set_blind office_security true)
(ai_set_blind office_civilian true)
(ai_set_blind monday true)
(ai_set_blind ammo_civs true)
(ai_braindead office_security true)
(ai_braindead monday true)
(ai_braindead office_civilian true)
(ai_braindead ammo_civs true)
(sleep 75)
(game_save_no_timeout)
(sleep 75)
(ai_braindead office_security false)
(ai_braindead monday false)
(ai_braindead office_civilian false)
(ai_braindead ammo_civs false)
(ai_set_blind office_security false)
(ai_set_blind office_civilian false)
(ai_set_blind monday false)
(ai_set_blind ammo_civs false)
(sleep 30)
(device_operates_automatically_set monday_bath true)))

(script startup void phase2_attack
(begin
(sleep_until
(and
(= battle_phase 2)
(volume_test_objects trigger_office_front
(players_current))))
(sound_impulse_start sound\dialog\c40\se_monday_battle_1
(list_get
(ai_actors monday) 0) 1.00)
(sleep 90)
(ai_place office_security/phase2)))

(script startup void phase3_attack
(begin
(sleep_until
(= battle_phase 3))
(sound_impulse_start sound\dialog\c40\se_monday_battle_2
(list_get
(ai_actors monday) 0) 1.00)
(sleep 60)
(ai_place office_security/phase3)
(object_create desk_smoke)
(sleep
(random_range
(* 30.00 60.00)
(* 30.00 80.00)))
(ai_place existing_zombies_hall/office1)))

(script startup void extra_doom
(begin
(sleep_until
(= battle_phase 3))
(sleep
(random_range
(* 30.00 90.00)
(* 30.00 120.00)))
(ai_place office_security/security)
(sleep_until
(=
(ai_living_count office_security/security) 0))
(sleep
(random_range
(* 30.00 90.00)
(* 30.00 120.00)))
(ai_place office_security/security)))

(script continuous void cheap_kill_r
(begin
(sleep_until
(volume_test_objects trigger_mon_el_right
(players_nonorigin)))
(sleep
(* 30.00 15.00))
(print that's 15 seconds)
(sleep_until
(and
(=
(objects_can_see_flag
(players_current) cheap_killa_r 30.00) false)
(volume_test_objects trigger_mon_el_right
(players_nonorigin))))
(ai_spawn_actor office_security/cheap_killer_r)
(print spawned cheap_killer_r)
(objects_set_current_vitality
(ai_actors office_security/cheap_killer_r) 800.00 1.00)
(objects_cannot_lose_regions
(ai_actors office_security/cheap_killer_r) true)
(ai_command_list office_security/cheap_killer_r killer_right)
(print killer going right)))

(script continuous void cheap_kill_l
(begin
(sleep_until
(volume_test_objects trigger_mon_el_left
(players_nonorigin)))
(sleep
(* 30.00 15.00))
(print that's 15 seconds)
(sleep_until
(and
(=
(objects_can_see_flag
(players_current) cheap_killa_l 30.00) false)
(volume_test_objects trigger_mon_el_left
(players_nonorigin))))
(ai_spawn_actor office_security/cheap_killer_l)
(print spawned cheap_killer_l)
(objects_set_current_vitality
(ai_actors office_security/cheap_killer_l) 800.00 1.00)
(objects_cannot_lose_regions
(ai_actors office_security/cheap_killer_l) true)
(ai_command_list office_security/cheap_killer_l killer_left)
(print killer going left)))

(script continuous void cheap_kill_off
(begin
(sleep_until
(or
(=
(ai_living_count office_security/cheap_killer_r) 2)
(=
(ai_living_count office_security/cheap_killer_l) 2)))
(print cheap kill off)
(sleep -1 cheap_kill_r)
(sleep -1 cheap_kill_l)
(sleep_until
(and
(=
(ai_living_count office_security/cheap_killer_r) 0)
(=
(ai_living_count office_security/cheap_killer_l) 0)))
(print cheap kill back on)
(wake cheap_kill_r)
(wake cheap_kill_l)))

(script continuous void check_if_head
(begin
(if
(or
(object_is_instance check_if_head characters\head\head)
(object_is_instance check_if_head characters\head\head))
(begin
(set last_head_time
(game_time))))))

(script startup void monday_battle
(begin
(sleep_until
(volume_test_objects monday_office_start
(players_origin)) 1)
(fade_out 0.00 0.00 0.00 0)
(ai_erase hall)
(ai_erase existing_zombies_hall)
(ai_erase hall_jetpacks)
(ai_erase hall_top_jetpack)
(objects_delete_by_definition scenery\c10_offender\sandbags_large\sandbags_large)
(object_destroy monday_guide)
(object_destroy monday_phone)
(object_destroy monday_desk)
(object_destroy ass_desk)
(object_destroy office_inner) monday_battle
(object_teleport monday_battle in_office_tel2)
(object_teleport monday_battle in_office_tel3)
(game_save_cancel) monday_battle
(if monday_battle monday_battle) monday_battle
(player_force_respawn)
(object_destroy monday_guide)
(object_destroy monday_phone)
(object_create monday_desk)
(object_create ass_desk)
(object_create dead_maggie)
(objects_cannot_lose_regions dead_maggie true)
(object_create office_inner)
(object_teleport monday_battle in_office_teleport)
(object_teleport monday_battle in_office_teleport2)
(game_save)
(sleep 30)
(ai_place monday)
(objects_cannot_die
(ai_actors monday) true)
(objects_cannot_lose_regions
(ai_actors monday) true)
(objects_cannot_be_finished
(ai_actors monday) true)
(objects_cannot_be_possessed
(ai_actors monday) true)
(vehicle_load_magic monday_desk 
(ai_actors monday))
(ai_kill_silent zombies_hall)
(fade_in 0.00 0.00 0.00 30)
(unit_set_weapon monday_desk none)
(set load_monday true) monday_battle
(set desk_battle true)
(ai_place office_civilian/officeguys)
(ai_begin_flee_with_cower_chance office_civilian/officeguys true 0 true 1.00)
(set boss_music true)
(sleep_until
(>
(ai_living_count monday/monday) 0))
(sleep_until
(<=
(ai_strength monday/monday) 0.10))
(set desk_battle false)
(set boss_music false)
(game_save_cancel)
(ai_braindead monday/monday true)
(objects_cannot_take_damage
(players_origin) true)
(if
(or
(>
(list_count
(players_nonorigin)) 0)
(<
(-
(game_time) last_head_time) 35.00))
(begin monday_battle
(sleep 35))) monday_battle
(sound_impulse_start sound\music\a10\main_gate_open none 1.00)
(camera_set ending_camera 120)
(fade_out 0.00 0.00 0.00 180)
(sleep 180)
(ai_erase office_civilian)
(ai_erase office_security)
(ai_kill_silent zombies_hall)
(ai_erase monday)
(object_destroy dead_maggie) monday_battle
(object_destroy hall_r)
(object_teleport monday_battle game_over1)
(object_teleport monday_battle game_over2) monday_battle monday_battle monday_battle
(print game_won)
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
(= boss_music false)) 1)
(sound_looping_start sound\music\hand_5\hand_5 none 0.75)
(sleep_until
(or
(= hand_music false)
(= boss_music true) hand_music) 1)
(sound_looping_stop sound\music\hand_5\hand_5)))

(script continuous void boss_music
(begin
(sleep_until
(= boss_music true) 1)
(if hand_music
(sleep 30))
(sound_looping_start sound\music\c50\battle_monday\battle_monday none 0.85)
(sleep_until
(or
(= boss_music false) boss_music) 1)
(sound_looping_stop sound\music\c50\battle_monday\battle_monday)))

(script static void c50_10_run
(begin
(fade_out 0.00 0.00 0.00 0)
(sound_looping_predict sound\cinematics\c50\10_foley_1) c50_10_run
(switch_bsp 1)
(sound_class_set_gain unit_animation 0.00 0)
(object_activation_add_camera 10_01)
(object_create 10_skegness_1)
(object_beautify 10_skegness_1 true)
(recording_play 10_skegness_1 10_skegness_1)
(sleep 30)
(sound_looping_start sound\cinematics\c50\10_foley_1 none 1.00)
(print c40_10:  skegness arrives)
(camera_set 10_01 0)
(camera_set 10_02 60)
(fade_in 0.00 0.00 0.00 0)
(sleep 40)
(fade_out 0.00 0.00 0.00 10)
(sleep 10)
(custom_animation 10_skegness_1 cinematics\animations\wye\c30\c30 c30_10_wye_1 false)
(camera_set 10_02b 0)
(fade_in 0.00 0.00 0.00 0)
(camera_set 10_02c 400)
(sound_impulse_start sound\dialog\c40\15_skegness_1 10_skegness_1 1.00)
(sleep
(sound_impulse_time sound\dialog\c40\15_skegness_1))
(object_create 10_security_1)
(object_create 10_security_2)
(object_create 10_security_3)
(object_beautify 10_security_1 true)
(object_beautify 10_security_2 true)
(object_beautify 10_security_3 true)
(custom_animation 10_security_1 cinematics\animations\skegness\c40\c40 c40_se_security_1 false)
(sound_impulse_start sound\dialog\c40\15_security_1 10_security_1 0.01)
(sound_impulse_start sound\dialog\c40\15_security_3 10_security_2 0.01)
(sound_impulse_start sound\dialog\c40\15_security_2 10_security_3 1.00)
(camera_set 10_03 0)
(sleep 30)
(custom_animation 10_security_2 cinematics\animations\skegness\c40\c40 c40_se_security_1 false)
(camera_set 10_04 10)
(sleep 30)
(custom_animation 10_security_3 cinematics\animations\skegness\c40\c40 c40_se_security_1 false)
(camera_set 10_05 10)
(sleep
(sound_impulse_time sound\dialog\c40\15_security_2))
(custom_animation 10_skegness_1 cinematics\animations\skegness\c40\c40 c40_se_skegness_1 false)
(unit_stop_custom_animation 10_security_1)
(unit_stop_custom_animation 10_security_2)
(unit_stop_custom_animation 10_security_3)
(object_teleport 10_security_1 10_security_1)
(object_teleport 10_security_2 10_security_2)
(object_teleport 10_security_3 10_security_3)
(camera_set 10_06 0)
(sleep
(-
(unit_get_custom_animation_time 10_skegness_1) 75.00))
(fade_out 0.00 0.00 0.00 0) c50_10_run
(object_activation_clear)
(object_destroy_containing 10_)
(sound_class_set_gain unit_animation 1.00 15)))

(script dormant void 20_dialog
(begin
(sound_impulse_start sound\dialog\c40\20_guidebot_1 20_guidebot_1 1.00)
(sleep
(sound_impulse_time sound\dialog\c40\20_guidebot_1))
(sleep 30)
(sound_impulse_start sound\dialog\c40\20_guidebot_2 20_guidebot_1 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\c40\20_guidebot_2) 60.00))
(sleep
(sound_impulse_time sound\dialog\c40\20_guidebot_2))
(sound_impulse_start sound\dialog\c40\20_guidebot_3 20_guidebot_1 1.00)
(sleep -1)
(sound_impulse_start sound\dialog\plaza\judy\scream_short 20_maggie_1 0.01)
(sleep 58)
(sound_impulse_start sound\dialog\c40\20_maggie_1 20_maggie_1 1.00)
(sleep 280)
(sound_impulse_start sound\dialog\c40\20_maggie_2 20_maggie_1 1.00)
(sleep -1)
(sleep 23)
(sound_impulse_start sound\dialog\c40\20_monday_1 20_monday_1 1.00)
(sleep
(sound_impulse_time sound\dialog\c40\20_monday_1))
(sound_impulse_start sound\dialog\c40\20_monday_2 20_monday_1 1.00)
(sleep -1)
(sleep 51)
(sound_impulse_start sound\dialog\c40\20_maggie_3 20_maggie_1 1.00)
(sleep
(sound_impulse_time sound\dialog\c40\20_maggie_3))
(sound_impulse_start sound\dialog\c40\20_monday_3 20_monday_1 1.00)
(sleep
(- 155.00 49.00))
(sound_impulse_start sound\dialog\c40\20_maggie_4 20_maggie_1 1.00)
(sleep -1)
(sleep 12)
(sound_impulse_start sound\dialog\c40\20_monday_4 20_monday_1 1.00)))

(script dormant void 25_dialog
(begin
(sleep 212)
(sound_impulse_start sound\dialog\c40\20_monday_6 20_monday_1 1.00)
(sleep 287)
(sound_impulse_start sound\dialog\c40\20_monday_7 20_monday_1 1.00)))

(script static void flashback
(begin
(if
(= test 90)
(begin flashback
(fade_out 1.00 1.00 1.00 0)))
(sound_class_set_gain ambient_nature 0.00 0)
(switch_bsp 2)
(object_activation_add_camera 20_13)
(object_create 20_doorsturdy_1)
(object_create 20_youngstubbs_1)
(object_beautify 20_youngstubbs_1 true)
(unit_set_seat 20_youngstubbs_1 alert)
(object_create 20_youngmaggie_1)
(object_beautify 20_youngmaggie_1 true)
(object_create 20_briefcase_1)
(objects_attach 20_youngstubbs_1 meleer 20_briefcase_1 meleer)
(camera_set 20_13 0)
(recording_play 20_youngstubbs_1 20_youngstubbs_1)
(image_effect_set image_effects\silent_film)
(sleep 1)
(fade_in 1.00 1.00 1.00 10)
(sound_impulse_start sound\dialog\c40\20_maggie_5 none 1.00)
(sound_looping_start sound\cinematics\c50\20_foley_3 none 1.00)
(sleep
(sound_impulse_time sound\dialog\c40\20_maggie_5))
(sleep 30)
(object_teleport 20_youngmaggie_1 20_youngmaggie_1)
(custom_animation 20_youngmaggie_1 cinematics\animations\maggie\c40\c40 c40_20_youngmaggie_1 false)
(scenery_animation_start 20_doorsturdy_1 scenery\b10_farm\door_sturdy\door_sturdy c40_20_door_open)
(camera_set 20_14 0)
(print maggie opens door)
(sound_impulse_start sound\dialog\c40\20_maggie_6 none 1.00)
(object_destroy 20_youngstubbs_1)
(object_create 20_youngstubbs_2)
(object_destroy 20_briefcase_1)
(object_create 20_briefcase_1)
(objects_attach 20_youngstubbs_2 meleer 20_briefcase_1 meleer)
(unit_set_seat 20_youngstubbs_2 alert)
(sleep
(sound_impulse_time sound\dialog\c40\20_maggie_6))
(sleep 45)
(custom_animation 20_youngstubbs_2 cinematics\animations\youngstubbs\c40\c40 c40_20_youngstubbs_1 false)
(scenery_animation_start 20_doorsturdy_1 scenery\b10_farm\door_sturdy\door_sturdy c40_20_door_end)
(camera_set 20_15 0)
(sound_impulse_start sound\dialog\c40\20_maggie_7 none 1.00)
(sleep
(sound_impulse_time sound\dialog\c40\20_maggie_7))
(sleep 15)
(custom_animation 20_youngmaggie_1 cinematics\animations\maggie\c40\c40 c40_20_youngmaggie_2 false)
(custom_animation 20_youngstubbs_2 cinematics\animations\youngstubbs\c40\c40 c40_20_youngstubbs_2 false)
(camera_set 20_16 0)
(print maggie pulls stubbs inside)
(sound_impulse_start sound\dialog\c40\20_maggie_8 none 1.00)
(object_create 20_pickup_1)
(object_beautify 20_pickup_1 true)
(object_create 20_otis_1)
(object_beautify 20_otis_1 true)
(unit_set_weapon 20_otis_1 none)
(unit_enter_vehicle 20_otis_1 20_pickup_1 cr-driver)
(sleep
(sound_impulse_time sound\dialog\c40\20_maggie_8))
(recording_play 20_pickup_1 20_pickup_1)
(sleep 15)
(camera_set 20_17 0)
(object_destroy 20_youngstubbs_2)
(object_destroy 20_youngmaggie_1)
(sleep 120)
(camera_set 20_18 0)
(sound_impulse_start sound\dialog\c40\20_maggie_9 none 1.00)
(object_create 20_otis_2)
(object_beautify 20_otis_2 true)
(sleep 50)
(recording_play 20_otis_2 20_otis_2)
(sleep 10)
(object_teleport 20_otis_2 20_otis_2)
(camera_set 20_19 0)
(camera_set 20_20 90)
(sleep 60)
(camera_set 20_21 60)
(sleep 60)
(print smooching...  )
(sleep 60)
(print ...then scuffling)
(sleep 90)
(object_create 20_youngstubbs_2)
(object_teleport 20_youngstubbs_2 20_youngstubbs_2)
(unit_set_seat 20_youngstubbs_2 stand)
(object_teleport 20_otis_2 20_otis_3)
(unit_set_weapon 20_otis_2 weapons\springfield\springfield)
(sound_impulse_start sound\dialog\c40\20_maggie_10 none 1.00)
(sleep 30)
(camera_set 20_22 60)
(sleep 15)
(recording_play 20_youngstubbs_2 20_youngstubbs_2)
(recording_play 20_otis_2 20_otis_3)
(sleep
(sound_impulse_time sound\dialog\c40\20_maggie_10))
(object_destroy 20_youngstubbs_2)
(sleep 15)
(recording_kill 20_otis_2)
(object_teleport 20_otis_2 20_otis_4)
(camera_set 20_23 0)
(sleep 15)
(recording_play 20_otis_2 20_otis_4)
(effect_new_on_object weapons\springfield\fire
(unit_get_weapon 20_otis_2))
(sound_impulse_start sound\sfx\weapons\shotgun\firing none 1.00)
(sleep 70)
(sound_looping_predict sound\cinematics\c50\20_foley_4)
(sleep 20)
(fade_out 1.00 1.00 1.00 10)
(sleep 10)
(image_effect_set image_effects\technicolor)
(sound_class_set_gain ambient_nature 1.00 0)))

(script static void c50_25
(begin
(if
(= test 25)
(begin
(object_create 20_mondaydesk_1)
(object_create 20_stubbs_1)
(object_create 20_maggie_1)
(object_create 20_monday_1)
(object_teleport 20_monday_1 20_monday_5) c50_25
(fade_out 1.00 1.00 1.00 0)))
(object_destroy 20_raygun_1)
(switch_bsp 1)
(object_activation_add_camera 20_30)
(unit_stop_custom_animation 20_stubbs_1)
(object_teleport 20_stubbs_1 20_stubbs_5a)
(object_teleport 20_maggie_1 20_maggie_5)
(custom_animation 20_maggie_1 cinematics\animations\maggie\c40\c40 c40_20_maggie_5 false)
(camera_set 20_30 0)
(fade_in 1.00 1.00 1.00 10)
(sleep 1)
(sound_looping_start sound\cinematics\c50\20_foley_4 none 1.00)
(sleep 9)
(sound_impulse_start sound\dialog\c40\20_maggie_11 20_maggie_1 1.00)
(sleep
(sound_impulse_time sound\dialog\c40\20_maggie_11))
(object_teleport 20_monday_1 20_monday_5)
(custom_animation 20_monday_1 cinematics\animations\monday\c40\c40 c40_20_monday_5 false)
(camera_set 20_31 15)
(sleep 27)
(sound_impulse_start sound\dialog\c40\20_monday_5 20_monday_1 1.00)
(sleep 123)
(camera_set 20_31b 0)
(sleep
(sound_impulse_time sound\dialog\c40\20_monday_5))
(unit_custom_animation_at_frame 20_monday_1 cinematics\animations\monday\c40\c40 c40_20_monday_5 false 170)
(camera_set 20_31c 0)
(sound_impulse_start sound\dialog\c40\20_maggie_12 20_maggie_1 1.00)
(sleep
(-
(unit_get_custom_animation_time 20_maggie_1) 30.00))
(object_teleport 20_stubbs_1 20_stubbs_5)
(unit_custom_animation_at_frame 20_stubbs_1 cinematics\animations\stubbs\c40\c40 c40_20_stubbs_5 false 15)
(camera_set 20_32 0)
(camera_set 20_32b 240)
(sleep 32)
(object_create 20_flowers_1)
(objects_attach 20_stubbs_1 melee 20_flowers_1 melee)
(sleep 76)
(object_create 20_candy_1)
(objects_attach 20_stubbs_1 meleel 20_candy_1 melee)
(sleep
(-
(unit_get_custom_animation_time 20_stubbs_1) 30.00))
(custom_animation 20_maggie_1 cinematics\animations\maggie\c40\c40 c40_20_maggie_6 false)
(camera_set 20_33 0)
(sound_impulse_start sound\dialog\c40\20_maggie_13 20_maggie_1 1.00)
(print maggie swoons)
(sleep 90)
(object_teleport 20_stubbs_1 20_stubbs_6)
(object_teleport 20_maggie_1 20_maggie_7)
(custom_animation 20_maggie_1 cinematics\animations\maggie\c40\c40 c40_20_maggie_7 false)
(custom_animation 20_stubbs_1 cinematics\animations\stubbs\c40\c40 c40_20_stubbs_6 false)
(camera_set 20_40 0)
(sleep 90)
(object_teleport 20_maggie_1 20_maggie_7)
(custom_animation 20_maggie_1 cinematics\animations\maggie\c40\c40 c40_20_maggie_7 false)
(camera_set_relative 20_35 0 20_maggie_1)
(sleep 60)
(object_teleport 20_stubbs_1 20_stubbs_6)
(custom_animation 20_stubbs_1 cinematics\animations\stubbs\c40\c40 c40_20_stubbs_6 false)
(camera_set_relative 20_34 0 20_stubbs_1)
(sleep 60)
(object_create_anew 20_maggie_1)
(custom_animation 20_stubbs_1 cinematics\animations\stubbs\c40\c40 c40_20_stubbs_7 false)
(custom_animation 20_maggie_1 cinematics\animations\maggie\c40\c40 c40_20_maggie_8 false)
(camera_set 20_36 0)
(camera_set 20_36b 60)
(print they embrace)
(sleep 150)
(camera_set 20_37 90)
(sleep 60)
(sound_impulse_start sound\dialog\c40\20_maggie_14 20_maggie_1 1.00)
(sleep 60)
(sound_impulse_start sound\dialog\c40\20_stubbs_1 20_stubbs_1 0.01)
(effect_new_on_object effects\braineating 20_maggie_1)
(sleep 30)
(sleep
(sound_impulse_time sound\dialog\c40\20_stubbs_1))
(custom_animation 20_monday_1 cinematics\animations\monday\c40\c40 c40_20_monday_6 false)
(custom_animation 20_mondaydesk_1 vehicles\desk\desk c40_20_desk_placement false)
(wake 25_dialog)
(camera_set 20_38 0)
(camera_set 20_38b 500)
(sleep 60)
(camera_set 20_38c 0)
(sleep 90)
(camera_set 20_38b 0)
(sleep 340)
(camera_set 20_39 0)
(sleep
(-
(unit_get_custom_animation_time 20_monday_1) 15.00))))

(script dormant void 20_stubbs_dialog
(begin
(sound_impulse_start sound\cinematics\c50\20_stubbs_1 20_stubbs_1 0.75)
(sleep
(sound_impulse_time sound\cinematics\c50\20_stubbs_1))
(sound_impulse_start sound\cinematics\c50\20_stubbs_2 20_stubbs_1 0.75)
(sleep
(sound_impulse_time sound\cinematics\c50\20_stubbs_2))
(sleep 1126)
(sound_impulse_start sound\cinematics\c50\20_stubbs_3 20_stubbs_1 0.75)))

(script static void c50_20_run
(begin
(fade_out 0.00 0.00 0.00 0)
(sound_looping_predict sound\cinematics\c50\20_foley_1) c50_20_run
(switch_bsp 1)
(object_activation_add_camera 20_01)
(object_create 20_phonebot_1)
(object_beautify 20_phonebot_1 true)
(object_create 20_guidebot_1)
(object_beautify 20_guidebot_1 true)
(object_create 20_stubbs_1)
(object_beautify 20_stubbs_1 true)
(object_create 20_desk_1)
(object_create 20_mondaydesk_1)
(object_create 20_golden_door_1)
(sleep 30)
(sound_looping_start sound\cinematics\c50\20_foley_1 none 1.00)
(wake 20_stubbs_dialog)
(print c40_20:  the big reveal)
(camera_set 20_01b2 0)
(custom_animation 20_guidebot_1 cinematics\animations\pumpbot\c40\c40 c40_20_guidebot_1 false)
(custom_animation 20_phonebot_1 cinematics\animations\pumpbot\c40\c40 c40_20_phonebot_1 false)
(wake 20_dialog)
(sleep 10)
(custom_animation 20_stubbs_1 cinematics\animations\stubbs\c40\c40 c40_20_stubbs_1 false)
(camera_set 20_01b2 0)
(camera_set 20_01e2 100)
(fade_in 0.00 0.00 0.00 0)
(sleep 330)
(camera_set 20_01c 0)
(camera_set 20_01c2 180)
(sleep 110)
(camera_set 20_01f 0)
(sleep 130)
(camera_set 20_01e2 0)
(sleep 30)
(camera_set 20_01e4 60)
(sleep 60)
(camera_set 20_01d 0)
(sleep
(-
(unit_get_custom_animation_time 20_stubbs_1) 120.00))
(recording_kill 20_guidebot_1)
(sleep
(-
(unit_get_custom_animation_time 20_stubbs_1) 60.00))
(object_create 20_maggie_1)
(object_beautify 20_maggie_1 true)
(object_destroy 20_guidebot_1)
(camera_set 20_02 0)
(unit_stop_custom_animation 20_phonebot_1)
(sound_looping_predict sound\cinematics\c50\20_foley_2)
(sleep 28)
(scenery_animation_start 20_golden_door_1 devices\c40_cityhall\golden_door\golden_door 1 zg destroy-front)
(sleep 2)
(custom_animation 20_stubbs_1 cinematics\animations\stubbs\c40\c40 c40_20_stubbs_2 false)
(sleep 15)
(sound_looping_start sound\cinematics\c50\20_foley_2 none 1.00)
(camera_set 20_02b 15)
(sleep
(-
(unit_get_custom_animation_time 20_stubbs_1) 90.00))
(object_teleport 20_maggie_1 20_maggie_1)
(custom_animation 20_maggie_1 cinematics\animations\maggie\c40\c40 c40_20_maggie_1 false)
(wake 20_dialog)
(camera_set 20_03 0)
(sleep 180)
(object_create_anew 20_golden_door_1)
(object_teleport 20_stubbs_1 20_stubbs_3)
(custom_animation 20_stubbs_1 cinematics\animations\stubbs\c40\c40 c40_20_stubbs_3 false)
(camera_set 20_03b 60)
(sleep 30)
(camera_set 20_04 60)
(sleep 90)
(object_teleport 20_stubbs_1 20_stubbs_3)
(custom_animation 20_stubbs_1 cinematics\animations\stubbs\c40\c40 c40_20_stubbs_3 false)
(camera_set 20_05 0)
(sleep 90)
(camera_set 20_06 0)
(object_create 20_monday_1)
(object_beautify 20_monday_1 true)
(object_teleport 20_monday_1 20_monday_1)
(sleep
(unit_get_custom_animation_time 20_maggie_1))
(custom_animation 20_monday_1 cinematics\animations\monday\c40\c40 c40_20_monday_1 false)
(wake 20_dialog)
(camera_set 20_07 0)
(camera_set 20_07b
(+
(unit_get_custom_animation_time 20_monday_1) 30.00))
(sleep 18)
(object_create 20_raygun_1)
(objects_attach 20_monday_1 weapon 20_raygun_1 trigger hand)
(sleep
(-
(unit_get_custom_animation_time 20_monday_1) 30.00))
(object_teleport 20_maggie_1 20_maggie_3)
(object_teleport 20_stubbs_1 20_stubbs_4)
(custom_animation 20_stubbs_1 cinematics\animations\stubbs\c40\c40 c40_20_stubbs_4 false)
(custom_animation 20_maggie_1 cinematics\animations\maggie\c40\c40 c40_20_maggie_3 false)
(wake 20_dialog)
(camera_set 20_09 0)
(camera_set 20_09b
(-
(unit_get_custom_animation_time 20_maggie_1) 90.00))
(sleep
(-
(unit_get_custom_animation_time 20_maggie_1) 45.00))
(custom_animation 20_monday_1 cinematics\animations\monday\c40\c40 c40_20_monday_4 false)
(wake 20_dialog)
(camera_set 20_10 0)
(sleep 55)
(sound_looping_predict sound\cinematics\c50\20_foley_3)
(sleep 20)
(fade_out 1.00 1.00 1.00 10)
(sleep 10) c50_20_run c50_20_run
(fade_out 0.00 0.00 0.00 0) c50_20_run
(object_activation_clear)
(object_destroy_containing 20_)))

(script dormant void 30_nukem
(begin
(sleep 120)
(damage_object cinematics\effects\c50\nuclear 30_nukem)
(image_effect_start_blend image_effects\invert_desat 1.50)
(sleep 90)
(image_effect_start_blend image_effects\technicolor 1.50)))

(script dormant void 30_stubbs_dialog
(begin
(sound_impulse_start sound\cinematics\c50\30_stubbs_1 30_stubbs_1 1.00)
(sleep
(sound_impulse_time sound\cinematics\c50\30_stubbs_1))
(sleep 120)
(sound_impulse_start sound\cinematics\c50\30_stubbs_2 30_stubbs_3 1.00)))

(script static void c50_30_run
(begin
(fade_out 0.00 0.00 0.00 0)
(sound_looping_predict sound\cinematics\c50\30_foley_1) c50_30_run
(switch_bsp 1)
(object_activation_add_camera 30_01)
(object_create 30_monday_1)
(object_beautify 30_monday_1 true)
(unit_set_weapon 30_monday_1 none)
(object_create 30_stubbs_1)
(object_beautify 30_stubbs_1 true)
(object_create 30_maggie_1)
(object_beautify 30_maggie_1 true)
(sleep 30)
(sound_looping_start sound\cinematics\c50\30_foley_1 none 1.00)
(wake 30_stubbs_dialog)
(print c40_30:  stubbs and maggie escape)
(custom_animation 30_monday_1 cinematics\animations\monday\c40\c40 c40_30_monday_1 false)
(custom_animation 30_stubbs_1 cinematics\animations\stubbs\c40\c40 c40_30_stubbs_1 false)
(custom_animation 30_maggie_1 cinematics\animations\maggie\c40\c40 c40_30_maggie_1 false)
(camera_set 30_01 0)
(camera_set 30_02 210)
(fade_in 0.00 0.00 0.00 0)
(sleep 140)
(camera_set 30_03 30)
(sleep 240)
(print stubbs drops monday)
(camera_set 30_04 60)
(sleep
(-
(unit_get_custom_animation_time 30_stubbs_1) 5.00))
(object_create 30_stubbs_2)
(object_create 30_maggie_2)
(object_teleport 30_stubbs_2 30_stubbs_2)
(object_teleport 30_maggie_2 30_maggie_2)
(object_beautify 30_stubbs_2 true)
(object_beautify 30_maggie_2 true)
(recording_play 30_stubbs_2 30_stubbs_4)
(recording_play 30_maggie_2 30_stubbs_4)
(sleep 5)
(camera_set 30_05 0)
(sleep 60)
(sound_looping_predict sound\cinematics\c50\30_foley_2)
(sleep 30)
(fade_out 0.00 0.00 0.00 15)
(sleep 15)
(switch_bsp 0)
(sleep 1)
(object_activation_add_camera 30_06)
(object_create 30_maggie_3)
(object_beautify 30_maggie_3 true)
(object_create 30_stubbs_3)
(object_beautify 30_stubbs_3 true)
(object_create 30_boat_1)
(custom_animation 30_stubbs_3 cinematics\animations\stubbs\c40\c40 c40_30_stubbs_2 false)
(custom_animation 30_maggie_3 cinematics\animations\maggie\c40\c40 c40_30_maggie_2 false)
(scenery_animation_start 30_boat_1 scenery\c40_cityhall\rowboat\rowboat c40_30_rowboat_2)
(camera_set 30_06 0)
(fade_in 0.00 0.00 0.00 15)
(sleep 1)
(sound_looping_start sound\cinematics\c50\30_foley_2 none 1.00)
(sleep 14)
(sleep 90)
(camera_set 30_07 0)
(sleep 90)
(object_create 30_jetplane_1)
(object_create 30_jetplane_2)
(object_create 30_jetplane_3)
(scenery_animation_start 30_jetplane_1 devices\jetplane\jetplane c40_flyby)
(scenery_animation_start 30_jetplane_2 devices\jetplane\jetplane c40_flyby)
(scenery_animation_start 30_jetplane_3 devices\jetplane\jetplane c40_flyby)
(camera_set 30_08_2 0)
(camera_set 30_08_2b 60)
(sleep 75)
(object_create 30_raygun_1)
(objects_attach 30_monday_1 weapon 30_raygun_1 trigger hand)
(object_teleport 30_monday_1 30_monday_4)
(recording_play 30_monday_1 30_monday_4)
(sleep 15)
(cinematic_set_near_clip_distance 0.01)
(camera_set 30_10 0)
(sleep 90)
(custom_animation 30_stubbs_3 cinematics\animations\stubbs\c40\c40 c40_30_stubbs_3 false)
(custom_animation 30_maggie_3 cinematics\animations\maggie\c40\c40 c40_30_maggie_3 false)
(scenery_animation_start 30_boat_1 scenery\c40_cityhall\rowboat\rowboat c40_30_rowboat_3)
(camera_set 30_11 0)
(camera_set 30_11b 210)
(sleep 180)
(object_teleport 30_monday_1 30_monday_1)
(recording_kill 30_monday_1)
(recording_play 30_monday_1 30_monday_3)
(camera_set 30_12 0)
(sleep 60)
(object_create 30_monday_4)
(recording_play 30_monday_4 30_monday_5)
(sleep 60)
(object_destroy 30_monday_1)
(camera_set 30_13 0)
(sleep 60)
(object_destroy 30_jetplane_1)
(object_destroy 30_jetplane_2)
(object_destroy 30_jetplane_3)
(object_create 30_bomb_1)
(device_set_position 30_bomb_1 1.00)
(camera_set_relative 30_14 0 30_bomb_1)
(sleep 85)
(custom_animation 30_stubbs_3 cinematics\animations\stubbs\c40\c40 c40_30_stubbs_4 false)
(custom_animation 30_maggie_3 cinematics\animations\maggie\c40\c40 c40_30_maggie_4 false)
(scenery_animation_start 30_boat_1 scenery\c40_cityhall\rowboat\rowboat c40_30_rowboat_4)
(object_set_permutation 30_stubbs_3 head ~head)
(sleep 5)
(camera_set_relative 30_15 0 30_stubbs_3)
(wake 30_nukem)
(sleep 355)
(cinematic_set_title 30_fin_1)
(sleep 90)
(fade_out 0.00 0.00 0.00 90)
(sleep 90)
(cinematic_set_title 30_fin_2)
(sleep
(* 30.00 10.00))
(print end) c50_30_run
(object_activation_clear)
(object_destroy_containing 30_)))

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
(= test 20) test)
(if
(= test 25) test)
(if
(= test 90) test)
(if
(= test 30) test)))

(script static void preview
(begin preview preview preview preview))

(script static void unlockable_pickup
(begin
(damage_object equipment\hippo\hippo_pickup unlockable_pickup)
(if
(game_is_cooperative)
(damage_object equipment\hippo\hippo_pickup unlockable_pickup))))

(script static void stop_commentary
(begin
(sound_looping_stop sound\commentary\c50_end\c50_end_01)))

(script dormant void unlock_comment_1
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_1) 0.00) 7) unlock_comment_1
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_1
(sound_looping_start sound\commentary\c50_end\c50_end_01 none 1.00)
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
(wake unlock_comment_1)))))