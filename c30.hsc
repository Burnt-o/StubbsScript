(global bool cutscene_running false)

(global bool open_doors true)

(global bool lab_battle false)

(global bool room_blowers false)

(global bool wye_fight false)

(global short wye_health 0)

(global short wye_health_true 0)

(global real wye_spawns 0.00)

(global short beam 1)

(global short blast 2)

(global short backpack_weapon beam)

(global bool teleport_fight false)

(global bool teleport_fight_stop false)

(global short spawntag 0)

(global bool hand_music false)

(global bool wye_music false)

(global bool show_cutscenes false)

(global short test 0)

(global bool laserspex_enable false)

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

(script static void c30_10
(begin
(if
(= show_cutscenes true) c30_10)))

(script static void c30_20
(begin
(if
(= show_cutscenes true) c30_20)))

(script static void c30_30
(begin
(if
(= show_cutscenes true) c30_30)))

(script static void cutscenes_on
(begin
(set show_cutscenes true)))

(script static void checkpoint1
(begin
(object_teleport checkpoint1 shaft_c)
(object_teleport checkpoint1 shaft_c)
(switch_bsp 1)))

(script static void checkpoint2
(begin
(switch_bsp 1)
(object_teleport checkpoint2 floor_02_fight_begin)
(object_teleport checkpoint2 floor_02_fight_begin2)
(switch_bsp 1)
(game_save)))

(script static void checkpoint3
(begin
(switch_bsp 2)
(object_teleport checkpoint3 lab_test)
(object_teleport checkpoint3 lab_test)))

(script static void checkpoint4
(begin
(switch_bsp 0)
(object_teleport checkpoint4 floor_01_launch_a)
(object_teleport checkpoint4 floor_01_launch_b)))

(script static weapon dr_wye
(begin
(unit
(list_get
(ai_actors wye_enc) 0))))

(script static vehicle wye_backpack
(begin
(unit_get_weapon wye_backpack)))

(script startup void savepathbsp0
(begin
(sleep_until
(>
(ai_living_count hall_01) 0))
(sleep_until
(=
(ai_living_count hall_01) 0))
(game_save_cancel)
(game_save_no_timeout)
(sleep_until
(volume_test_objects ramp_a
(players_origin)) 1)
(game_save_cancel)
(game_save_no_timeout)
(sleep_until
(volume_test_objects hall_03_drop
(players_origin)) 1)
(game_save_cancel)
(game_save_no_timeout)))

(script startup void savepathbsp1
(begin
(sleep_until
(volume_test_objects blow_save_01
(players_origin)) 1)
(ai_disregard
(players_current) true)
(ai_set_current_state window_room_02 sleep)
(game_save_cancel)
(game_save_no_timeout)
(sleep 25)
(ai_disregard
(players_current) false)
(ai_set_current_state window_room_02 guard)
(sleep_until
(volume_test_objects blow_save_02
(players_origin)) 1)
(ai_disregard
(players_current) true)
(ai_set_current_state window_room_02 sleep)
(game_save_cancel)
(game_save_no_timeout)
(sleep 25)
(ai_disregard
(players_current) false)
(ai_set_current_state window_room_02 guard)
(sleep_until
(volume_test_objects flr_02_fnlfight
(players_origin)) 1)
(game_save_cancel)
(game_save_no_timeout)))

(script startup void get_up_and_fight
(begin
(sleep_until
(or
(volume_test_objects foyer_fight_01
(players_current))
(volume_test_objects foyer_fight_02
(players_current))) 5)
(ai_command_list army_foyer/foyer_def_01 fight)
(ai_command_list army_foyer/foyer_def_02 fight)))

(script startup void first_floor
(begin first_floor
(fade_out 0.00 0.00 0.00 0)
(if first_floor first_floor) first_floor
(set room_blowers false)
(set wye_fight false)
(ai_set_resurrection_group z_crypt/zombie_a)
(ai_place army_foyer/foyer_def_01)
(ai_place army_foyer/foyer_def_02)
(ai_place army_foyer/foyer_def_03)
(ai_place z_crypt/zombie_b)
(fade_in 0.00 0.00 0.00 60)
(sleep 60)
(game_save_cancel)
(game_save_no_timeout)
(sleep_until
(or
(and
(<=
(ai_living_count army_foyer/foyer_def_01) 2)
(<=
(ai_living_count army_foyer/foyer_def_01) 2))
(=
(device_group_get door_opener_01) 1.00)) 1)
(sleep_until
(=
(objects_can_see_flag
(players_current) foyer_exit 50.00) false))
(ai_place army_foyer/foyer_rush)
(game_save_cancel)
(game_save_no_timeout)
(device_operates_automatically_set foyer_door true)
(print door open)
(ai_place hall_01/hall_squad_02)
(sleep_until
(volume_test_objects hall_01_back_drop
(players_current)) 1)
(ai_place hall_01/hall_squad_01)
(sleep_until
(volume_test_objects hall_02_drop
(players_current)) 5)
(print door open)
(ai_place hall_02)
(ai_place locked_lab_people/trapped_sci)
(sleep_until
(volume_test_objects locked_lab
(players_current)) 15)
(game_save_cancel)
(game_save_no_timeout)
(sleep_until
(volume_test_objects locked_lab_fight
(players_origin)) 1)
(device_set_position locked_lab_door 1.00)
(ai_place locked_lab_people/ambush)
(ai_command_list locked_lab_people/trapped_sci locked_lab)))

(script startup void first_floor_02
(begin
(sleep_until
(volume_test_objects hall_03_drop
(players_current)) 5)
(ai_place hall_03)
(sleep_until
(volume_test_objects bath_save
(players_current)))
(game_save_cancel)
(game_save_no_timeout)
(ai_place hall_04)
(ai_place hall_04_bots)
(ai_berserk hall_04_bots true)
(ai_place locked_lab_zombies)
(sleep_until
(volume_test_objects hall_5_drop
(players_current)) 15)
(ai_place hall_05)
(sleep_until
(volume_test_objects ramp_e
(players_current)) 15)
(ai_place elevator_defense)
(ai_magically_see_players elevator_defense)))

(script startup void second_floor
(begin
(sleep_until
(volume_test_objects floor_02_start
(players_current)) 1)
(ai_place floor_02_def)
(ai_place bot_room_01)
(ai_place test_room/sci_test_01)
(ai_braindead bot_room_01 true)
(game_save_cancel)
(game_save_no_timeout)
(sleep_until
(=
(device_group_get bot_room) 1.00))
(ai_braindead bot_room_01 false)
(ai_place test_room/sci_test_02)
(ai_command_list test_room/sci_test_01 botroom)
(ai_enable_communication bot_room_01 false)
(ai_berserk bot_room_01 true)
(sound_impulse_start sound\dialog\fixitbot\berserk
(list_get
(ai_actors bot_room_01) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\fixitbot\berserk))
(ai_enable_communication bot_room_01 true)
(sleep_until
(volume_test_objects bot_trigger_02
(players_current)) 5)
(ai_place bot_room_02)
(ai_braindead bot_room_02 true)
(game_save_cancel)
(game_save_no_timeout)
(sleep_until
(volume_test_objects bot_trigger_03
(players_current)) 5)
(ai_braindead bot_room_02 false)
(ai_magically_see_players bot_room_02)
(ai_place room_guard_01)
(sleep_until
(volume_test_objects half_way_point
(players_current)) 15)
(game_save_cancel)
(game_save_no_timeout)
(ai_place storage_a)
(ai_place hall_guard_01)
(ai_braindead bot_room_02 true)
(sleep_until
(volume_test_objects ramp_d
(players_current)) 1)
(ai_place acid_room)
(ai_berserk acid_room true)
(game_save_cancel)
(game_save_no_timeout)))

(script dormant void teleport_spawns_01
(begin
(sleep_until
(or
(objects_can_see_flag
(players_current) spawn_a 40.00)
(objects_can_see_flag
(players_current) spawn_b 40.00)
(objects_can_see_flag
(players_current) spawn_c 40.00)) 1)
(if
(or
(objects_can_see_flag
(players_current) spawn_a 40.00)
(objects_can_see_flag
(players_current) spawn_c 40.00))
(begin
(sleep_until
(and
(not
(volume_test_objects teleport_start
(players_current)))
(not
(objects_can_see_flag
(players_current) spawn_b 40.00))))
(ai_place teleport_room/b_wave)
(set spawntag 1)
(sleep_until
(and
(not
(objects_can_see_flag
(players_current) spawn_a 40.00))
(not
(volume_test_objects teleport_spawn_a
(players_current)))) 1)
(ai_place teleport_room/a_wave))
(begin
(if
(or
(objects_can_see_flag
(players_current) spawn_c 40.00)
(objects_can_see_flag
(players_current) spawn_b 40.00))
(begin
(sleep_until
(and
(not
(volume_test_objects teleport_spawn_a
(players_current)))
(not
(objects_can_see_flag
(players_current) spawn_a 40.00))))
(ai_place teleport_room/a_wave)
(set spawntag 1)
(sleep_until
(and
(not
(objects_can_see_flag
(players_current) spawn_b 40.00))
(not
(volume_test_objects teleport_start
(players_current)))) 1)
(ai_place teleport_room/b_wave)))))))

(script dormant void teleport_spawns_02
(begin
(sleep_until
(or
(objects_can_see_flag
(players_current) spawn_a 40.00)
(objects_can_see_flag
(players_current) spawn_b 40.00)
(objects_can_see_flag
(players_current) spawn_c 40.00)) 1)
(if
(or
(objects_can_see_flag
(players_current) spawn_a 40.00)
(objects_can_see_flag
(players_current) spawn_b 40.00))
(begin
(sleep_until
(and
(not
(volume_test_objects teleport_spawn_c
(players_current)))
(not
(objects_can_see_flag
(players_current) spawn_c 40.00))))
(ai_place teleport_room/c_wave)
(set spawntag 2)
(sleep_until
(and
(not
(objects_can_see_flag
(players_current) spawn_a 40.00))
(not
(volume_test_objects teleport_spawn_a
(players_current)))) 1)
(ai_place teleport_room/a_wave))
(begin
(if
(or
(objects_can_see_flag
(players_current) spawn_c 40.00)
(objects_can_see_flag
(players_current) spawn_b 40.00))
(begin
(sleep_until
(and
(not
(volume_test_objects teleport_spawn_a
(players_current)))
(not
(objects_can_see_flag
(players_current) spawn_a 40.00))))
(ai_place teleport_room/a_wave)
(set spawntag 2)
(sleep_until
(and
(not
(objects_can_see_flag
(players_current) spawn_c 40.00))
(not
(volume_test_objects teleport_spawn_c
(players_current)))) 1)
(ai_place teleport_room/c_wave)))))))

(script dormant void teleport_spawns_03b
(begin
(sleep_until
(> spawntag 2))
(if
(= spawntag 3)
(begin
(begin
(sleep_until
(not
(objects_can_see_flag
(players_current) spawn_b 40.00)) 1)
(ai_place teleport_room/b_wave)
(sleep_until
(not
(objects_can_see_flag
(players_current) spawn_c 40.00)) 1)
(ai_place teleport_bot)
(ai_berserk teleport_bot true)))
(if
(= spawntag 4)
(begin
(begin
(sleep_until
(not
(objects_can_see_flag
(players_current) spawn_b 40.00)) 1)
(ai_place teleport_room/b_wave)
(sleep_until
(not
(objects_can_see_flag
(players_current) spawn_c 40.00)) 1)
(ai_place teleport_bot)
(ai_berserk teleport_bot true)))
(if
(= spawntag 5)
(begin
(begin
(sleep_until
(not
(objects_can_see_flag
(players_current) spawn_a 40.00)) 1)
(ai_place teleport_room/a_wave)
(sleep_until
(not
(objects_can_see_flag
(players_current) spawn_c 40.00)) 1)
(ai_place teleport_bot)
(ai_berserk teleport_bot true))))))))

(script dormant void teleport_spawns_03a
(begin
(sleep_until
(or
(objects_can_see_flag
(players_current) spawn_a 40.00)
(objects_can_see_flag
(players_current) spawn_b 40.00)
(objects_can_see_flag
(players_current) spawn_c 40.00)) 1)
(if
(objects_can_see_flag
(players_current) spawn_a 40.00)
(begin
(begin
(ai_place teleport_room/c_wave)
(set spawntag 3)
(wake teleport_spawns_03b)
(sleep_until
(not
(objects_can_see_flag
(players_current) spawn_a 40.00)) 1)
(ai_place teleport_room/a_wave)))
(if
(objects_can_see_flag
(players_current) spawn_c 40.00)
(begin
(begin
(ai_place teleport_room/a_wave)
(set spawntag 4)
(wake teleport_spawns_03b)
(sleep_until
(not
(objects_can_see_flag
(players_current) spawn_c 40.00)) 1)
(ai_place teleport_room/c_wave)))
(if
(objects_can_see_flag
(players_current) spawn_b 40.00)
(begin
(begin
(ai_place teleport_room/c_wave)
(set spawntag 5)
(wake teleport_spawns_03b)
(sleep_until
(not
(objects_can_see_flag
(players_current) spawn_b 40.00)) 1)
(ai_place teleport_room/b_wave))))))))

(script startup void second_floor_fight
(begin
(sleep_until
(volume_test_objects teleport_start
(players_current)) 15)
(ai_place teleport_room/starter)
(set teleport_fight true)
(sleep_until
(volume_test_objects window_drop
(players_origin)) 1)
(device_operates_automatically_set pre_teleport false)
(sleep_until
(<=
(ai_living_count teleport_room/starter) 2) 1)
(game_save_cancel)
(game_save_no_timeout)
(sleep 60)
(wake teleport_spawns_01)
(sleep_until
(= spawntag 1))
(ai_magically_see_players teleport_room)
(sleep_until
(<=
(ai_living_count teleport_room) 2) 1)
(game_save_cancel)
(game_save_no_timeout)
(sleep 60)
(wake teleport_spawns_02)
(sleep_until
(= spawntag 2))
(ai_magically_see_players teleport_room)
(sleep 15)
(sleep_until
(<=
(ai_living_count teleport_room) 2) 1)
(game_save_cancel)
(game_save_no_timeout)
(sleep 60)
(wake teleport_spawns_03a)
(sleep_until
(> spawntag 2))
(sleep_until
(=
(ai_living_count teleport_room) 0) 1)
(activate_nav_point_flag guidebot second_floor_fight t_flag 0.10)
(activate_nav_point_flag guidebot second_floor_fight t_flag 0.10)
(set teleport_fight_stop true)))

(script startup void go_to_lab
(begin
(sleep_until
(and
(= teleport_fight true)
(= teleport_fight_stop true)
(volume_test_objects teleport_core
(players_origin))))
(player_enable_input false)
(print now moving experimental materials to main lab.  please stand back!) go_to_lab
(sound_impulse_start sound\sfx\cinematics\c30\teleport none 1.00)
(camera_set end_teleport_2 150)
(sleep 150)
(camera_set end_teleport_3 30)
(fade_out 0.00 0.00 0.00 30)
(sleep 30) go_to_lab
(fade_out 0.00 0.00 0.00 0)
(switch_bsp 2)
(volume_teleport_players_not_inside wye_port lab_test)
(deactivate_nav_point_flag go_to_lab t_flag)
(deactivate_nav_point_flag go_to_lab t_flag)))

(script dormant void backpack_lights
(begin
(sleep 10)
(object_set_maximum_vitality backpack_lights 1.00 0.00)))

(script startup void surprise_yall
(begin
(sleep_until
(=
(device_group_get door_opener_03) 1.00) 1)
(ai_place surprise_bot)
(ai_berserk surprise_bot true)))

(script continuous void fighting_food
(begin
(sleep_until wye_fight)
(sleep 300)
(set wye_spawns
(real_random_range 0.00 1.00))
(if
(<= wye_spawns 0.20)
(begin
(begin
(if
(and
(<
(ai_living_count lab_fight/attack_01) 2)
(<
(ai_living_count z_crypt_03/lab_zombie) 3))
(ai_place lab_fight/lab_food))
(device_set_power summon_01 1.00)
(object_teleport
(list_get
(ai_actors lab_fight/lab_food) 0) summon_01)
(ai_migrate_by_unit
(list_get
(ai_actors lab_fight/lab_food) 0) lab_fight/attack_01)
(sleep 15)
(device_set_power summon_01 0.00)))
(if
(<= wye_spawns 0.40)
(begin
(begin
(if
(and
(<
(ai_living_count lab_fight/attack_01) 2)
(<
(ai_living_count z_crypt_03/lab_zombie) 3))
(ai_place lab_fight/lab_food))
(device_set_power summon_02 1.00)
(object_teleport
(list_get
(ai_actors lab_fight/lab_food) 0) summon_02)
(ai_migrate_by_unit
(list_get
(ai_actors lab_fight/lab_food) 0) lab_fight/attack_01)
(sleep 15)
(device_set_power summon_02 0.00)))
(if
(<= wye_spawns 0.60)
(begin
(begin
(if
(and
(<
(ai_living_count lab_fight/attack_01) 2)
(<
(ai_living_count z_crypt_03/lab_zombie) 3))
(ai_place lab_fight/lab_food))
(device_set_power summon_03 1.00)
(object_teleport
(list_get
(ai_actors lab_fight/lab_food) 0) summon_03)
(ai_migrate_by_unit
(list_get
(ai_actors lab_fight/lab_food) 0) lab_fight/attack_01)
(sleep 15)
(device_set_power summon_03 0.00)))
(if
(<= wye_spawns 0.80)
(begin
(begin
(if
(and
(<
(ai_living_count lab_fight/attack_01) 2)
(<
(ai_living_count z_crypt_03/lab_zombie) 3))
(ai_place lab_fight/lab_food))
(device_set_power summon_04 1.00)
(object_teleport
(list_get
(ai_actors lab_fight/lab_food) 0) summon_04)
(ai_migrate_by_unit
(list_get
(ai_actors lab_fight/lab_food) 0) lab_fight/attack_01)
(sleep 15)
(device_set_power summon_04 0.00)))))))))

(script continuous void blast_switch
(begin
(sleep_until wye_fight)
(if
(= backpack_weapon beam)
(begin
(if
(volume_test_objects kill_zone
(players_current))
(begin
(unit_set_weapon blast_switch weapons\wye_backpack\wye_backpack_blast)
(set backpack_weapon blast))))
(begin
(sleep_until
(=
(volume_test_objects kill_zone
(players_current)) false) 1)
(unit_set_weapon blast_switch weapons\wye_backpack\wye_backpack)
(set backpack_weapon beam)))))

(script continuous void wye_schocker
(begin
(if
(and
(=
(device_group_get wye_shock_01) 1.00)
(=
(device_group_get wye_shock_02) 1.00)
(=
(device_group_get wye_shock_03) 1.00)
(=
(device_group_get wye_shock_04) 1.00))
(begin
(sound_impulse_stop sound\dialog\c30\se_alarm_stage_1)
(sound_impulse_start sound\dialog\c30\se_alarm_stage_2 none 1.00)
(sleep
(sound_impulse_time sound\dialog\c30\se_alarm_stage_2))
(device_set_power top_bolt 0.00)
(sound_impulse_start sound\sfx\ambience\c30_lab\forcefield_powerdown none 1.00)
(device_set_power bolt_core 1.00)
(set wye_health_true
(* wye_health_true
(object_get_health wye_schocker)))
(object_set_current_vitality wye_schocker wye_health_true 0.01)
(effect_new_on_object weapons\boomstick\detonation
(list_get
(ai_actors wye_enc) 0))
(sound_impulse_start sound\dialog\c30\se_wye_4
(list_get
(ai_actors wye_enc) 0) 1.00)
(ai_magically_see_players lab_fight)
(ai_begin_flee wye_enc false 150)
(sleep 240)
(sound_impulse_start sound\dialog\c30\se_alarm_stage_3 none 1.00)
(sleep
(sound_impulse_time sound\dialog\c30\se_alarm_stage_3))
(device_set_power bolt_core 0.00)
(device_set_power top_bolt 1.00)
(device_group_change_only_once_more_set wye_shock_01 true)
(device_group_change_only_once_more_set wye_shock_02 true)
(device_group_change_only_once_more_set wye_shock_03 true)
(device_group_change_only_once_more_set wye_shock_04 true)
(device_group_set wye_shock_01 0.00)
(device_group_set wye_shock_02 0.00)
(device_group_set wye_shock_03 0.00)
(device_group_set wye_shock_04 0.00)
(device_group_change_only_once_more_set wye_shock_01 true)
(device_group_change_only_once_more_set wye_shock_02 true)
(device_group_change_only_once_more_set wye_shock_03 true)
(device_group_change_only_once_more_set wye_shock_04 true)))))

(script continuous void shocker_sounds
(begin
(sleep_until
(>=
(+
(device_group_get wye_shock_01)
(device_group_get wye_shock_02)
(device_group_get wye_shock_03)
(device_group_get wye_shock_04)) 2.00) 1)
(sound_impulse_start sound\dialog\c30\se_alarm_stage_1 none 1.00)
(sleep
(sound_impulse_time sound\dialog\c30\se_alarm_stage_1))
(sleep 300)
(if
(>=
(+
(device_group_get wye_shock_01)
(device_group_get wye_shock_02)
(device_group_get wye_shock_03)
(device_group_get wye_shock_04)) 4.00)
(sleep_until
(<
(+
(device_group_get wye_shock_01)
(device_group_get wye_shock_02)
(device_group_get wye_shock_03)
(device_group_get wye_shock_04)) 2.00)))))

(script startup void main_lab
(begin
(sleep_until
(volume_test_objects lab_entry_movie
(players_current)) 1)
(object_create top_bolt)
(set wye_health 0)
(set wye_health_true 1000)
(object_set_maximum_vitality main_lab wye_health_true 200.00)
(ai_set_resurrection_group z_crypt_03/lab_zombie)
(object_teleport main_lab lab_cutscene_a1)
(object_teleport main_lab lab_cutscene_a2)
(unit_special_attack_set_count main_lab 1 3)
(game_save_cancel)
(if main_lab main_lab) main_lab
(set wye_fight true)
(ai_place wye_enc)
(activate_nav_point_object guidebot main_lab
(list_get
(ai_actors wye_enc) 0) 0.75)
(activate_nav_point_object guidebot main_lab
(list_get
(ai_actors wye_enc) 0) 0.75)
(objects_cannot_be_possessed
(list_get
(ai_actors wye_enc) 0) true)
(wake backpack_lights)
(set lab_battle true)
(object_teleport main_lab lab_cutscene_b1)
(object_teleport main_lab lab_cutscene_b2)
(player_set_profile main_lab lab_fight true)
(player_set_profile main_lab lab_fight true)
(player_enable_input true)
(ai_disregard
(players_current) true)
(fade_in 0.00 0.00 0.00 30)
(sleep 60)
(ai_disregard
(players_current) false)
(set wye_music true)
(sleep_until
(<=
(object_get_health main_lab) 0.90))
(sound_impulse_start sound\dialog\c30\se_wye_stage_1 main_lab 1.00)
(sleep_until
(<=
(object_get_health main_lab) 0.50))
(sound_impulse_start sound\dialog\c30\se_wye_stage_2 main_lab 1.00)
(sleep_until
(<=
(object_get_health main_lab) 0.30))
(sound_impulse_start sound\dialog\c30\se_wye_stage_3 main_lab 1.00)
(sleep
(sound_impulse_time sound\dialog\c30\se_wye_stage_3))
(sleep_until
(<=
(object_get_health main_lab) 0.15))
(game_save_cancel)
(objects_cannot_take_damage main_lab true)
(objects_cannot_take_damage main_lab true)
(set wye_music false)
(sound_impulse_stop sound\dialog\c30\se_wye_stage_1)
(sound_impulse_stop sound\dialog\c30\se_wye_stage_2)
(sound_impulse_stop sound\dialog\c30\se_wye_stage_3)
(sleep -1 wye_schocker)
(sleep -1 shocker_sounds) main_lab
(sound_impulse_start sound\sfx\cinematics\c30\end none 1.00)
(camera_set ending_camera 120)
(fade_out 0.00 0.00 0.00 180)
(sleep 180)
(fade_out 0.00 0.00 0.00 0) main_lab
(sleep 2)
(object_teleport main_lab lab_cutscene_a1)
(object_teleport main_lab lab_cutscene_a2)
(ai_erase wye_enc)
(ai_kill lab_fight)
(ai_braindead z_crypt_03 true)
(objects_delete_by_definition devices\univac\univac)
(game_save_cancel)
(if main_lab main_lab) main_lab
(objects_cannot_take_damage main_lab false)
(objects_cannot_take_damage main_lab false)
(game_won)))

(script continuous void elevator_01
(begin
(apply_impulse shaft_b shaft_b 0.10 0.10 effects\tubes\lift)
(apply_impulse shaft_c shaft_c 0.20 0.20 effects\tubes\lift)
(apply_impulse shaft_c_a shaft_c_a 0.10 0.10 effects\tubes\lift)
(apply_impulse shaft_c_b shaft_c_b 0.10 0.10 effects\tubes\lift)
(apply_impulse shaft_e shaft_e 0.10 0.10 effects\tubes\lift)
(apply_impulse lab_up_a shaft_e 0.10 0.10 effects\tubes\lift)
(apply_impulse lab_up_b shaft_e 0.10 0.10 effects\tubes\lift)
(apply_impulse ramp_a ramp_a 0.07 0.20 effects\tubes\lift)
(apply_impulse ramp_b ramp_b 0.07 0.20 effects\tubes\lift)
(apply_impulse ramp_c ramp_c 0.07 0.20 effects\tubes\lift)
(apply_impulse ramp_d ramp_d 0.07 0.20 effects\tubes\lift)
(apply_impulse ramp_e ramp_e 0.10 0.30 effects\tubes\lift)
(apply_impulse ramp_f ramp_f 0.07 0.20 effects\tubes\lift)
(apply_impulse blow_over_01 blow_over_01 0.10 0.10 effects\tubes\lift)
(apply_impulse blow_over_01 blow_over_01 0.20 0.20 effects\tubes\lift)
(apply_impulse blow_over_02 blow_over_02 0.20 0.20 effects\tubes\lift)
(apply_impulse blow_over_03 blow_over_03 0.20 0.10 effects\tubes\lift)
(apply_impulse blow_over_04 blow_over_04 0.20 0.10 effects\tubes\lift)
(apply_impulse fallen_ceiling fallen_ceiling 0.20 0.20 effects\tubes\lift)
(apply_impulse fallen_ceiling_b fallen_ceiling_b 0.20 0.20 effects\tubes\lift)))

(script continuous void escalator_sounds
(begin
(sleep_until
(or
(volume_test_objects ramp_a
(players_origin))
(volume_test_objects ramp_b
(players_origin))
(volume_test_objects ramp_c
(players_origin))
(volume_test_objects ramp_d
(players_origin))
(volume_test_objects ramp_e
(players_origin))
(volume_test_objects ramp_f
(players_origin))))
(sound_impulse_start sound\sfx\ambience\c30_lab\sci_fi_escalator none 1.00)
(sleep
(sound_impulse_time sound\sfx\ambience\c30_lab\sci_fi_escalator))))

(script continuous void elevator_sounds
(begin
(sleep_until
(or
(volume_test_objects shaft_e
(players_origin))
(volume_test_objects shaft_b
(players_origin))))
(sound_impulse_start sound\sfx\ambience\c30_lab\elevator none 1.00)
(sleep
(sound_impulse_time sound\sfx\ambience\c30_lab\elevator))))

(script startup void elevator_base_a
(begin
(sleep_until
(volume_test_objects shaft_a
(players_origin)))
(sleep_until
(and
(>
(device_group_get lift_01) 0.00)
(volume_test_objects shaft_a
(players_origin))))
(volume_teleport_players_not_inside wye_port floor_01_launch)
(apply_impulse shaft_a shaft_a 0.40 0.40 effects\tubes\lift)))

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
(= wye_music false)
(not hand_music)) 1)
(sound_looping_start sound\music\hand_3\hand_3 none 1.00)
(sleep_until
(or
(= hand_music false)
(= wye_music true) hand_music) 1)
(sound_looping_stop sound\music\hand_3\hand_3)))

(script continuous void wye_music
(begin
(sleep_until
(and
(= wye_music true)
(not wye_music)) 1)
(if hand_music
(sleep 30))
(sound_looping_start sound\music\c30\battle_wye\battle_wye none 1.00)
(sleep_until
(or
(= wye_music false) wye_music) 1)
(sound_looping_stop sound\music\c30\battle_wye\battle_wye)))

(script static void player_effect_boom
(begin
(player_effect_set_max_translation 0.00 0.00 0.00)
(player_effect_set_max_rotation 0.00 0.00 0.00)
(player_effect_set_max_rumble 0.40 1.00)
(player_effect_start
(real_random_range 0.70 0.90) 0.10)
(print boom!)))

(script dormant void animate_wye
(begin
(custom_animation 10_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed point true)
(sleep
(unit_get_custom_animation_time 10_wye_1))
(custom_animation 10_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed no true)
(sleep
(unit_get_custom_animation_time 10_wye_1))
(custom_animation 10_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 10_wye_1))
(custom_animation 10_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed threaten true)
(sleep
(unit_get_custom_animation_time 10_wye_1))
(custom_animation 10_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed point true)
(sleep
(unit_get_custom_animation_time 10_wye_1))
(custom_animation 10_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 10_wye_1))
(custom_animation 10_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 10_wye_1))
(custom_animation 10_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 10_wye_1))))

(script static void c30_10_run
(begin
(fade_out 0.00 0.00 0.00 0)
(sound_looping_predict sound\cinematics\c30\10_foley_1) c30_10_run
(switch_bsp 0)
(object_activation_add_camera 10_01)
(object_create 10_wye_1)
(unit_set_weapon 10_wye_1 none)
(unit_set_seat 10_wye_1 alert)
(object_create 10_stubbs_1)
(object_beautify 10_stubbs_1 true)
(sound_class_set_gain ambient_machinery 0.40 0)
(sound_looping_start sound\cinematics\c30\10_foley_1 none 1.00)
(print c30_10:  introduction)
(camera_set 10_01 0)
(fade_in 0.00 0.00 0.00 60)
(sound_impulse_start sound\dialog\c30\se_alarm_7 none 0.75)
(sleep 120) c30_10_run
(sleep 10)
(player_effect_stop
(real_random_range 0.75 1.25))
(sleep 30)
(custom_animation 10_stubbs_1 cinematics\animations\stubbs\c30\c30 c30_10_stubbs_1 false)
(sleep 90)
(sleep 30)
(custom_animation 10_wye_1 cinematics\animations\wye\c30\c30 c30_10_wye_1 false)
(sleep 6)
(sound_impulse_start sound\dialog\c30\10_wye_1 none 1.00)
(sound_impulse_start sound\dialog\c30\10_wye_1_lipsync 10_wye_1 0.00)
(camera_video_enable true)
(camera_video_set 10_04)
(sleep 30)
(camera_set 10_02 20)
(sleep
(-
(sound_impulse_time sound\dialog\c30\10_wye_1) 60.00))
(camera_set 10_01 0)
(sleep 50)
(camera_video_enable false)
(sleep 60)
(fade_out 0.00 0.00 0.00 0) c30_10_run
(object_activation_clear)
(object_destroy_containing 10_)
(sound_class_set_gain ambient_machinery 1.00 15)))

(script continuous void wye_pace
(begin
(object_teleport 20_wye_1 20_wye_2)
(sleep 20)
(object_teleport 20_wye_1 20_wye_1)
(sleep 20)
(object_teleport 20_wye_1 20_wye_3)
(sleep 20)
(object_teleport 20_wye_1 20_wye_4)
(sleep 20)))

(script dormant void 20_stubbs_dialog
(begin
(sound_impulse_start sound\cinematics\c30\20_stubbs_1 20_stubbs_1 1.00)
(sleep
(sound_impulse_time sound\cinematics\c30\20_stubbs_1))
(sleep 268)
(sound_impulse_start sound\cinematics\c30\20_stubbs_2 20_stubbs_1 1.00)
(sleep
(sound_impulse_time sound\cinematics\c30\20_stubbs_2))
(sleep 560)
(sound_impulse_start sound\cinematics\c30\20_stubbs_3 20_stubbs_1 1.00)))

(script dormant void 20_foley
(begin
(sleep 5)
(sound_looping_start sound\cinematics\c30\20_foley_1 none 0.50)))

(script static void c30_20_run
(begin
(fade_out 0.00 0.00 0.00 0) c30_20_run
(switch_bsp 2)
(sleep 1)
(sound_looping_predict sound\cinematics\c30\20_foley_1)
(object_activation_add_camera 20_02)
(object_create 20_stubbs_1)
(object_beautify 20_stubbs_1 true)
(sound_class_set_gain ambient_machinery 0.40 0)
(sound_class_set_gain device_machinery 0.00 0)
(recording_play 20_stubbs_1 20_stubbs_1)
(sleep 30)
(wake 20_foley)
(wake 20_stubbs_dialog)
(print c30_20:  stubbs in a forcefield)
(camera_set_relative 20_01 0 20_stubbs_1)
(fade_in 0.00 0.00 0.00 0)
(sleep 60)
(camera_set 20_02 90)
(sleep 45)
(camera_set 20_03 90)
(sleep 45)
(camera_set 20_03b 90)
(sleep 45)
(camera_set 20_04 90)
(sleep 45)
(camera_set 20_05 90)
(sleep 30)
(object_create 20_wye_1)
(object_beautify 20_wye_1 true)
(recording_play 20_wye_1 20_wye_1)
(sleep 45)
(sound_impulse_start sound\dialog\c30\20_wye_1 20_wye_1 1.00)
(sleep
(+
(sound_impulse_time sound\dialog\c30\20_wye_1) 10.00))
(recording_kill 20_wye_1)
(custom_animation 20_stubbs_1 cinematics\animations\stubbs\c30\c30 c30_20_stubbs_1 false)
(camera_set 20_06 0)
(sleep 30)
(object_create 20_forcefield_1)
(camera_set 20_06b 90)
(sleep 60)
(camera_set 20_06c 120)
(sleep 90)
(custom_animation 20_wye_1 cinematics\animations\wye\c30\c30 c30_20_wye_1 false)
(camera_set 20_07 0)
(camera_set 20_07b 300)
(sleep 6)
(sound_impulse_start sound\dialog\c30\20_wye_2 20_wye_1 1.00)
(sleep
(sound_impulse_time sound\dialog\c30\20_wye_2))
(camera_set 20_08 0)
(sound_impulse_start sound\dialog\c30\20_wye_3 20_wye_1 1.00)
(object_create 20_scientist_1)
(object_create 20_scientist_2)
(object_create 20_scientist_3)
(unit_set_seat 20_scientist_1 alert)
(unit_set_seat 20_scientist_2 alert)
(unit_set_seat 20_scientist_3 alert)
(sleep 60)
(custom_animation 20_scientist_3 cinematics\animations\civ_male_biz\common\common alert unarmed shrug false)
(camera_set 20_09 0)
(sleep
(unit_get_custom_animation_time 20_scientist_3))
(camera_set 20_08 0)
(sleep
(-
(sound_impulse_time sound\dialog\c30\20_wye_3) 120.00))
(unit_custom_animation_at_frame 20_stubbs_1 cinematics\animations\stubbs\c30\c30 c30_20_stubbs_2 false 200)
(camera_set 20_10 0)
(print jerk off)
(sleep 120)
(camera_set 20_08e 0)
(sound_impulse_start sound\dialog\c30\20_wye_4 20_wye_1 1.00)
(sleep
(sound_impulse_time sound\dialog\c30\20_wye_4))
(object_destroy 20_forcefield_1)
(object_destroy 20_stubbs_1)
(object_create_anew 20_wye_1)
(object_create 20_judy_1)
(unit_set_seat 20_judy_1 alert)
(camera_set 20_11 0)
(camera_set 20_11b 60)
(print sparks, explode, blam!)
(sleep 30)
(sound_impulse_start sound\dialog\c30\20_wye_5 20_wye_1 1.00)
(sleep 90)
(object_teleport 20_judy_1 20_judy_1)
(custom_animation 20_judy_1 cinematics\animations\civ_female\c30\c30 c30_20_civilian_1 false)
(camera_set 20_12a 0)
(camera_set 20_12
(unit_get_custom_animation_time 20_judy_1))
(sleep
(unit_get_custom_animation_time 20_judy_1))
(effect_new_on_object_marker weapons\gut_grenade\gut_grenade_detonation 20_judy_1 head)
(object_destroy 20_judy_1)
(sleep 60)
(custom_animation 20_wye_1 cinematics\animations\wye\c30\c30 c30_20_wye_3 false)
(camera_set 20_08c 0)
(sleep 6)
(sound_impulse_start sound\dialog\c30\20_wye_6 20_wye_1 1.00)
(camera_set 20_08d 300)
(sleep
(sound_impulse_time sound\dialog\c30\20_wye_6))
(sound_impulse_start sound\dialog\c30\20_wye_7 20_wye_1 1.00)
(sleep
(sound_impulse_time sound\dialog\c30\20_wye_7))
(custom_animation 20_scientist_1 cinematics\animations\scientist\c30\c30 c30_20_scientist_1&4 false)
(custom_animation 20_scientist_2 cinematics\animations\scientist\c30\c30 c30_20_scientist_1&2 false)
(custom_animation 20_scientist_3 cinematics\animations\scientist\c30\c30 c30_20_scientist_1&3 false)
(camera_set 20_09 0)
(sleep 30)
(sleep 15)
(fade_out 0.00 0.00 0.00 0) c30_20_run
(object_activation_clear)
(object_destroy_containing 20_)
(sound_class_set_gain ambient_machinery 1.00 15)
(sound_class_set_gain device_machinery 1.00 15)))

(script dormant void 30_stubbs_dialog
(begin
(sound_impulse_start sound\cinematics\c30\30_stubbs_1 30_stubbs_1 1.00)
(sleep
(sound_impulse_time sound\cinematics\c30\30_stubbs_1))
(sound_impulse_start sound\cinematics\c30\30_stubbs_2 30_stubbs_2 1.00)
(sleep
(sound_impulse_time sound\cinematics\c30\30_stubbs_2))
(sound_impulse_start sound\cinematics\c30\30_stubbs_3 30_stubbs_3 1.00)))

(script static void c30_30_run
(begin
(fade_out 0.00 0.00 0.00 0)
(sound_looping_predict sound\cinematics\c30\30_foley_1) c30_30_run
(switch_bsp 2)
(object_activation_add_camera 30_01)
(object_create 30_stubbs_1)
(object_beautify 30_stubbs_1 true)
(object_create 30_wye_1)
(object_beautify 30_wye_1 true)
(object_set_permutation 30_wye_1 forcefield ~damaged)
(sound_class_set_gain ambient_machinery 0.40 0)
(sleep 30)
(sound_looping_start sound\cinematics\c30\30_foley_1 none 1.00)
(wake 30_stubbs_dialog)
(print c30_30:  goodbye dr. wye)
(unit_custom_animation_at_frame 30_stubbs_1 cinematics\animations\stubbs\c30\c30 c30_30_stubbs_1 false 90)
(camera_set 30_01 0)
(camera_set 30_01b 240)
(fade_in 0.00 0.00 0.00 0)
(sleep
(unit_get_custom_animation_time 30_stubbs_1))
(custom_animation 30_wye_1 cinematics\animations\wye\c30\c30 c30_30_wye_1 false)
(camera_set 30_02 0)
(sleep 20)
(object_destroy 30_stubbs_1)
(object_create 30_stubbs_2)
(object_beautify 30_stubbs_2 true)
(sound_impulse_start sound\dialog\c30\30_wye_1 30_wye_1 1.00)
(sleep
(sound_impulse_time sound\dialog\c30\30_wye_1))
(object_create 30_pumpbot_1)
(object_create_anew 30_wye_1)
(object_set_permutation 30_wye_1 forcefield ~damaged)
(camera_set_relative 30_03r 0 30_wye_1)
(cinematic_set_title laserspex)
(sleep 45)
(recording_play 30_pumpbot_1 30_pumpbot_1)
(sound_impulse_start sound\dialog\c30\30_pumpbot_1 30_pumpbot_1 1.00)
(cinematic_clear_title laserspex)
(cinematic_set_title laserspexb)
(sleep 30)
(cinematic_clear_title laserspexb)
(cinematic_set_title laserspexc)
(sleep 30)
(cinematic_clear_title laserspexc)
(cinematic_set_title laserspexd)
(sleep 7)
(cinematic_clear_title laserspexd)
(cinematic_set_title laserspexc)
(sleep 7)
(cinematic_clear_title laserspexc)
(cinematic_set_title laserspexd)
(sleep 7)
(cinematic_clear_title laserspexd)
(cinematic_set_title laserspexc)
(sleep 7)
(cinematic_clear_title laserspexc)
(cinematic_set_title laserspexd)
(sleep 7)
(cinematic_clear_title laserspexd)
(cinematic_set_title laserspexc)
(sleep 7)
(cinematic_clear_title laserspexc)
(cinematic_set_title laserspexd)
(sleep 7)
(cinematic_clear_title laserspexd)
(cinematic_set_title laserspexc)
(sleep 7)
(cinematic_clear_title laserspexc)
(cinematic_set_title laserspexd)
(sleep 7)
(cinematic_clear_title laserspexd)
(cinematic_set_title laserspexc)
(sleep
(sound_impulse_time sound\dialog\c30\30_pumpbot_1))
(cinematic_clear_title laserspexc)
(recording_play 30_wye_1 30_wye_fire)
(camera_set 30_04 0)
(camera_set 30_04b 120)
(sleep 30)
(sleep 30)
(object_set_current_vitality 30_pumpbot_1 0.00 0.00)
(effect_new_on_object_marker weapons\gut_grenade\gut_grenade_detonation 30_pumpbot_1 head)
(recording_kill 30_wye_1)
(object_destroy 30_pumpbot_1)
(sleep 30)
(fade_out 0.00 0.00 0.00 15)
(sleep 15)
(object_destroy 30_wye_1)
(object_destroy 30_stubbs_2)
(object_create 30_stubbs_3)
(object_beautify 30_stubbs_3 true)
(sleep 15)
(custom_animation 30_stubbs_3 cinematics\animations\stubbs\c30\c30 c30_30_stubbs_2 false)
(camera_set 30_05 0)
(fade_in 0.00 0.00 0.00 15)
(sleep 120)
(object_destroy 30_stubbs_3)
(object_create 30_pumpbot_2)
(object_create 30_sparks_1)
(object_create 30_stubbs_4)
(object_beautify 30_stubbs_4 true)
(custom_animation 30_stubbs_4 cinematics\animations\stubbs\c30\c30 c30_30_stubbs_3 false)
(camera_set 30_06 0)
(sleep 90)
(sound_impulse_start sound\dialog\c30\30_pumpbot_2 30_pumpbot_2 1.00)
(camera_set 30_07
(sound_impulse_time sound\dialog\c30\30_pumpbot_2))
(fade_out 0.00 0.00 0.00
(sound_impulse_time sound\dialog\c30\30_pumpbot_2))
(sleep 90)
(sleep
(unit_get_custom_animation_time 30_stubbs_4))
(object_destroy 30_stubbs_4)
(sleep
(sound_impulse_time sound\dialog\c30\30_pumpbot_2))
(fade_out 0.00 0.00 0.00 0) c30_30_run
(object_activation_clear)
(object_destroy_containing 30_)
(sound_class_set_gain ambient_machinery 1.00 0)))

(script static void cutscenes_off
(begin
(set show_cutscenes false)))

(script startup void test
(begin
(sleep -1 wye_pace)
(if
(> test 0) test)
(if
(= test 10) test)
(if
(= test 20) test)
(if
(= test 30) test)))

(script static void preview
(begin preview preview preview preview))

(script static void next_cutscene
(begin
(map_name levels\c40_cityhall\c40_cityhall_cutscene)))

(script static void unlockable_pickup
(begin
(damage_object equipment\hippo\hippo_pickup unlockable_pickup)
(if
(game_is_cooperative)
(damage_object equipment\hippo\hippo_pickup unlockable_pickup))))

(script static void stop_commentary
(begin
(sound_looping_stop sound\commentary\c30_lab\c30_lab_01)
(sound_looping_stop sound\commentary\c30_lab\c30_lab_02)
(sound_looping_stop sound\commentary\c30_lab\c30_lab_03)
(sound_looping_stop sound\commentary\c30_lab\c30_lab_04)
(sound_looping_stop sound\commentary\c30_lab\c30_lab_05)
(sound_looping_stop sound\commentary\c30_lab\c30_lab_06)
(sound_looping_stop sound\commentary\c30_lab\c30_lab_07)))

(script dormant void unlock_comment_1
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_1) 0.00) 7) unlock_comment_1
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_1
(sound_looping_start sound\commentary\c30_lab\c30_lab_01 none 1.00)
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
(sound_looping_start sound\commentary\c30_lab\c30_lab_02 none 1.00)
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
(sound_looping_start sound\commentary\c30_lab\c30_lab_03 none 1.00)
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
(sound_looping_start sound\commentary\c30_lab\c30_lab_04 none 1.00)
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
(sound_looping_start sound\commentary\c30_lab\c30_lab_05 none 1.00)
(sleep
(* 30.00 15.00))
(sleep 60)))

(script dormant void unlock_comment_6
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_6) 0.00) 7) unlock_comment_6
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_6
(sound_looping_start sound\commentary\c30_lab\c30_lab_06 none 1.00)
(sleep
(* 30.00 15.00))
(sleep 60)))

(script dormant void unlock_comment_7
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_7) 0.00) 7) unlock_comment_7
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_7
(sound_looping_start sound\commentary\c30_lab\c30_lab_07 none 1.00)
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
(wake unlock_comment_5)
(wake unlock_comment_6)
(wake unlock_comment_7)))))