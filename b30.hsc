(global bool cutscene_running false)

(global bool pee_battle false)

(global bool track false)

(global bool track_begun false)

(global bool force_track_begin false)

(global bool damtop false)

(global bool treatment false)

(global bool powerplant false)

(global bool powerplant_overload false)

(global bool on_second_floor false)

(global bool in_control_room false)

(global short dam_health 85)

(global weapon player_stubbs none)

(global vehicle teleport_player player1)

(global weapon zombie_into_transformer_lr null_zombie)

(global weapon zombie_into_transformer_ur null_zombie)

(global weapon zombie_into_transformer_ll null_zombie)

(global weapon zombie_into_transformer_ul null_zombie)

(global bool shocking_dam false)

(global bool hand_music false)

(global bool pee_battle_music false)

(global bool track_music false)

(global short basin_spawn_location 0)

(global short max_active_pee_ai_normal 5)

(global short max_active_pee_ai_insane 5)

(global short max_active_pee_ai 0)

(global cutscene flag spawn_test spawn_control_room)

(global ai spawn_squad basin/control_room)

(global short dam_top_squads_spawned 0)

(global bool tour_guide_chat false)

(global bool water_cooler_chat false)

(global bool check_robot_chat false)

(global bool check_scold_chat false)

(global bool water_room1_poisoned false)

(global bool water_room2_poisoned false)

(global real pee_level_1 0.75)

(global real pee_level_2 0.50)

(global real pee_level_3 0.25)

(global short alert_level 0)

(global bool pee_weapon0 false)

(global bool pee_weapon1 false)

(global short basin_current_round 0)

(global short basin_total_rounds 15)

(global real basin_round_increment 0.08)

(global real current_round_threshhold 0.00)

(global short time_based_spawn_round 0)

(global cutscene camera point drown_flag water_drowned0)

(global real flag_distance 0.00)

(global bool power_plant_combat_begun false)

(global bool pp_spawn_continuous false)

(global short player_track_location 0)

(global weapon zap_zombie_ll null_zombie)

(global weapon zap_zombie_lr null_zombie)

(global weapon zap_zombie_ur null_zombie)

(global weapon zap_zombie_ul null_zombie)

(global weapon zombie_into_transformer null_zombie)

(global bool electrode_ll_shocking false)

(global bool electrode_lr_shocking false)

(global bool electrode_ul_shocking false)

(global bool electrode_ur_shocking false)

(global cutscene flag truck_spawn_flag truck_respawn0)

(global short track_spawn_location 0)

(global short max_active_track_ai 3)

(global short min_active_track_ai 2)

(global cutscene flag track_spawn_test spawn_attack_electrode_ll)

(global ai track_spawn_squad dam_base_defenders/electrode_ll)

(global bool spawn_squad_internal_security false)

(global short dam_state 4)

(global short dam_barely_damaged 80)

(global short dam_damaged 50)

(global short dam_severely_damaged 25)

(global bool dam_being_shocked false)

(global bool electrode_sound_lr false)

(global bool electrode_sound_ur false)

(global bool electrode_sound_ll false)

(global bool electrode_sound_ul false)

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

(script static void b30_10
(begin
(if
(= show_cutscenes true) b30_10)))

(script static void b30_20
(begin
(if
(= show_cutscenes true) b30_20)))

(script static void b30_30
(begin
(if
(= show_cutscenes true) b30_30)))

(script static void b30_40
(begin
(if
(= show_cutscenes true) b30_40)))

(script static void b30_50
(begin
(if
(= show_cutscenes true) b30_50)))

(script static void b30_60
(begin
(if
(= show_cutscenes true) b30_60)))

(script static void cutscenes_on
(begin
(set show_cutscenes true)))

(script static void cutscenes_off
(begin
(set show_cutscenes false)))

(script static void game_save_dam
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

(script static void treatment_setup
(begin treatment_setup
(if treatment_setup treatment_setup) treatment_setup
(switch_bsp 0)
(object_teleport treatment_setup treatment_start)
(set treatment true)
(device_set_position_immediate treatment_elevator 1.00)
(fade_in 0.00 0.00 0.00 0)))

(script static void basin_setup
(begin
(fade_out 0.00 0.00 0.00 15)
(sleep 15) basin_setup
(switch_bsp 1)
(sleep 2)
(game_save_cancel)
(if basin_setup basin_setup) basin_setup
(object_teleport basin_setup pee_battle_start)
(object_teleport basin_setup pee_battle_start2)
(set pee_battle true)
(set pee_battle_music true)
(if
(=
(game_difficulty_get) normal)
(set max_active_pee_ai max_active_pee_ai_normal)
(set max_active_pee_ai max_active_pee_ai_insane))
(if
(=
(game_difficulty_get) easy)
(set max_active_pee_ai max_active_pee_ai_normal))
(object_create treatment_backtrack_locked)
(sleep 6)
(fade_in 0.00 0.00 0.00 0)
(game_save)))

(script startup void pee_battle_save
(begin
(sleep_until
(and
(= pee_battle true)
(volume_test_objects pee_batle_save_zone
(players_current))))
(print save game - pee battle) pee_battle_save))

(script startup void start_basin
(begin
(sleep_until
(volume_test_objects basin_start
(players_current)))
(camera_video_enable false)
(device_set_position treatment_exit 0.00) start_basin))

(script static void track_setup
(begin
(if
(= track false)
(begin
(set track true)
(ai_erase basin_zombies)
(ai_erase second_floor_zombies)
(ai_erase treatment_zombies)
(ai_erase power_plant_zombies)
(sleep 5)
(print track_setup call cinematic)
(game_save_cancel)
(if track_setup track_setup) track_setup
(fade_in 0.00 0.00 0.00 10)
(switch_bsp 1)
(ai_vehicle_encounter electrode_ll vehicle_zombies/electrodes)
(ai_vehicle_encounter electrode_lr vehicle_zombies/electrodes)
(ai_vehicle_encounter electrode_ul vehicle_zombies/electrodes)
(ai_vehicle_encounter electrode_ur vehicle_zombies/electrodes)
(object_create track_entrance_block)
(ai_place dam_base_defenders/scripted_scientists)
(ai_place dam_base_spawned_zombies/scripted_zombie)
(ai_set_deaf dam_base_defenders true)
(ai_set_blind dam_base_defenders true)
(ai_set_deaf dam_base_spawned_zombies true)
(ai_set_blind dam_base_spawned_zombies true)
(object_teleport track_setup track_player_fake_spawn)
(ai_disregard
(players_current) true)
(ai_playfight dam_base_defenders true) track_setup
(camera_set se_track_1 0)
(object_create hovertruck)
(ai_vehicle_encounter hovertruck vehicle_zombies/hovertruck)
(sleep 45)
(print starting scientist panic conversation)
(ai_conversation track_scientist_panic)
(set zombie_into_transformer_lr
(unit
(list_get
(ai_actors dam_base_spawned_zombies/scripted_zombie) 0)))
(ai_command_list dam_base_spawned_zombies/scripted_zombie enter_electrode_lr)
(sleep 30)
(ai_place dam_base_spawned_zombies/start_in_vehicle)
(camera_set se_track_2 240)
(if
(game_is_cooperative)
(begin
(object_teleport track_setup track_start)
(vehicle_load_magic hovertruck  track_setup))
(begin
(object_teleport track_setup track_start)
(vehicle_load_magic hovertruck  track_setup)))
(vehicle_load_magic hovertruck 
(list_get
(ai_actors dam_base_spawned_zombies/start_in_vehicle) 0))
(vehicle_load_magic hovertruck 
(list_get
(ai_actors dam_base_spawned_zombies/start_in_vehicle) 1))
(vehicle_load_magic hovertruck 
(list_get
(ai_actors dam_base_spawned_zombies/start_in_vehicle) 2))
(vehicle_load_magic hovertruck 
(list_get
(ai_actors dam_base_spawned_zombies/start_in_vehicle) 3))
(sleep 270)
(camera_set track_zombie_enter_elec 90)
(sleep 150)
(ai_set_deaf dam_base_defenders false)
(ai_set_blind dam_base_defenders false)
(ai_set_deaf dam_base_spawned_zombies false)
(ai_set_blind dam_base_spawned_zombies false)
(ai_command_list dam_base_defenders/scripted_scientists attack_electrode_lr) track_setup
(fade_in 0.00 0.00 0.00 120)
(sleep 60)
(ai_disregard
(players_current) false)
(ai_playfight dam_base_defenders false)
(ai_disregard track_setup false)
(ai_disregard track_setup false)
(ai_place dam_base_spawned_zombies/lower_deck)
(ai_vehicle_enterable_distance electrode_ll 2.00)
(ai_vehicle_enterable_distance electrode_lr 2.00)
(ai_vehicle_enterable_distance electrode_ul 2.00)
(ai_vehicle_enterable_distance electrode_ur 2.00)
(ai_vehicle_enterable_actors electrode_ll dam_base_spawned_zombies)
(ai_vehicle_enterable_actors electrode_lr dam_base_spawned_zombies)
(ai_vehicle_enterable_actors electrode_ul dam_base_spawned_zombies)
(ai_vehicle_enterable_actors electrode_ur dam_base_spawned_zombies)
(ai_place dam_base_defenders/electrode_ll)
(ai_place dam_base_defenders/electrode_ul)
(ai_place dam_base_defenders/electrode_ur)
(set track_begun true)
(game_save)
(set track_music true)))))

(script startup void start_track
(begin
(sleep_until
(or
(volume_test_objects start_track
(players_current)) force_track_begin))
(sleep 5)
(fade_out 0.00 0.00 0.00 15)
(sleep 15) start_track start_track))

(script static void dam_top_setup
(begin dam_top_setup
(switch_bsp 1)
(object_teleport dam_top_setup damtop_start)
(object_teleport dam_top_setup damtop_start2_2)
(ai_place dam_top/possess_me)
(ai_place dam_top/squad_a)
(set dam_top_squads_spawned 1)
(set damtop true)
(ai_disregard
(players_current) true)
(camera_set se_damtop_1 0)
(if
(game_is_cooperative) dam_top_setup
(begin
(player_enable_input false)
(player_camera_control false)
(camera_control true 0)))
(recording_play dam_top_setup stubbs_approaching_dam)
(camera_set se_damtop_1 0)
(fade_in 0.00 0.00 0.00 75)
(sleep 90)
(camera_set se_damtop_2 90)
(sleep 150)
(if
(game_is_cooperative) dam_top_setup
(begin
(player_enable_input true)
(player_camera_control true)
(camera_control false 75)))
(game_save)))

(script static void powerplant_setup
(begin
(set powerplant true)
(ai_place power_plant/gen_a)
(ai_place power_plant/gen_c)
(ai_place power_plant/gen_b)
(ai_conversation pp_scientist_chatter)
(ai_erase basin_zombies)
(ai_erase treatment_zombies)))

(script static void second_floor_setup
(begin
(ai_place second_floor)
(ai_place second_floor_lecture)
(ai_place second_floor_entry_room)
(object_create second_floor_entry)
(ai_attach second_floor_entry second_floor_entry_room/entry_room)
(ai_place second_floor_zombies)
(ai_braindead second_floor/control_room true)
(ai_set_team second_floor_zombies scientist)
(set on_second_floor true)
(device_set_position treatment_exit 0.99)
(camera_video_enable true)
(camera_video_set second_floor_security_cam)))

(script startup void level_start
(begin
(fade_out 0.00 0.00 0.00 0)
(set player_stubbs level_start)
(if level_start level_start) level_start
(game_save) level_start))

(script static void checkpoint1
(begin checkpoint1
(object_teleport checkpoint1 checkpoint1)))

(script static void checkpoint2
(begin checkpoint2))

(script static void checkpoint3
(begin checkpoint3))

(script static void checkpoint4
(begin
(switch_bsp 2)
(object_teleport checkpoint4 powerplant_fake_start) checkpoint4))

(script static void checkpoint5
(begin
(set force_track_begin true)))

(script static void move_to_dam
(begin
(fade_out 0.00 0.00 0.00 15)
(sleep 16)
(object_teleport move_to_dam damtop_start)
(object_teleport move_to_dam damtop_start2_2)
(fade_in 0.00 0.00 0.00 15)))

(script static void second_floor_keycard_scene
(begin
(fade_out 0.00 0.00 0.00 15)
(sleep 15) second_floor_keycard_scene
(ai_erase second_floor_entry_room)
(object_teleport second_floor_keycard_scene hide_player_second_floor)
(if
(game_is_cooperative)
(object_teleport second_floor_keycard_scene hide_player_second_floor2))
(sleep 2)
(game_save_cancel)
(if second_floor_keycard_scene second_floor_keycard_scene) second_floor_keycard_scene
(object_teleport second_floor_keycard_scene second_floor_start)
(if
(game_is_cooperative)
(object_teleport second_floor_keycard_scene second_floor_start2))
(ai_place second_floor_escape)
(ai_place second_floor_entry_room)
(object_create second_floor_entry)
(ai_attach second_floor_entry second_floor_entry_room/entry_room)
(ai_set_deaf second_floor_entry_room false)
(ai_set_blind second_floor_entry_room false)
(fade_in 0.00 0.00 0.00 15)))

(script startup void water_treatment_elevator
(begin
(sleep_until
(volume_test_objects water_treatment_elevator
(players_origin))) water_treatment_elevator
(player_enable_input false)
(volume_teleport_players_not_inside water_treatment_elevator teleport_player_water_elevator)
(sound_looping_start sound\sfx\devices\b30_dam\elevator treatment_elevator 1.00)
(device_set_position treatment_elevator 0.00)
(sleep_until
(<
(device_get_position treatment_elevator) 0.80))
(player_enable_input true)
(sleep_until
(<
(device_get_position treatment_elevator) 0.08) 5)
(sound_looping_stop sound\sfx\devices\b30_dam\elevator) water_treatment_elevator))

(script static void exit_treatment_plant_scene
(begin
(ai_disregard
(players_current) true) exit_treatment_plant_scene
(device_set_position treatment_exit 0.99)
(camera_set se_treatment_exit 30)
(object_create stubbs_card_key)
(recording_play stubbs_card_key stubbs_card_key)
(sleep 90)
(fade_out 0.00 0.00 0.00 30)
(unit_special_attack_set_count player_stubbs 2 1)
(sleep 30)
(object_destroy stubbs_card_key) exit_treatment_plant_scene
(ai_disregard
(players_current) false)
(ai_disregard exit_treatment_plant_scene false)
(ai_disregard exit_treatment_plant_scene false)
(player_move_origin player_stubbs exit_treatment_plant_scene)
(set treatment false)))

(script continuous void exit_second_floor
(begin
(sleep_until
(and on_second_floor
(<
(device_get_position treatment_exit) 0.90)
(volume_test_objects unlock_treatment_exit
(players_current))))
(print access denied: only the control room can open this door)
(sleep_until
(not
(volume_test_objects unlock_treatment_exit
(players_current))))))

(script startup void second_floor_exit_being_watched
(begin
(sleep_until
(and on_second_floor
(<
(device_get_position treatment_exit) 0.90)
(or
(volume_test_objects unlock_treatment_exit second_floor_exit_being_watched)
(volume_test_objects unlock_treatment_exit second_floor_exit_being_watched))))
(ai_disregard
(players_current) true)
(ai_playfight second_floor true) second_floor_exit_being_watched
(if
(game_is_cooperative)
(camera_set se_control_room_view0 1)
(camera_set se_control_room_view0 30))
(sleep 30)
(camera_set se_control_room_view1 30)
(sleep 30)
(camera_set se_control_room_view2 30)
(sleep 30)
(camera_set se_control_room_view3 30)
(ai_command_list second_floor/control_room control_room_watch_screen)
(sleep 100)
(camera_set se_control_room_view2 30)
(sleep 30)
(camera_set se_control_room_view1 30)
(sleep 30)
(camera_set se_control_room_view0b 30)
(sleep 30) second_floor_exit_being_watched
(ai_disregard
(players_current) false)
(ai_disregard second_floor_exit_being_watched false)
(ai_disregard second_floor_exit_being_watched false)
(ai_playfight second_floor false)
(sleep 20)
(if
(volume_test_objects unlock_treatment_exit second_floor_exit_being_watched)
(begin
(activate_nav_point_object lightbulb second_floor_exit_being_watched second_floor_exit_being_watched 0.45)
(sleep 90)
(deactivate_nav_point_object second_floor_exit_being_watched second_floor_exit_being_watched))
(begin
(activate_nav_point_object lightbulb second_floor_exit_being_watched second_floor_exit_being_watched 0.45)
(sleep 90)
(deactivate_nav_point_object second_floor_exit_being_watched second_floor_exit_being_watched)))))

(script startup void trigger_lock_treatment_exit
(begin
(sleep_until
(and on_second_floor
(volume_test_objects lock_treatment_exit
(players_current))) 15)
(print close exit doors)
(device_set_position treatment_exit 0.00)
(sleep 90)
(ai_erase second_floor_escape)))

(script startup void scientist_go_to_control_room
(begin
(sleep_until
(and on_second_floor
(volume_test_objects entering_main_room
(players_current))))
(print entering main room, move scientist to control room)
(ai_command_list second_floor/main_to_control go_to_command_room)
(ai_conversation second_floor_lecture)))

(script startup void check_command_room_combat
(begin
(sleep_until
(and on_second_floor
(or
(<
(ai_strength second_floor/control_room) 0.99)
(<
(ai_strength second_floor/control_room2) 0.99))))
(ai_command_list_advance second_floor/control_room)
(ai_command_list_advance second_floor/control_room2)
(ai_command_list_advance second_floor/main_to_control)))

(script startup void activate_main_room_1
(begin
(sleep_until
(and on_second_floor
(or
(<
(ai_strength second_floor/main) 0.99)
(<
(ai_strength second_floor_lecture) 0.99)
(<
(ai_strength second_floor/control_room) 0.99)
(<
(ai_strength second_floor/control_room2) 0.99)
(<
(ai_strength second_floor/main_to_control) 0.99)
(or
(volume_test_objects activate_main_room1
(players_current))
(volume_test_objects activate_main_room2
(players_current))))))
(print activating scientist)
(ai_set_blind second_floor/main false)
(ai_set_deaf second_floor/main false)
(ai_set_blind second_floor_lecture false)
(ai_set_deaf second_floor_lecture false)
(ai_set_blind second_floor/main_to_control false)
(ai_set_deaf second_floor/main_to_control false)
(device_set_position control_room_door 0.00)
(device_operates_automatically_set control_room_door false)))

(script startup void activate_glass_zombies
(begin
(sleep_until
(and on_second_floor
(breakable_surfaces_broken sturdy glass)))
(print zombies are escaping!!)
(ai_set_team second_floor_zombies zombie)
(ai_set_blind second_floor_zombies false)
(ai_set_deaf second_floor_zombies false)
(ai_command_list_advance second_floor_zombies)
(ai_command_list second_floor_zombies zombie_escape_glass)
(ai_begin_flee second_floor/main false 90)
(ai_begin_flee second_floor_lecture false 90)))

(script startup void viewing_control_room
(begin
(sleep_until
(and on_second_floor
(volume_test_objects viewing_control_room
(players_current))))
(print control room scientist threaten player)
(ai_command_list_advance second_floor/control_room)
(sleep 10)
(ai_command_list second_floor/control_room control_room_threaten_player)))

(script startup void overload_control_room
(begin
(sleep_until
(and on_second_floor
(>
(device_get_position control_room_force_open) 0.90)))
(sound_impulse_start sound\sfx\devices\switches\b30_console_switch none 1.00)
(ai_disregard
(players_current) true)
(ai_playfight second_floor true) overload_control_room
(camera_set control_room_blowup_view 30)
(sleep 30)
(ai_command_list_advance second_floor/control_room)
(ai_command_list_advance second_floor/control_room2)
(ai_command_list_advance second_floor/main_to_control)
(ai_command_list_advance second_floor_lecture)
(object_create control_room_smoke1)
(object_create control_room_smoke2)
(object_create control_room_smoke3)
(object_create control_room_smoke4)
(object_create control_room_smoke5)
(object_create control_room_smoke6)
(ai_begin_flee second_floor/control_room false 90)
(ai_begin_flee second_floor/control_room2 false 90)
(ai_begin_flee second_floor/main_to_control false 90)
(sleep 90)
(effect_new_on_flag weapons\bazooka\rocket_explosion control_room_explosion)
(effect_new_on_flag weapons\bazooka\rocket_explosion control_room_explosion2)
(object_create control_room_steam2)
(object_create control_room_steam1)
(object_create control_room_steam4)
(object_create control_room_steam3)
(device_set_position control_room_door 0.99)
(ai_command_list second_floor/control_room flee_control_room)
(ai_command_list second_floor/control_room2 flee_control_room)
(ai_command_list second_floor/main_to_control flee_control_room)
(sleep 90) overload_control_room
(ai_disregard
(players_current) false)
(ai_disregard overload_control_room false)
(ai_disregard overload_control_room false)
(ai_playfight second_floor false)))

(script startup void control_room_exit_enabled
(begin
(sleep_until
(and on_second_floor
(>
(device_get_position control_room_open_exit) 0.90)))
(sound_impulse_start sound\sfx\devices\switches\b30_console_switch none 1.00)
(device_set_position treatment_exit 0.99)
(device_set_position control_room_door 0.99)
(if
(game_is_cooperative)
(begin
(ai_disregard
(players_current) true)
(ai_playfight second_floor true) control_room_exit_enabled
(camera_set second_floor_security_cam 1)
(sleep 90) control_room_exit_enabled
(ai_disregard
(players_current) false)
(ai_disregard control_room_exit_enabled false)
(ai_disregard control_room_exit_enabled false)
(ai_playfight second_floor false))
(print opening  exit))))

(script startup void control_room_entered
(begin
(sleep_until
(and on_second_floor
(volume_test_objects viewing_control_room
(players_current))))
(set in_control_room true)))

(script startup void control_room_access
(begin
(sleep_until
(and on_second_floor
(or
(and
(volume_test_objects control_room_entry control_room_access)
(object_is_instance control_room_access characters\wye\wye_scientist))
(and
(volume_test_objects control_room_entry control_room_access)
(object_is_instance control_room_access characters\wye\wye_scientist)))))
(device_set_position control_room_door 0.99)))

(script startup void boiler_save_game
(begin
(sleep_until
(and treatment
(volume_test_objects game_save_boiler
(players_current))))
(print save game - boiler room) boiler_save_game))

(script startup void water_save_game
(begin
(sleep_until
(and treatment
(volume_test_objects game_save_water
(players_current))))
(print save game - water room) water_save_game))

(script startup void second_floor_save_game
(begin
(sleep_until
(and treatment
(volume_test_objects second_floor_save
(players_current))))
(print save game - second floor)
(volume_teleport_players_not_inside second_floor_save teleport_player_second_floor) second_floor_save_game))

(script startup void check_boiler1_wakeup
(begin
(sleep_until
(and treatment
(or
(volume_test_objects wakeup_boiler1_enemies
(players_current))
(<
(ai_strength treatment_plant/boiler_room_1) 0.99))) 15)
(print turning on boiler room 1 enemies)
(ai_braindead treatment_plant/boiler_room_1 false)))

(script startup void treatment_boiler1_combat_robots
(begin
(sleep_until
(and
(= treatment true)
(<
(ai_strength treatment_robots_boiler_water/boiler_room_1) 0.99)))
(ai_set_blind treatment_robots_boiler_water/boiler_room_1 false)
(ai_set_deaf treatment_robots_boiler_water/boiler_room_1 false)))

(script startup void treatment_water2_combat_robots
(begin
(sleep_until
(and
(= treatment true)
(<
(ai_strength treatment_robots_boiler_water/water_room_2) 0.99)))
(ai_set_blind treatment_robots_boiler_water/water_room_2 false)
(ai_set_deaf treatment_robots_boiler_water/water_room_2 false)))

(script startup void check_boiler2_wakeup
(begin
(sleep_until
(and treatment
(or
(volume_test_objects wakeup_boiler2_enemies
(players_current))
(<
(ai_strength treatment_plant/boiler_room_2_wye) 0.99)
(<
(ai_strength treatment_plant/boiler_room_2_boom) 0.99))) 15)
(print turning on boiler room 2 enemies)
(ai_braindead treatment_plant/boiler_room_2_wye false)
(ai_braindead treatment_plant/boiler_room_2_boom false)))

(script startup void treatment_boiler2_combat_robots
(begin
(sleep_until
(and
(= treatment true)
(<
(ai_strength treatment_robots_boiler_water/boiler_room_2) 0.99)))
(ai_set_blind treatment_robots_boiler_water/boiler_room_2 false)
(ai_set_deaf treatment_robots_boiler_water/boiler_room_2 false)))

(script startup void check_water1_wakeup
(begin
(sleep_until
(and treatment
(or
(volume_test_objects wakeup_water1_enemies
(players_current))
(<
(ai_strength treatment_plant/water_room_1) 0.99))) 15)
(print turning on water room 1 enemies)
(ai_braindead treatment_plant/water_room_1 false)))

(script startup void check_water2_wakeup
(begin
(sleep_until
(and treatment
(or
(volume_test_objects wakeup_water2_enemies
(players_current))
(<
(ai_strength treatment_plant/water_room_2) 0.99))) 15)
(print turning on water room 2 enemies)
(ai_braindead treatment_plant/water_room_2 false)))

(script static bool conversation_in_progress
(begin
(if
(or
(= tour_guide_chat true)
(= water_cooler_chat true)
(= check_robot_chat true)
(= check_scold_chat true)) true false)))

(script startup void check_tour_bot_begin
(begin
(sleep_until
(and
(= treatment true)
(= check_tour_bot_begin false)
(volume_test_objects tour_guide_start
(players_current))) 5)
(volume_teleport_players_not_inside tour_guide_start treatment_coop_start)
(print start tour)
(set tour_guide_chat true)
(ai_conversation tour_guide_reception)
(sound_impulse_start sound\dialog\b30\se_alarm_1 none 1.00)
(sleep_until
(>
(ai_conversation_status tour_guide_reception) 3))
(set tour_guide_chat false)))

(script startup void check_robot_watercooler
(begin
(sleep_until
(and
(= treatment true)
(volume_test_objects reception_robot_watercooler
(players_current))))
(print watercoooler chat)
(set water_cooler_chat true)
(if check_scold_chat
(ai_conversation_stop reception_robot_fixit))
(ai_conversation robot_watercooler_chat)
(sleep_until
(>
(ai_conversation_status robot_watercooler_chat) 3))
(set water_cooler_chat false)))

(script startup void check_robot_reception_chat
(begin
(sleep_until
(and
(= treatment true)
(= check_robot_reception_chat false)
(volume_test_objects reception_robot_fixit
(players_current))))
(print reception robot console chat)
(set check_scold_chat true)
(if water_cooler_chat
(ai_conversation_stop robot_watercooler_chat))
(ai_conversation reception_robot_fixit)
(sleep_until
(>
(ai_conversation_status reception_robot_fixit) 3))
(set check_scold_chat false)))

(script startup void check_scold_chat
(begin
(sleep_until
(and
(= treatment true)
(volume_test_objects treatment_scold_convo
(players_current))))
(sleep 10)
(print hallway cop scold robot begin)
(set check_robot_chat true)
(if water_cooler_chat
(ai_conversation_stop robot_watercooler_chat))
(if check_scold_chat
(ai_conversation_stop reception_robot_fixit))
(ai_conversation cop_scolding_bot)
(sleep_until
(>
(ai_conversation_status cop_scolding_bot) 3))
(set check_robot_chat false)))

(script startup void drop_treatment_hallway_humans
(begin
(sleep_until
(volume_test_objects treatment_scold_convo
(players_current)) 1)
(ai_place treatment_hallway_humans)
(ai_place treatment_hallway_robots)))

(script startup void fan_controls_1a
(begin
(sleep_until
(and treatment
(=
(device_get_position fan_control_1a) 1.00)))
(object_destroy steam_fan_1a)
(sound_impulse_start sound\sfx\devices\switches\b30_console_switch none 1.00)
(sound_impulse_start sound\sfx\devices\monorail\arriving none 1.00)))

(script startup void fan_controls_1b
(begin
(sleep_until
(and treatment
(=
(device_get_position fan_control_1b) 1.00)))
(object_destroy steam_fan_1b)
(sound_impulse_start sound\sfx\devices\switches\b30_console_switch none 1.00)
(sound_impulse_start sound\sfx\devices\monorail\arriving none 1.00)))

(script startup void fan_controls_1c
(begin
(sleep_until
(and treatment
(=
(device_get_position fan_control_1c) 1.00)))
(object_destroy steam_fan_1c)
(sound_impulse_start sound\sfx\devices\switches\b30_console_switch none 1.00)
(sound_impulse_start sound\sfx\devices\monorail\arriving none 1.00)))

(script startup void fan_controls_2a
(begin
(sleep_until
(and treatment
(=
(device_get_position fan_control_2a) 1.00)))
(object_destroy steam_fan_2a)
(object_destroy steam_fan_2aa)
(sound_impulse_start sound\sfx\devices\switches\b30_console_switch none 1.00)
(sound_impulse_start sound\sfx\devices\monorail\arriving none 1.00)))

(script startup void fan_controls_2b
(begin
(sleep_until
(and treatment
(=
(device_get_position fan_control_2b) 1.00)))
(object_destroy steam_fan_2b)
(object_destroy steam_fan_2bb)
(sound_impulse_start sound\sfx\devices\switches\b30_console_switch none 1.00)
(sound_impulse_start sound\sfx\devices\monorail\arriving none 1.00)))

(script startup void fan_controls_2c
(begin
(sleep_until
(and treatment
(=
(device_get_position fan_control_2c) 1.00)))
(object_destroy steam_fan_2c)
(object_destroy steam_fan_2cc)
(sound_impulse_start sound\sfx\devices\switches\b30_console_switch none 1.00)
(sound_impulse_start sound\sfx\devices\monorail\arriving none 1.00)))

(script startup void check_water_room_1_poisoned
(begin
(sleep_until
(and treatment
(=
(device_get_position fan_control_1a) 1.00)
(=
(device_get_position fan_control_1b) 1.00)
(=
(device_get_position fan_control_1c) 1.00)))
(set water_room1_poisoned true)
(object_create water_poison1)
(object_create water_poison2)
(object_create water_poison3)
(object_create water_poison4)
(object_create water_poison5)
(object_create water_poison6)
(object_create water_poison7)
(object_create water_poison8)
(object_create water_poison9)
(object_create water_poison10)))

(script continuous void apply_water_room_1_poison
(begin
(sleep_until
(and treatment water_room1_poisoned))
(apply_impulse water_room1_poison_area poison_gas_direction 0.00 0.00 effects\power_plant\poison_cloud)
(sleep 30)))

(script startup void check_water_room_2_poisoned
(begin
(sleep_until
(and treatment
(=
(device_get_position fan_control_2a) 1.00)
(=
(device_get_position fan_control_2b) 1.00)
(=
(device_get_position fan_control_2c) 1.00)))
(set water_room2_poisoned true)
(object_create water2_poison1)
(object_create water2_poison2)
(object_create water2_poison3)
(object_create water2_poison4)
(object_create water2_poison5)
(object_create water2_poison6)
(object_create water2_poison7)
(object_create water2_poison8)
(object_create water2_poison9)
(object_create water2_poison10)))

(script continuous void apply_water_room_2_poison
(begin
(sleep_until
(and treatment water_room2_poisoned))
(apply_impulse water_room2_poison_area poison_gas_direction 0.00 0.00 effects\power_plant\poison_cloud)
(sleep 30)))

(script startup void treatment_hallway_start_combat
(begin
(sleep -1)
(print combat starting! wake up!)
(ai_set_blind treatment_hallway_humans false)
(ai_set_deaf treatment_hallway_humans false)))

(script startup void wakeup_hallway_enemies
(begin
(sleep_until
(and treatment
(volume_test_objects wakeup_hallway_enemies
(players_current))))
(ai_set_blind treatment_hallway_humans false)
(ai_set_deaf treatment_hallway_humans false)))

(script startup void treatment_hallway_check_combat
(begin
(sleep_until
(and
(= treatment true)
(<
(ai_strength treatment_hallway_humans) 0.99)))
(wake treatment_hallway_start_combat)))

(script startup void treatment_hallway_combat_robots
(begin
(sleep_until
(and
(= treatment true)
(<
(ai_strength treatment_hallway_robots) 0.99)))
(ai_set_blind treatment_hallway_robots false)
(ai_set_deaf treatment_hallway_robots false)))

(script startup void bot_harass_tourbot_shakeit
(begin
(sleep_until
(and treatment
(volume_test_objects bot_harass_tour
(ai_actors tour_bot))
(volume_test_objects bot_harass_tour
(ai_actors treatment_hallway_robots))))
(ai_conversation preventative)))

(script continuous void basin_cleaner
(begin
(if pee_battle
(begin
(objects_destroy
(objects_in_volume
(ai_actors basin) trim_box))
(objects_destroy
(objects_in_volume
(ai_actors basin_zombies) trim_box))))
(sleep 15)))

(script static bool basin_try_to_spawn
(begin
(if
(>= basin_spawn_location 5)
(set basin_spawn_location 0))
(if
(= basin_spawn_location 0)
(begin
(print attempting to spawn: control room (beatcops))
(set spawn_test spawn_control_room)
(set spawn_squad basin/control_room))
(if
(= basin_spawn_location 1)
(begin
(print attempting to spawn: ramp1 (wye scientists))
(set spawn_test spawn_1)
(set spawn_squad basin/ramp_1))
(if
(= basin_spawn_location 2)
(begin
(print attempting to spawn: ramp2 (beat cops))
(set spawn_test spawn_2)
(set spawn_squad basin/ramp_2))
(if
(= basin_spawn_location 3)
(begin
(print attempting to spawn: ramp3 (wye boomstick))
(set spawn_test spawn_3)
(set spawn_squad basin/ramp_3))
(if
(= basin_spawn_location 4)
(begin
(print attempting to spawn: ramp4 (wye scientists))
(set spawn_test spawn_4)
(set spawn_squad basin/ramp_4)))))))
(set basin_spawn_location
(+ basin_spawn_location 1.00))
(if
(=
(objects_can_see_flag
(players_current) spawn_test 90.00) false)
(begin
(print spawned enemies successfull)
(ai_spawn_actor spawn_squad)
(ai_set_respawn spawn_squad false) true) false)))

(script static void basin_start_new_round
(begin
(if
(>=
(ai_living_count basin) max_active_pee_ai)
(begin
(print too many ai, delaying spawn)
(sleep 60))
(begin
(set basin_current_round
(+ basin_current_round 1.00))
(if
(= basin_current_round 1)
(begin
(print begin round 1 -- one scientist)
(ai_spawn_actor basin/ramp_4))
(if
(= basin_current_round 2)
(begin
(print begin round 2 -- two beat cops)
(ai_spawn_actor basin/control_room)
(ai_spawn_actor basin/ramp_2))
(if
(= basin_current_round 3)
(begin
(print begin round 3 -- boomstick)
(ai_spawn_actor basin/ramp_3))
(if
(= basin_current_round 4)
(begin
(print begin round 4 -- 2cops, 1 scientists)
(ai_spawn_actor basin/ramp_2)
(ai_spawn_actor basin/ramp_2)
(ai_spawn_actor basin/ramp_1))
(if
(= basin_current_round 5)
(begin
(print begin round 5 -- 1 cop, 2 scientists)
(ai_spawn_actor basin/control_room)
(ai_spawn_actor basin/ramp_1)
(ai_spawn_actor basin/ramp_4))
(if
(= basin_current_round 6)
(begin
(print begin round 6 -- 1 boomstick 2 cop)
(ai_spawn_actor basin/ramp_2)
(ai_spawn_actor basin/control_room)
(ai_spawn_actor basin/ramp_3)
(ai_spawn_actor basin/ramp_3))
(if
(= basin_current_round 7)
(begin
(print begin round 7 - 2 scientists)
(ai_spawn_actor basin/ramp_1)
(ai_spawn_actor basin/ramp_4))
(if
(= basin_current_round 8)
(begin
(print begin round 8 - 1 scientists 1 boomstick 1 cop)
(ai_spawn_actor basin/ramp_1)
(ai_spawn_actor basin/control_room)
(ai_spawn_actor basin/ramp_3))
(if
(= basin_current_round 9)
(begin
(print begin round 9 -- 1 scientists 1 boomsticks)
(ai_spawn_actor basin/ramp_4)
(ai_spawn_actor basin/ramp_3))
(if
(= basin_current_round 10)
(begin
(print begin round 10 -- 2 scientists 1 cop)
(ai_spawn_actor basin/ramp_1)
(ai_spawn_actor basin/ramp_3)
(ai_spawn_actor basin/control_room))
(if
(= basin_current_round 11)
(begin
(print begin round 11 --  1 scientists, 1 cop, 1 boomstick)
(ai_spawn_actor basin/ramp_1)
(ai_spawn_actor basin/ramp_3)
(ai_spawn_actor basin/control_room))
(if
(= basin_current_round 12)
(begin
(print begin round 12 -- 3 scientists)
(ai_spawn_actor basin/ramp_1)
(ai_spawn_actor basin/ramp_1)
(ai_spawn_actor basin/ramp_4))
(if
(= basin_current_round 13)
(begin
(print begin round 13 -- 3 scientists 1 boomstick)
(ai_spawn_actor basin/ramp_1)
(ai_spawn_actor basin/ramp_1)
(ai_spawn_actor basin/ramp_4)
(ai_spawn_actor basin/ramp_3))
(if
(= basin_current_round 14)
(begin
(print begin round 14 -- 2 scientists 2 cops 1 boomsticks)
(ai_spawn_actor basin/ramp_1)
(ai_spawn_actor basin/ramp_4)
(ai_spawn_actor basin/control_room)
(ai_spawn_actor basin/ramp_2)
(ai_spawn_actor basin/ramp_3))
(if
(> basin_current_round 14)
(begin
(print begin round 15+ -- 2 scientists 2 cops 1 boomsticks)
(ai_spawn_actor basin/ramp_1)
(ai_spawn_actor basin/ramp_4)
(ai_spawn_actor basin/ramp_2)
(ai_spawn_actor basin/control_room)
(ai_spawn_actor basin/ramp_3)))))))))))))))))))
(ai_set_respawn basin/ramp_1 false)
(ai_set_respawn basin/ramp_2 false)
(ai_set_respawn basin/ramp_3 false)
(ai_set_respawn basin/ramp_4 false)
(ai_set_respawn basin/control_room false)))

(script static void basin_attempt_to_start_round
(begin
(set current_round_threshhold
(- 1.00
(*
(+ basin_current_round 1.00) basin_round_increment)))
(if
(<
(object_get_health pee_pee_target) current_round_threshhold)
(begin basin_attempt_to_start_round))))

(script continuous void basin_spawner_round_based
(begin
(sleep_until
(and pee_battle
(> alert_level 0))) basin_spawner_round_based))

(script startup void befoul_water_supply
(begin
(sleep -1)
(ai_conversation befoul_water_supply)))

(script static void start_alert
(begin
(print alert!)
(set alert_level 1)
(sound_looping_start sound\sfx\devices\alarms\alarm_01_loop none 0.50)
(sleep 30)
(sound_impulse_start sound\dialog\b30\se_dam_1 none 1.00)
(print spawning first guards)
(ai_spawn_actor basin/first_scientist)
(ai_set_respawn basin/ramp_1 false)
(ai_set_respawn basin/ramp_2 false)
(ai_set_respawn basin/ramp_3 false)
(ai_set_respawn basin/ramp_4 false)
(ai_set_respawn basin/control_room false)))

(script static void increment_to_alert_one
(begin
(print alert level one)
(set alert_level 2)
(sound_impulse_start sound\sfx\devices\alarms\prison_alarm_03 none 1.00)
(sound_impulse_start sound\dialog\b30\se_dam_2 none 1.00) increment_to_alert_one))

(script static void increment_to_alert_two
(begin
(print alert level two)
(game_save)
(set alert_level 3)
(sound_impulse_start sound\sfx\devices\alarms\prison_alarm_03 none 1.00)
(sound_impulse_start sound\dialog\b30\se_dam_3 none 1.00)))

(script static void increment_to_alert_three
(begin
(print alert level three)
(set alert_level 4)
(game_save)
(sound_impulse_start sound\sfx\devices\alarms\prison_alarm_03 none 1.00)
(sound_impulse_start sound\dialog\b30\se_dam_4 none 1.00)))

(script static void basin_victory
(begin
(print the basin is tainted)
(set pee_battle false)
(set pee_battle_music false)
(sound_impulse_start sound\dialog\b30\se_dam_5 none 1.00)
(sleep
(sound_impulse_time sound\dialog\b30\se_dam_5))
(fade_out 0.00 0.00 0.00 15)
(sleep 15)
(if
(>
(object_get_health basin_victory) 0.00)
(begin
(object_teleport basin_victory hide_player_pee_pee)
(set alert_level 0)
(show_hud_help_text false)
(player_set_weapons basin_victory unarmed true)
(set pee_weapon0 false)
(player_set_weapons basin_victory unarmed true)
(set pee_weapon1 false)
(ai_erase basin) basin_victory
(sleep 5)
(game_save_cancel)
(if basin_victory basin_victory) basin_victory
(sound_looping_stop sound\sfx\devices\alarms\alarm_01_loop) basin_victory
(ai_erase basin_zombies)))))

(script continuous void pee_weapon
(begin
(if pee_battle
(begin
(show_hud_help_text false)
(if
(or
(volume_test_object pee_zone_1 pee_weapon)
(volume_test_object pee_zone_2 pee_weapon)
(volume_test_object pee_zone_3 pee_weapon)
(volume_test_object pee_zone_4 pee_weapon))
(begin
(show_hud_help_text_for_player true pee_weapon)
(hud_set_help_text pee_help)
(if
(not pee_weapon0)
(begin
(player_set_weapons pee_weapon peepee true)
(set pee_weapon0 true))))
(begin
(if pee_weapon0
(begin
(player_set_weapons pee_weapon unarmed true)
(set pee_weapon0 false)))))
(if
(game_is_cooperative)
(if
(or
(volume_test_object pee_zone_1 pee_weapon)
(volume_test_object pee_zone_2 pee_weapon)
(volume_test_object pee_zone_3 pee_weapon)
(volume_test_object pee_zone_4 pee_weapon))
(begin
(show_hud_help_text_for_player true pee_weapon)
(hud_set_help_text pee_help)
(if
(not pee_weapon1)
(begin
(player_set_weapons pee_weapon peepee true)
(set pee_weapon1 true))))
(begin
(if pee_weapon1
(begin
(player_set_weapons pee_weapon unarmed true)
(set pee_weapon1 false))))))
(sleep 15)))))

(script continuous void urine_test
(begin
(if pee_battle
(begin
(if
(and
(= alert_level 0)
(<
(object_get_health pee_pee_target) 1.00)) urine_test)
(if
(and
(= alert_level 1)
(<
(object_get_health pee_pee_target) pee_level_1)) urine_test)
(if
(and
(= alert_level 2)
(<
(object_get_health pee_pee_target) pee_level_2)) urine_test)
(if
(and
(= alert_level 3)
(<
(object_get_health pee_pee_target) pee_level_3)) urine_test)
(if
(and
(= alert_level 4)
(=
(object_get_health pee_pee_target) 0.00)) urine_test)))
(sleep 15)))

(script continuous void motivate
(begin
(if pee_battle
(ai_command_list basin/control_room run to hill))
(sleep 150)))

(script continuous void vat_1
(begin
(sleep_until
(and
(= pee_battle true)
(or
(and
(volume_test_objects vat_1 vat_1)
(not
(volume_test_objects vat_1_safe_area vat_1)))
(and
(volume_test_objects vat_1 vat_1)
(not
(volume_test_objects vat_1_safe_area vat_1))))) 10)
(print fell into vat 1)
(if
(and
(volume_test_objects vat_1 vat_1)
(not
(volume_test_objects vat_1_safe_area vat_1)))
(set teleport_player vat_1)
(set teleport_player vat_1))
(if
(not
(object_is_instance teleport_player characters\stubbs\stubbs))
(begin
(damage_object globals\falling teleport_player)
(if
(not
(game_is_cooperative))
(begin
(player_enable_input false)
(player_camera_control false)
(camera_control true 0)
(camera_set vat_1_view 30)
(sleep 90)
(player_enable_input true)
(player_camera_control true)
(camera_control false 30))))
(begin
(if
(not
(game_is_cooperative))
(begin
(player_enable_input false)
(player_camera_control false)
(camera_control true 0)
(camera_set vat_1_view 30)
(sleep 30)
(camera_set pipe_exit_1 30)
(sleep 30)
(object_teleport teleport_player pipe_exit_1)
(custom_animation vat_1 cinematics\animations\stubbs\b30\b30 drainfall false)
(sleep 75)
(player_enable_input true)
(player_camera_control true)
(camera_control false 30))
(begin
(object_teleport teleport_player pipe_exit_1)))))))

(script continuous void vat_2
(begin
(sleep_until
(and
(= pee_battle true)
(or
(and
(volume_test_objects vat_2 vat_2)
(not
(volume_test_objects vat_2_safe_area vat_2)))
(and
(volume_test_objects vat_2 vat_2)
(not
(volume_test_objects vat_2_safe_area vat_2))))) 10)
(if
(and
(volume_test_objects vat_2 vat_2)
(not
(volume_test_objects vat_2_safe_area vat_2)))
(set teleport_player vat_2)
(set teleport_player vat_2))
(if
(not
(object_is_instance teleport_player characters\stubbs\stubbs))
(begin
(damage_object globals\falling teleport_player)
(if
(not
(game_is_cooperative))
(begin
(player_enable_input false)
(player_camera_control false)
(camera_control true 0)
(camera_set vat_2_view 30)
(sleep 90)
(player_enable_input true)
(player_camera_control true)
(camera_control false 30))))
(begin
(if
(not
(game_is_cooperative))
(begin
(player_enable_input false)
(player_camera_control false)
(camera_control true 0)
(camera_set vat_2_view 30)
(sleep 30)
(camera_set pipe_exit_2 30)
(sleep 30)
(object_teleport teleport_player pipe_exit_2)
(custom_animation vat_2 cinematics\animations\stubbs\b30\b30 drainfall false)
(sleep 75)
(player_enable_input true)
(player_camera_control true)
(camera_control false 30))
(object_teleport teleport_player pipe_exit_2))))))

(script continuous void vat_3
(begin
(sleep_until
(and
(= pee_battle true)
(or
(and
(volume_test_objects vat_3 vat_3)
(not
(volume_test_objects vat_3_safe_area vat_3)))
(and
(volume_test_objects vat_3 vat_3)
(not
(volume_test_objects vat_3_safe_area vat_3))))) 10)
(if
(and
(volume_test_objects vat_3 vat_3)
(not
(volume_test_objects vat_3_safe_area vat_3)))
(set teleport_player vat_3)
(set teleport_player vat_3))
(if
(not
(object_is_instance teleport_player characters\stubbs\stubbs))
(begin
(damage_object globals\falling teleport_player)
(if
(not
(game_is_cooperative))
(begin
(player_enable_input false)
(player_camera_control false)
(camera_control true 0)
(camera_set vat_3_view 30)
(sleep 90)
(player_enable_input true)
(player_camera_control true)
(camera_control false 30))))
(begin
(if
(not
(game_is_cooperative))
(begin
(player_enable_input false)
(player_camera_control false)
(camera_control true 0)
(camera_set vat_3_view 30)
(sleep 30)
(camera_set pipe_exit_3 30)
(sleep 30)
(object_teleport teleport_player pipe_exit_3)
(custom_animation vat_3 cinematics\animations\stubbs\b30\b30 drainfall false)
(sleep 75)
(player_enable_input true)
(player_camera_control true)
(camera_control false 30))
(object_teleport teleport_player pipe_exit_3))))))

(script continuous void vat_4
(begin
(sleep_until
(and
(= pee_battle true)
(or
(and
(volume_test_objects vat_4 vat_4)
(not
(volume_test_objects vat_4_safe_area vat_4)))
(and
(volume_test_objects vat_4 vat_4)
(not
(volume_test_objects vat_4_safe_area vat_4))))) 10)
(if
(and
(volume_test_objects vat_4 vat_4)
(not
(volume_test_objects vat_4_safe_area vat_4)))
(set teleport_player vat_4)
(set teleport_player vat_4))
(if
(not
(object_is_instance teleport_player characters\stubbs\stubbs))
(begin
(damage_object globals\falling teleport_player)
(if
(not
(game_is_cooperative))
(begin
(player_enable_input false)
(player_camera_control false)
(camera_control true 0)
(camera_set vat_4_view 30)
(sleep 90)
(player_enable_input true)
(player_camera_control true)
(camera_control false 30))))
(begin
(if
(not
(game_is_cooperative))
(begin
(player_enable_input false)
(player_camera_control false)
(camera_control true 0)
(camera_set vat_4_view 30)
(sleep 30)
(camera_set pipe_exit_4 30)
(sleep 30)
(object_teleport teleport_player pipe_exit_4)
(custom_animation vat_4 cinematics\animations\stubbs\b30\b30 drainfall false)
(sleep 75)
(player_enable_input true)
(player_camera_control true)
(camera_control false 30))
(object_teleport teleport_player pipe_exit_4))))))

(script startup void dam_top_wake_enemies
(begin
(sleep_until
(and damtop
(or
(<
(ai_strength dam_top) 0.99)
(volume_test_objects dam_top_begin_combat
(players_current)))) 15)
(print wakeup dam top enemies)
(ai_disregard
(players_current) false)
(ai_disregard dam_top_wake_enemies false)
(ai_disregard dam_top_wake_enemies false)
(ai_playfight dam_top false)
(ai_set_blind dam_top false)
(ai_set_deaf dam_top false)))

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

(script continuous void dam_top_deadly_air
(begin
(sleep_until
(and
(or damtop track)
(volume_test_objects deadly_air_area
(players_current))) 15)
(if
(volume_test_objects deadly_air_area dam_top_deadly_air)
(damage_object globals\falling dam_top_deadly_air))
(if
(volume_test_objects deadly_air_area dam_top_deadly_air)
(damage_object globals\falling dam_top_deadly_air))))

(script continuous void dam_top_deadly_water
(begin
(sleep_until
(and
(or damtop pee_battle)
(volume_test_objects deep_deadly_water0
(players_current))) 15)
(if
(volume_test_objects deep_deadly_water0 dam_top_deadly_water)
(begin
(set teleport_player dam_top_deadly_water)
(damage_object globals\falling dam_top_deadly_water)))
(if
(volume_test_objects deep_deadly_water0 dam_top_deadly_water)
(begin
(set teleport_player dam_top_deadly_water)
(damage_object globals\falling dam_top_deadly_water)))
(if
(not
(game_is_cooperative))
(begin dam_top_deadly_water
(player_enable_input false)
(player_camera_control false)
(camera_control true 0)
(camera_set drown_flag 30)
(sleep 90)
(player_enable_input true)
(player_camera_control true)
(camera_control false 30)))
(sleep 30)))

(script continuous void dam_top_shallow_water
(begin
(sleep_until
(and damtop
(or
(volume_test_objects shallow_deadly_water0
(players_current))
(volume_test_objects shallow_deadly_water1
(players_current)))))
(apply_impulse shallow_deadly_water0 pp_genc_shock_direction_back 0.00 0.00 effects\power_plant\drown)
(apply_impulse shallow_deadly_water1 pp_genc_shock_direction_back 0.00 0.00 effects\power_plant\drown)))

(script startup void dam_top_save
(begin
(sleep_until
(and
(= damtop true)
(volume_test_objects dam_top_save_start
(players_current))))
(print save game - dam top) dam_top_save))

(script startup void dam_top_midpoint_save
(begin
(sleep_until
(and
(= damtop true)
(volume_test_objects damtop_midpoint_save
(players_current))))
(print save game - dam top mid point) dam_top_midpoint_save))

(script startup void dam_top_endpoint_save
(begin
(sleep_until
(and
(= damtop true)
(volume_test_objects damtop_endpoint_save
(players_current))))
(print save game - dam top end point) dam_top_endpoint_save))

(script startup void dam_top_spawn_boomsticks
(begin
(sleep_until
(and
(= damtop true)
(volume_test_objects spawn_boomstick_squad
(players_current))))
(print spawning boomstick squad)
(ai_place dam_top/boomstick_squad)))

(script startup void dam_top_spawn_squad_b
(begin
(sleep_until
(and
(and
(= damtop true)
(= dam_top_squads_spawned 1))
(<
(ai_strength dam_top/squad_a) 0.40)))
(set dam_top_squads_spawned 2)
(print spawning squad b)
(ai_place dam_top/squad_b)))

(script startup void dam_top_spawn_squad_c
(begin
(sleep_until
(and
(and
(= damtop true)
(= dam_top_squads_spawned 2))
(<
(ai_strength dam_top/squad_b) 0.40)))
(set dam_top_squads_spawned 3)
(print spawning squad c)
(ai_place dam_top/squad_c)))

(script startup void dam_top_spawn_jetpack
(begin
(sleep_until
(and
(= damtop true)
(volume_test_objects dam_top_jetpack_spawn
(players_origin))))
(print spawning jetpacks)
(ai_place dam_top_jetpack/jetpack)
(sleep 120)
(ai_disregard
(players_current) true)
(ai_playfight dam_top_jetpack true)
(ai_playfight dam_top true)
(ai_set_blind dam_top true)
(ai_set_deaf dam_top true)
(ai_braindead dam_top true) dam_top_spawn_jetpack
(camera_set view_dam_top_jetpacks 30)
(sleep 60)
(sound_impulse_start sound\dialog\security2_combat\advance
(list_get
(ai_actors dam_top_jetpack/jetpack) 0) 1.00)
(sleep 60)
(sound_impulse_start sound\dialog\security2_combat\advance
(list_get
(ai_actors dam_top_jetpack/jetpack) 1) 1.00)
(sleep 60)
(sound_impulse_start sound\dialog\security3_combat\advance
(list_get
(ai_actors dam_top_jetpack/jetpack) 0) 1.00) dam_top_spawn_jetpack
(ai_disregard
(players_current) false)
(ai_disregard dam_top_spawn_jetpack false)
(ai_disregard dam_top_spawn_jetpack false)
(ai_playfight dam_top_jetpack false)
(ai_playfight dam_top false)
(ai_set_blind dam_top false)
(ai_set_deaf dam_top false)
(ai_braindead dam_top false)))

(script startup void dam_top_elevator
(begin
(sleep_until
(volume_test_objects dam_top_elevator_trigger
(players_origin))) dam_top_elevator
(ai_disregard
(players_current) true)
(ai_playfight dam_top true)
(ai_playfight dam_top_jetpack true) dam_top_elevator
(camera_set se_dam_elevator1 30)
(sleep 30)
(device_set_position dam_top_elevator 1.00)
(sleep 90)
(fade_out 0.00 0.00 0.00 15)
(device_set_position dam_top_elevator 0.00)
(sleep 30)
(fade_in 0.00 0.00 0.00 15)
(camera_set_relative se_dam_elevator2 0 dam_top_elevator)
(object_teleport dam_top_elevator dam_top_elevator_position)
(sleep 150)
(fade_out 0.00 0.00 0.00 15)
(switch_bsp 2)
(object_teleport dam_top_elevator powerplant_start)
(camera_set se_powerplant_elevator 0)
(device_set_position_immediate powerplant_elevator 0.10)
(fade_in 0.00 0.00 0.00 15)
(sleep 15)
(device_set_position powerplant_elevator 0.00)
(sleep 10)
(recording_play dam_top_elevator run_out_of_elevator)
(sleep 40) dam_top_elevator
(ai_disregard
(players_current) false)
(ai_disregard dam_top_elevator false)
(ai_disregard dam_top_elevator false)
(ai_playfight dam_top false)
(ai_playfight dam_top_jetpack false) dam_top_elevator))

(script startup void power_plant_save
(begin
(sleep_until
(and
(= powerplant true)
(volume_test_objects power_plant_save_entrance
(players_current))))
(print save game - power plant)
(volume_teleport_players_not_inside power_plant_save_entrance power_plant_coop_spawn) power_plant_save))

(script static void activate_powerplant_overload
(begin
(print powerplant is overloaded)
(set powerplant_overload true)
(device_set_power dg_switch1 0.00)
(device_set_power dg_switch2 0.00)
(device_set_power dg_switch3 0.00)
(ai_disregard
(players_current) true)
(ai_playfight power_plant true) activate_powerplant_overload
(ai_braindead power_plant true)
(camera_set se_power_plant_door 45)
(ai_place power_plant/final_battle)
(ai_set_blind power_plant false)
(ai_set_deaf power_plant false)
(device_set_position powerplant_door 1.00)
(ai_braindead power_plant/final_battle false)
(sleep_until
(>
(device_get_position powerplant_door) 0.90))
(ai_command_list power_plant/final_battle power_plant_run_in)
(sleep 90) activate_powerplant_overload
(ai_disregard
(players_current) false)
(ai_disregard activate_powerplant_overload false)
(ai_disregard activate_powerplant_overload false)
(ai_playfight power_plant false)
(ai_braindead power_plant false)))

(script continuous void powerplant_overload
(begin
(if
(and
(= powerplant true)
(= powerplant_overload false))
(begin
(if
(and
(=
(device_get_position dg_switch1) 1.00)
(=
(device_get_position dg_switch2) 1.00)
(=
(device_get_position dg_switch3) 1.00)) powerplant_overload)))
(sleep 30)))

(script static void powerplant_begin_combat
(begin
(if
(not power_plant_combat_begun)
(begin
(print powerplant combat has begun!)
(ai_set_blind power_plant false)
(ai_set_deaf power_plant false)
(set power_plant_combat_begun true)
(ai_conversation_stop pp_scientist_chatter)
(ai_conversation_stop pp_scientist_chatter2)
(ai_conversation_stop pp_scientist_chatter3)
(ai_conversation_stop pp_scientist_chatter4)
(ai_command_list_advance power_plant)
(ai_command_list power_plant/gen_a guard_gen_1)
(ai_command_list power_plant/gen_b guard_gen_2)
(ai_command_list power_plant/gen_c guard_gen_3)))))

(script startup void powerplant_combat_begun
(begin
(sleep_until
(and
(= powerplant true)
(<
(ai_strength power_plant) 1.00)) 15) powerplant_combat_begun))

(script startup void check_scientist_chatter_2
(begin
(sleep_until
(and
(= powerplant true)
(volume_test_objects pp_scientist_chatter_2_check
(players_current))))
(if
(not power_plant_combat_begun)
(begin
(print start scientist 2 chatter)
(ai_conversation pp_scientist_chatter2)))))

(script startup void check_scientist_chatter_3
(begin
(sleep_until
(and
(= powerplant true)
(volume_test_objects pp_scientist_chatter_3_check
(players_current))))
(if
(not power_plant_combat_begun)
(begin
(print start scientist 3 chatter)
(ai_conversation pp_scientist_chatter3)))))

(script startup void check_scientist_chatter_4
(begin
(sleep_until
(and
(= powerplant true)
(volume_test_objects pp_scientist_chatter_4_check
(players_current))))
(if
(not power_plant_combat_begun)
(begin
(print start scientist 4 chatter)
(ai_conversation pp_scientist_chatter4)))))

(script continuous void apply_shockzone_a_damage
(begin
(if powerplant
(begin
(if
(=
(device_get_position dg_switch3) 1.00)
(begin
(apply_impulse pp_gena_shockzone_top pp_genc_shock_direction_back 0.10 1.00 effects\power_plant\shock_knockback)
(apply_impulse pp_gena_shockzone_back pp_genc_shock_direction_back 0.10 1.00 effects\power_plant\shock_knockback)
(apply_impulse pp_gena_shockzone_left pp_genc_shock_direction_left 0.10 1.00 effects\power_plant\shock_knockback)
(apply_impulse pp_gena_shockzone_right pp_genc_shock_direction_right 0.10 1.00 effects\power_plant\shock_knockback)))
(if
(=
(device_get_position dg_switch2) 1.00)
(begin
(apply_impulse pp_genb_shockzone_top pp_genc_shock_direction_back 0.10 1.00 effects\power_plant\shock_knockback)
(apply_impulse pp_genb_shockzone_back pp_genc_shock_direction_back 0.10 1.00 effects\power_plant\shock_knockback)
(apply_impulse pp_genb_shockzone_left pp_genc_shock_direction_left 0.10 1.00 effects\power_plant\shock_knockback)
(apply_impulse pp_genb_shockzone_right pp_genc_shock_direction_right 0.10 1.00 effects\power_plant\shock_knockback)))
(if
(=
(device_get_position dg_switch1) 1.00)
(begin
(apply_impulse pp_genc_shockzone_top pp_genc_shock_direction_back 0.10 1.00 effects\power_plant\shock_knockback)
(apply_impulse pp_genc_shockzone_gen pp_genc_shock_direction_back 0.10 1.00 effects\power_plant\shock_knockback)
(apply_impulse pp_genc_shockzone_left pp_genc_shock_direction_left 0.10 1.00 effects\power_plant\shock_knockback)
(apply_impulse pp_genc_shockzone_right pp_genc_shock_direction_right 0.10 1.00 effects\power_plant\shock_knockback)))))
(sleep 15)))

(script continuous void powerplant_check_generators
(begin
(if
(and
(not powerplant_overload)
(= powerplant true))
(begin
(object_set_function_value gen_c_lightning a
(device_get_position dg_switch1))
(object_set_function_value gen_b_lightning a
(device_get_position dg_switch2))
(object_set_function_value gen_a_lightning a
(device_get_position dg_switch3))))
(sleep 10)))

(script continuous void powerplant_generator_audio_1
(begin
(sleep_until
(and
(= powerplant true)
(=
(device_get_position dg_switch1) 1.00)) 10)
(object_create gen_1_sound)
(sleep_until
(=
(device_get_position dg_switch1) 0.00))
(object_destroy gen_1_sound)))

(script continuous void powerplant_generator_audio_2
(begin
(sleep_until
(and
(= powerplant true)
(=
(device_get_position dg_switch2) 1.00)) 10)
(object_create gen_2_sound)
(sleep_until
(=
(device_get_position dg_switch2) 0.00))
(object_destroy gen_2_sound)))

(script continuous void powerplant_generator_audio_3
(begin
(sleep_until
(and
(= powerplant true)
(=
(device_get_position dg_switch3) 1.00)) 10)
(object_create gen_3_sound)
(sleep_until
(=
(device_get_position dg_switch3) 0.00))
(object_destroy gen_3_sound)))

(script startup void powerplant_access_locked_exit
(begin
(sleep_until
(and powerplant
(<
(device_get_position powerplant_door) 0.90)
(volume_test_objects powerplant_exit_locked
(players_current))))
(ai_disregard
(players_current) true)
(ai_playfight power_plant true) powerplant_access_locked_exit
(camera_set se_pp_gen_1 30)
(sleep 30)
(camera_set se_pp_gen_2 30)
(sleep 30)
(camera_set se_pp_gen_3 30)
(sleep 30) powerplant_access_locked_exit
(ai_disregard
(players_current) false)
(ai_disregard powerplant_access_locked_exit false)
(ai_disregard powerplant_access_locked_exit false)
(ai_playfight power_plant false)))

(script static short count_generators_active
(begin
(+
(if
(=
(device_get_position dg_switch1) 1.00) 1.00 0.00)
(if
(=
(device_get_position dg_switch2) 1.00) 1.00 0.00)
(if
(=
(device_get_position dg_switch3) 1.00) 1.00 0.00))))

(script startup void powerplant_view_lightning_1
(begin
(sleep_until
(and powerplant
(=
(device_get_position dg_switch1) 1.00)
(< powerplant_view_lightning_1 3)))
(ai_disregard
(players_current) true)
(ai_playfight power_plant true) powerplant_view_lightning_1
(camera_set gen_lightning_view1 30)
(sleep 120) powerplant_view_lightning_1
(ai_disregard
(players_current) false)
(ai_disregard powerplant_view_lightning_1 false)
(ai_disregard powerplant_view_lightning_1 false)
(ai_playfight power_plant false) powerplant_view_lightning_1))

(script startup void powerplant_view_lightning_2
(begin
(sleep_until
(and powerplant
(=
(device_get_position dg_switch2) 1.00)
(< powerplant_view_lightning_2 3)))
(ai_disregard
(players_current) true)
(ai_playfight power_plant true) powerplant_view_lightning_2
(camera_set gen_lightning_view2 30)
(sleep 120) powerplant_view_lightning_2
(ai_disregard
(players_current) false)
(ai_disregard powerplant_view_lightning_2 false)
(ai_disregard powerplant_view_lightning_2 false)
(ai_playfight power_plant false) powerplant_view_lightning_2))

(script startup void powerplant_view_lightning_3
(begin
(sleep_until
(and powerplant
(=
(device_get_position dg_switch3) 1.00)
(< powerplant_view_lightning_3 3)))
(ai_playfight power_plant true)
(ai_disregard
(players_current) true) powerplant_view_lightning_3
(camera_set gen_lightning_view3 30)
(sleep 120) powerplant_view_lightning_3
(ai_disregard
(players_current) false)
(ai_disregard powerplant_view_lightning_3 false)
(ai_disregard powerplant_view_lightning_3 false)
(ai_playfight power_plant false) powerplant_view_lightning_3))

(script continuous void powerplant_zombie_cleanup
(begin
(sleep_until
(and powerplant
(not powerplant_overload) pp_spawn_continuous
(>
(ai_living_count power_plant_zombies) 10)))
(print zombies overflowing, go lemming yourself)
(ai_command_list power_plant_zombies zombie_suicide)
(sleep 300)))

(script startup void powerplant_spawn_newcomers
(begin
(sleep_until
(and powerplant
(not powerplant_overload)
(= powerplant_spawn_newcomers 1)
(not
(volume_test_objects pp_close_doorway
(players_current)))))
(print spawning scientists)
(ai_place power_plant/spawning_scientists)
(device_set_position powerplant_door 1.00)
(sleep_until
(>
(device_get_position powerplant_door) 0.99))
(ai_command_list power_plant/spawning_scientists pp_run_in_non_interupt)
(sleep 150)
(sleep_until
(and powerplant
(not powerplant_overload)))
(device_set_position powerplant_door 0.00)
(sleep_until
(<
(device_get_position powerplant_door) 0.10))
(apply_impulse kill_left_behind pp_genc_shock_direction_left 0.00 0.00 globals\falling)
(sleep_until
(and powerplant
(not powerplant_overload)
(= powerplant_spawn_newcomers 2)
(not
(volume_test_objects pp_close_doorway
(players_current)))
(<
(ai_strength power_plant/spawning_scientists) 0.10)
(<
(ai_living_count power_plant_zombies) 12)))
(print spawning scientists)
(ai_place power_plant/spawning_scientists)
(device_set_position powerplant_door 1.00)
(sleep_until
(>
(device_get_position powerplant_door) 0.99))
(ai_command_list power_plant/spawning_scientists pp_run_in_non_interupt)
(sleep 150)
(sleep_until
(and powerplant
(not powerplant_overload)))
(device_set_position powerplant_door 0.00)
(sleep_until
(<
(device_get_position powerplant_door) 0.10))
(apply_impulse kill_left_behind pp_genc_shock_direction_left 0.00 0.00 globals\falling)
(set pp_spawn_continuous true)
(print start continuous spawning)))

(script continuous void powerplant_spawn_continuous
(begin
(sleep_until
(and powerplant
(not powerplant_overload) pp_spawn_continuous
(> powerplant_spawn_continuous 0)
(<
(ai_strength power_plant/spawning_scientists) 0.10)))
(sleep 1500)
(sleep_until
(and powerplant
(not powerplant_overload)
(<
(ai_strength power_plant/spawning_scientists) 0.10)
(not
(volume_test_objects pp_close_doorway
(players_current)))
(volume_test_objects pp_spawn_doorway
(players_current))
(and
(<
(unit_special_attack_get_count powerplant_spawn_continuous 2) 1)
(<
(unit_special_attack_get_count powerplant_spawn_continuous 2) 1))))
(print spawning scientists)
(ai_place power_plant/spawning_scientists)
(device_set_position powerplant_door 1.00)
(sleep_until
(>
(device_get_position powerplant_door) 0.99))
(ai_command_list power_plant/spawning_scientists pp_run_in_non_interupt)
(sleep 150)
(sleep_until
(and powerplant
(not powerplant_overload)))
(device_set_position powerplant_door 0.00)
(sleep_until
(<
(device_get_position powerplant_door) 0.10))
(apply_impulse kill_left_behind pp_genc_shock_direction_left 0.00 0.00 globals\falling)))

(script continuous void emergency_close_pp_exit
(begin
(sleep_until
(and powerplant
(not powerplant_overload)
(volume_test_objects pp_close_doorway
(players_current))
(>
(device_get_position powerplant_door) 0.99)))
(device_set_position powerplant_door 0.00)
(sleep_until
(<
(device_get_position powerplant_door) 0.10))))

(script continuous void check_player_track_location
(begin
(sleep_until track)
(if
(volume_test_objects dam_track_lr
(players_current))
(set player_track_location 0)
(if
(volume_test_objects dam_track_ll
(players_current))
(set player_track_location 1)
(if
(volume_test_objects dam_track_ul
(players_current))
(set player_track_location 2)
(if
(volume_test_objects dam_track_ur
(players_current))
(set player_track_location 3)))))))

(script startup void track_save
(begin
(sleep_until
(and track
(volume_test_objects track_save_entrance
(players_current))))
(print save game - track)
(volume_teleport_players_not_inside track_save_entrance track_coop_spawn) track_save))

(script continuous void electrode_cleaner
(begin
(if track
(begin
(if
(=
(vehicle_driver electrode_ll) none)
(begin
(set zap_zombie_ll null_zombie)
(object_set_function_value damlightning b 0.00)
(ai_prefer_target zap_zombie_ll false)))
(if
(=
(vehicle_driver electrode_lr) none)
(begin
(set zap_zombie_lr null_zombie)
(object_set_function_value damlightning a 0.00)
(ai_prefer_target zap_zombie_lr false)))
(if
(=
(vehicle_driver electrode_ur) none)
(begin
(set zap_zombie_ur null_zombie)
(object_set_function_value damlightning c 0.00)
(ai_prefer_target zap_zombie_ur false)))
(if
(=
(vehicle_driver electrode_ul) none)
(begin
(set zap_zombie_ul null_zombie)
(object_set_function_value damlightning d 0.00)
(ai_prefer_target zap_zombie_ul false)))))
(sleep 30)))

(script continuous void lightning_damage_electrode
(begin
(sleep_until track)
(if electrode_ll_shocking
(begin
(apply_impulse electrode_ll_shockzone0 electrode_direction 0.10 1.00 effects\power_plant\shock_knockback)
(apply_impulse electrode_ll_shockzone1 electrode_direction 0.10 1.00 effects\power_plant\shock_knockback)))
(if electrode_lr_shocking
(begin
(apply_impulse electrode_lr_shockzone0 electrode_direction 0.10 1.00 effects\power_plant\shock_knockback)
(apply_impulse electrode_lr_shockzone1 electrode_direction 0.10 1.00 effects\power_plant\shock_knockback)))
(if electrode_ul_shocking
(begin
(apply_impulse electrode_ul_shockzone0 electrode_direction 0.10 1.00 effects\power_plant\shock_knockback)))
(if electrode_ur_shocking
(begin
(apply_impulse electrode_ur_shockzone0 electrode_direction 0.10 1.00 effects\power_plant\shock_knockback)))
(if shocking_dam
(begin
(apply_impulse electrode_wall_shockzone0 electrode_direction 0.10 1.00 effects\power_plant\shock_knockback)
(apply_impulse electrode_wall_shockzone1 electrode_direction 0.10 1.00 effects\power_plant\shock_knockback)))
(sleep 15)))

(script continuous void zombie_enter_electrode
(begin
(if track
(begin
(if
(!=
(vehicle_driver electrode_ll) none)
(begin
(if
(not electrode_ll_shocking)
(sleep 120))
(set electrode_ll_shocking true)
(set zap_zombie_ll
(vehicle_driver electrode_ll))
(object_set_function_value damlightning b 1.00)
(ai_prefer_target zap_zombie_ll true))
(set electrode_ll_shocking false))
(if
(!=
(vehicle_driver electrode_lr) none)
(begin
(if
(not electrode_lr_shocking)
(sleep 120))
(set electrode_lr_shocking true)
(set zap_zombie_lr
(vehicle_driver electrode_lr))
(object_set_function_value damlightning a 1.00)
(ai_prefer_target zap_zombie_lr true))
(set electrode_lr_shocking false))
(if
(!=
(vehicle_driver electrode_ur) none)
(begin
(if
(not electrode_ur_shocking)
(sleep 120))
(set electrode_ur_shocking true)
(set zap_zombie_ur
(vehicle_driver electrode_ur))
(object_set_function_value damlightning c 1.00)
(ai_prefer_target zap_zombie_ur true))
(set electrode_ur_shocking false))
(if
(!=
(vehicle_driver electrode_ul) none)
(begin
(if
(not electrode_ul_shocking)
(sleep 120))
(set electrode_ul_shocking true)
(set zap_zombie_ul
(vehicle_driver electrode_ul))
(object_set_function_value damlightning d 1.00)
(ai_prefer_target zap_zombie_ul true))
(set electrode_ul_shocking false))))
(sleep 30)))

(script continuous void enter_electrod_lr
(begin
(sleep -1)
(unit_enter_vehicle zombie_into_transformer_lr electrode_lr electrode)))

(script continuous void enter_electrod_ur
(begin
(sleep -1)
(unit_enter_vehicle zombie_into_transformer_ur electrode_ur electrode)))

(script continuous void enter_electrod_ll
(begin
(sleep -1)
(unit_enter_vehicle zombie_into_transformer_ll electrode_ll electrode)))

(script continuous void enter_electrod_ul
(begin
(sleep -1)
(unit_enter_vehicle zombie_into_transformer_ul electrode_ul electrode)))

(script continuous void truck_stuck_on_roof
(begin
(sleep_until
(and track
(=
(vehicle_driver hovertruck) none)
(volume_test_objects wind_push_truck_off hovertruck)
(not
(volume_test_objects wind_push_truck_off truck_stuck_on_roof))
(not
(volume_test_objects wind_push_truck_off truck_stuck_on_roof))))
(sleep 90)
(if
(=
(objects_can_see_flag
(players_current) truck_respawn0 90.00) false)
(set truck_spawn_flag truck_respawn0)
(if
(=
(objects_can_see_flag
(players_current) truck_respawn1 90.00) false)
(set truck_spawn_flag truck_respawn1)
(if
(=
(objects_can_see_flag
(players_current) truck_respawn2 90.00) false)
(set truck_spawn_flag truck_respawn2)
(if
(=
(objects_can_see_flag
(players_current) truck_respawn3 90.00) false)
(set truck_spawn_flag truck_respawn3)
(if
(=
(objects_can_see_flag
(players_current) truck_respawn4 90.00) false)
(set truck_spawn_flag truck_respawn4)
(print player can see all the spawn points teleport anyways))))))
(print teleporting truck)
(object_teleport hovertruck truck_spawn_flag)
(sleep 30)))

(script continuous void zombie_exit_truck
(begin
(if track
(begin
(if
(and
(volume_test_objects electrode_zone_ll hovertruck)
(=
(vehicle_driver electrode_ll) none))
(begin
(set zombie_into_transformer
(unit
(list_get
(ai_actors vehicle_zombies/hovertruck) 0)))
(unit_exit_vehicle zombie_into_transformer)
(set zombie_into_transformer_ll zombie_into_transformer)
(sleep 90)
(ai_command_list_by_unit zombie_into_transformer_ll enter_electrode_ll)
(sleep 180)))
(if
(and
(volume_test_objects electrode_zone_lr hovertruck)
(=
(vehicle_driver electrode_lr) none))
(begin
(set zombie_into_transformer
(unit
(list_get
(ai_actors vehicle_zombies/hovertruck) 0)))
(unit_exit_vehicle zombie_into_transformer)
(set zombie_into_transformer_lr zombie_into_transformer)
(sleep 90)
(ai_command_list_by_unit zombie_into_transformer_lr enter_electrode_lr)
(sleep 180)))
(if
(and
(volume_test_objects electrode_zone_ur hovertruck)
(=
(vehicle_driver electrode_ur) none))
(begin
(set zombie_into_transformer
(unit
(list_get
(ai_actors vehicle_zombies/hovertruck) 0)))
(unit_exit_vehicle zombie_into_transformer)
(set zombie_into_transformer_ur zombie_into_transformer)
(sleep 90)
(ai_command_list_by_unit zombie_into_transformer_ur enter_electrode_ur)
(sleep 180)))
(if
(and
(volume_test_objects electrode_zone_ul hovertruck)
(=
(vehicle_driver electrode_ul) none))
(begin
(set zombie_into_transformer
(unit
(list_get
(ai_actors vehicle_zombies/hovertruck) 0)))
(unit_exit_vehicle zombie_into_transformer)
(set zombie_into_transformer_ul zombie_into_transformer)
(sleep 90)
(ai_command_list_by_unit zombie_into_transformer_ul enter_electrode_ul)
(sleep 180)))
(if
(and
(volume_test_objects enter_electrode_ll
(ai_actors dam_base_spawned_zombies))
(=
(vehicle_driver electrode_ll) none))
(begin
(set zombie_into_transformer
(unit
(list_get
(objects_in_volume
(ai_actors dam_base_spawned_zombies) enter_electrode_ll) 0)))
(set zombie_into_transformer_ll zombie_into_transformer)
(ai_command_list_by_unit zombie_into_transformer_ll enter_electrode_ll)
(sleep 180)))
(if
(and
(volume_test_objects enter_electrode_lr
(ai_actors dam_base_spawned_zombies))
(=
(vehicle_driver electrode_lr) none))
(begin
(set zombie_into_transformer
(unit
(list_get
(objects_in_volume
(ai_actors dam_base_spawned_zombies) enter_electrode_lr) 0)))
(set zombie_into_transformer_lr zombie_into_transformer)
(ai_command_list_by_unit zombie_into_transformer_lr enter_electrode_lr)
(sleep 180)))
(if
(and
(volume_test_objects enter_electrode_ul
(ai_actors dam_base_spawned_zombies))
(=
(vehicle_driver electrode_ul) none))
(begin
(set zombie_into_transformer
(unit
(list_get
(objects_in_volume
(ai_actors dam_base_spawned_zombies) enter_electrode_ul) 0)))
(set zombie_into_transformer_ul zombie_into_transformer)
(ai_command_list_by_unit zombie_into_transformer_ul enter_electrode_ul)
(sleep 180)))
(if
(and
(volume_test_objects enter_electrode_ur
(ai_actors dam_base_spawned_zombies))
(=
(vehicle_driver electrode_ur) none))
(begin
(set zombie_into_transformer
(unit
(list_get
(objects_in_volume
(ai_actors dam_base_spawned_zombies) enter_electrode_ur) 0)))
(set zombie_into_transformer_ur zombie_into_transformer)
(ai_command_list_by_unit zombie_into_transformer_ur enter_electrode_ur)
(sleep 180)))
(if
(and
(volume_test_objects enter_electrode_ll
(ai_actors basin_zombies))
(=
(vehicle_driver electrode_ll) none))
(begin
(set zombie_into_transformer
(unit
(list_get
(objects_in_volume
(ai_actors basin_zombies) enter_electrode_ll) 0)))
(set zombie_into_transformer_ll zombie_into_transformer)
(ai_command_list_by_unit zombie_into_transformer_ll enter_electrode_ll)
(sleep 180)))
(if
(and
(volume_test_objects enter_electrode_lr
(ai_actors basin_zombies))
(=
(vehicle_driver electrode_lr) none))
(begin
(set zombie_into_transformer
(unit
(list_get
(objects_in_volume
(ai_actors basin_zombies) enter_electrode_lr) 0)))
(set zombie_into_transformer_lr zombie_into_transformer)
(ai_command_list_by_unit zombie_into_transformer_lr enter_electrode_lr)
(sleep 180)))
(if
(and
(volume_test_objects enter_electrode_ul
(ai_actors basin_zombies))
(=
(vehicle_driver electrode_ul) none))
(begin
(set zombie_into_transformer
(unit
(list_get
(objects_in_volume
(ai_actors basin_zombies) enter_electrode_ul) 0)))
(set zombie_into_transformer_ul zombie_into_transformer)
(ai_command_list_by_unit zombie_into_transformer_ul enter_electrode_ul)
(sleep 180)))
(if
(and
(volume_test_objects enter_electrode_ur
(ai_actors basin_zombies))
(=
(vehicle_driver electrode_ur) none))
(begin
(set zombie_into_transformer
(unit
(list_get
(objects_in_volume
(ai_actors basin_zombies) enter_electrode_ur) 0)))
(set zombie_into_transformer_ur zombie_into_transformer)
(ai_command_list_by_unit zombie_into_transformer_ur enter_electrode_ur)
(sleep 180)))))
(sleep 15)))

(script static void kill_dam
(begin
(print the dam is destroyed)
(set track_music false)
(set track false)
(fade_out 0.00 0.00 0.00 15)
(sleep 15)
(ai false)
(object_teleport kill_dam hide_player)
(object_teleport kill_dam hide_player)
(object_teleport hovertruck hide_truck)
(if
(game_is_cooperative)
(object_teleport kill_dam hide_player2)
(object_teleport kill_dam hide_player2))
(sleep 2)
(game_save_cancel)
(if kill_dam kill_dam) kill_dam
(game_won)))

(script static short electrode_full_count
(begin
(list_count
(ai_actors vehicle_zombies/electrodes))))

(script static bool track_try_to_spawn
(begin
(if
(>= track_spawn_location 4)
(set track_spawn_location 0))
(print attempting to spawn at:)
(inspect track_spawn_location)
(if
(= track_spawn_location 0)
(begin
(set track_spawn_test spawn_attack_electrode_ll)
(if spawn_squad_internal_security
(set track_spawn_squad dam_base_defenders/electrode_ll)))
(if
(= track_spawn_location 1)
(begin
(set track_spawn_test spawn_attack_electrode_lr)
(if spawn_squad_internal_security
(set track_spawn_squad dam_base_defenders/electrode_lr)))
(if
(= track_spawn_location 2)
(begin
(set track_spawn_test spawn_attack_electrode_ur)
(if spawn_squad_internal_security
(set track_spawn_squad dam_base_defenders/electrode_ur)))
(if
(= track_spawn_location 3)
(begin
(set track_spawn_test spawn_attack_electrode_ul)
(if spawn_squad_internal_security
(set track_spawn_squad dam_base_defenders/electrode_ul)))))))
(set track_spawn_location
(+ track_spawn_location 1.00))
(if
(=
(objects_can_see_flag
(players_current) track_spawn_test 90.00) false)
(begin
(print spawning...)
(ai_place track_spawn_squad) true) false)))

(script continuous void track_spawner
(begin
(sleep_until
(and track track_begun
(<
(ai_living_count dam_base_defenders) max_active_track_ai)
(< track_spawner 4)))
(sleep
(+ 1400.00
(random_range 300 600)))
(if
(and track
(<
(ai_living_count dam_base_defenders) max_active_track_ai)
(< track_spawner 4))
(begin
(if
(= player_track_location 0)
(begin
(print spawning... upper left)
(ai_place dam_base_defenders/electrode_ul)
(ai_playfight dam_base_defenders/electrode_ul true)
(ai_try_to_fight_player dam_base_defenders/electrode_ul))
(if
(= player_track_location 1)
(begin
(print spawning... upper right)
(ai_place dam_base_defenders/electrode_ur)
(ai_playfight dam_base_defenders/electrode_ur true)
(ai_try_to_fight_player dam_base_defenders/electrode_ur))
(if
(= player_track_location 2)
(begin
(print spawning... lower right)
(ai_place dam_base_defenders/electrode_lr)
(ai_playfight dam_base_defenders/electrode_lr true)
(ai_try_to_fight_player dam_base_defenders/electrode_lr))
(if
(= player_track_location 3)
(begin
(print spawning... lower left)
(ai_place dam_base_defenders/electrode_ll)
(ai_playfight dam_base_defenders/electrode_ll true)
(ai_try_to_fight_player dam_base_defenders/electrode_ll))))))))))

(script static void spawn_internal_security_basin
(begin
(set spawn_squad_internal_security true)
(set track_spawn_location
(random_range 0 4))
(or spawn_internal_security_basin spawn_internal_security_basin spawn_internal_security_basin spawn_internal_security_basin)))

(script static void view_damaged_dam
(begin
(ai_braindead dam_base_defenders true)
(ai_disregard
(players_current) true)
(ai_playfight dam_base_defenders true) view_damaged_dam
(camera_set shocking_dam_view 30)
(sleep 30)
(sleep 90) view_damaged_dam
(ai_braindead dam_base_defenders false)
(ai_disregard
(players_current) false)
(ai_playfight dam_base_defenders false)
(ai_disregard view_damaged_dam false)
(ai_disregard view_damaged_dam false)))

(script static void spawn_round_one_ul
(begin
(ai_braindead dam_base_defenders true)
(ai_disregard
(players_current) true) spawn_round_one_ul
(camera_set shocking_dam_view 30)
(sleep 30)
(sleep 120)
(ai_braindead dam_base_defenders false)
(ai_place dam_base_defenders/round_1_ul)
(ai_place dam_base_defenders_jetpack/round_1_ul)
(camera_set spawn_ul_view 30)
(sleep 30)
(sleep 120) spawn_round_one_ul
(ai_disregard
(players_current) false)
(ai_disregard spawn_round_one_ul false)
(ai_disregard spawn_round_one_ul false)))

(script static void spawn_round_one_lr
(begin
(ai_braindead dam_base_defenders true)
(ai_disregard
(players_current) true) spawn_round_one_lr
(camera_set shocking_dam_view 30)
(sleep 30)
(sleep 120)
(ai_braindead dam_base_defenders false)
(ai_place dam_base_defenders/round_1_lr)
(ai_place dam_base_defenders_jetpack/round_1_lr)
(camera_set spawn_lr_view 30)
(sleep 30)
(sleep 120) spawn_round_one_lr
(ai_disregard
(players_current) false)
(ai_disregard spawn_round_one_lr false)
(ai_disregard spawn_round_one_lr false)))

(script static void spawn_round_one_defenders
(begin
(if
(or
(= player_track_location 0)
(= player_track_location 3)) spawn_round_one_defenders spawn_round_one_defenders)))

(script static void spawn_round_two_ur
(begin
(ai_braindead dam_base_defenders true)
(ai_disregard
(players_current) true) spawn_round_two_ur
(camera_set shocking_dam_view 30)
(sleep 30)
(sleep 120)
(ai_braindead dam_base_defenders false)
(ai_place dam_base_defenders/round_2_ur)
(ai_place dam_base_defenders_jetpack/round_2_ur)
(camera_set spawn_ur_view 30)
(sleep 30)
(sleep 120) spawn_round_two_ur
(ai_disregard
(players_current) false)
(ai_disregard spawn_round_two_ur false)
(ai_disregard spawn_round_two_ur false)))

(script static void spawn_round_two_ll
(begin
(ai_braindead dam_base_defenders true)
(ai_disregard
(players_current) true) spawn_round_two_ll
(camera_set shocking_dam_view 30)
(sleep 30)
(sleep 120)
(ai_braindead dam_base_defenders false)
(ai_place dam_base_defenders/round_2_ll)
(ai_place dam_base_defenders_jetpack/round_2_ll)
(camera_set spawn_ll_view 30)
(sleep 30)
(sleep 120) spawn_round_two_ll
(ai_disregard
(players_current) false)
(ai_disregard spawn_round_two_ll false)
(ai_disregard spawn_round_two_ll false)))

(script static void spawn_round_two_defenders
(begin
(if
(or
(= player_track_location 0)
(= player_track_location 3)) spawn_round_two_defenders spawn_round_two_defenders)))

(script static void spawn_round_three_right
(begin
(ai_braindead dam_base_defenders true)
(ai_disregard
(players_current) true) spawn_round_three_right
(camera_set shocking_dam_view 30)
(sleep 30)
(sleep 120)
(ai_braindead dam_base_defenders false)
(ai_place dam_base_defenders/round_3_right)
(ai_place dam_base_defenders_jetpack/round_3_right)
(camera_set spawn_ur_view 30)
(sleep 30)
(sleep 90)
(camera_set spawn_lr_view 30)
(sleep 30)
(sleep 90) spawn_round_three_right
(ai_disregard
(players_current) false)
(ai_disregard spawn_round_three_right false)
(ai_disregard spawn_round_three_right false)))

(script static void spawn_round_three_left
(begin
(ai_braindead dam_base_defenders true)
(ai_disregard
(players_current) true) spawn_round_three_left
(camera_set shocking_dam_view 30)
(sleep 30)
(sleep 120)
(ai_braindead dam_base_defenders false)
(ai_place dam_base_defenders/round_3_left)
(ai_place dam_base_defenders_jetpack/round_3_left)
(camera_set spawn_ul_view 30)
(sleep 30)
(sleep 90)
(camera_set spawn_ll_view 30)
(sleep 30)
(sleep 90) spawn_round_three_left
(ai_disregard
(players_current) false)
(ai_disregard spawn_round_three_left false)
(ai_disregard spawn_round_three_left false)))

(script static void spawn_round_three_defenders
(begin
(if
(or
(= player_track_location 0)
(= player_track_location 3)) spawn_round_three_defenders spawn_round_three_defenders)))

(script continuous void shock_dam
(begin
(if track
(begin
(if
(= shock_dam 4)
(begin
(if
(not shocking_dam)
(sleep 120))
(set shocking_dam true)
(print shocking dam)
(object_set_function_value damlightning_wall a 1.00)
(set dam_health
(- dam_health 1.00))
(if
(<= dam_health 0)
(begin
(print dam destroyed)
(set dam_state 0) shock_dam
(game_save)))
(if
(and
(= dam_state 4)
(<= dam_health dam_barely_damaged))
(begin
(print dam barely damaged)
(set dam_state 3) shock_dam
(object_create walla) shock_dam))
(if
(and
(= dam_state 3)
(<= dam_health dam_damaged))
(begin
(if
(or
(=
(game_difficulty_get) hard)
(=
(game_difficulty_get) impossible))
(begin
(print dam badly damaged) shock_dam
(set dam_state 2)
(object_destroy walla)
(object_create wallb) shock_dam)
(begin
(print dam destroyed)
(object_destroy walla)
(object_create wallc)
(set dam_state 0) shock_dam
(game_save)))))
(if
(and
(= dam_state 2)
(<= dam_health dam_severely_damaged))
(begin
(if
(=
(game_difficulty_get) impossible)
(begin
(print dam severely damaged) shock_dam
(set dam_state 1)
(object_destroy wallb)
(object_create wallc) shock_dam)
(begin
(object_destroy wallb)
(object_create wallc)
(print dam destroyed)
(set dam_state 0) shock_dam
(game_save))))))
(begin
(object_set_function_value damlightning_wall a 0.00)
(set shocking_dam false)))))
(sleep 30)))

(script continuous void dam_shock_sounds
(begin
(sleep_until track)
(if
(= dam_shock_sounds 4)
(begin
(if
(not dam_being_shocked)
(begin
(sound_looping_start sound\sfx\devices\b30_dam\dam_shock_major damlightning 1.00)
(set dam_being_shocked true))))
(begin
(if dam_being_shocked
(begin
(sound_looping_stop sound\sfx\devices\b30_dam\dam_shock_major)
(set dam_being_shocked false)))))
(if
(= dam_shock_sounds 4)
(begin
(if
(not dam_being_shocked)
(begin
(sound_looping_start sound\sfx\devices\b30_dam\dam_shock_major damlightning 1.00)
(set dam_being_shocked true))))
(begin
(if dam_being_shocked
(begin
(sound_looping_stop sound\sfx\devices\b30_dam\dam_shock_major)
(set dam_being_shocked false)))))
(if
(=
(vehicle_driver electrode_ll) none)
(begin
(if electrode_sound_ll
(begin
(sound_looping_stop sound\sfx\devices\b30_dam\dam_shock_minor)
(set electrode_sound_ll false))))
(begin
(if
(not electrode_sound_ll)
(begin
(sound_looping_start sound\sfx\devices\b30_dam\dam_shock_minor electrode_ll 1.00)
(set electrode_sound_ll true)))))
(if
(=
(vehicle_driver electrode_lr) none)
(begin
(if electrode_sound_lr
(begin
(sound_looping_stop sound\sfx\devices\b30_dam\dam_shock_minor_lr)
(set electrode_sound_lr false))))
(begin
(if
(not electrode_sound_lr)
(begin
(sound_looping_start sound\sfx\devices\b30_dam\dam_shock_minor_lr electrode_lr 1.00)
(set electrode_sound_lr true)))))
(if
(=
(vehicle_driver electrode_ul) none)
(begin
(if electrode_sound_ul
(begin
(sound_looping_stop sound\sfx\devices\b30_dam\dam_shock_minor_ul)
(set electrode_sound_ul false))))
(begin
(if
(not electrode_sound_ul)
(begin
(sound_looping_start sound\sfx\devices\b30_dam\dam_shock_minor_ul electrode_ul 1.00)
(set electrode_sound_ul true)))))
(if
(=
(vehicle_driver electrode_ur) none)
(begin
(if electrode_sound_ur
(begin
(sound_looping_stop sound\sfx\devices\b30_dam\dam_shock_minor_ur)
(set electrode_sound_ur false))))
(begin
(if
(not electrode_sound_ur)
(begin
(sound_looping_start sound\sfx\devices\b30_dam\dam_shock_minor_ur electrode_ur 1.00)
(set electrode_sound_ur true)))))
(sleep 30)))

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
(= track_music false)
(= pee_battle_music false)
(not hand_music_script)) 1)
(print hand_music: on)
(sound_looping_start sound\music\hand_6\hand_6 none 1.00)
(sleep_until
(or
(= hand_music false)
(= track_music true)
(= pee_battle_music true) hand_music_script) 1)
(print hand_music: off)
(sound_looping_stop sound\music\hand_6\hand_6)
(sleep
(* 30.00 10.00))))

(script continuous void pee_battle_music_script
(begin
(sleep_until
(and
(= pee_battle_music true)
(not pee_battle_music_script)) 1)
(if hand_music
(sleep 30))
(print pee_battle_music: on)
(sound_looping_start sound\music\b30\pee_battle none 0.35)
(sleep_until
(or
(= pee_battle_music false) pee_battle_music_script) 1)
(print pee_battle_music: off)
(sound_looping_stop sound\music\b30\pee_battle)))

(script continuous void track_battle_music_script
(begin
(sleep_until
(and
(= track_music true)
(not track_battle_music_script)) 1)
(if hand_music
(sleep 30))
(print track_battle_music: on)
(sound_looping_start sound\music\b30\track none 1.00)
(sleep_until
(or
(= track_music false) track_battle_music_script) 1)
(print track_battle_music: off)
(sound_looping_stop sound\music\b30\track)))

(script dormant void 10_stubbs_dialog
(begin
(sleep 1253)
(sound_impulse_start sound\cinematics\b30\10_stubbs_1 10_stubbs_3 1.00)
(sleep
(sound_impulse_time sound\cinematics\b30\10_stubbs_1))
(sound_impulse_start sound\cinematics\b30\10_stubbs_2 10_stubbs_3 1.00)))

(script dormant void 10_foley
(begin
(sleep 5)
(sound_looping_start sound\cinematics\b30\10_foley_1 none 1.00)))

(script static void b30_10_run
(begin
(fade_out 0.00 0.00 0.00 0)
(sound_looping_predict sound\cinematics\b30\10_foley_1) b30_10_run
(switch_bsp 1)
(object_activation_add_camera 10_01)
(object_create 10_wye_1)
(object_create 10_scientist_1)
(object_create 10_hovertruck_1)
(unit_enter_vehicle_now 10_wye_1 10_hovertruck_1 cr-driver)
(unit_enter_vehicle_now 10_scientist_1 10_hovertruck_1 cr-passenger)
(sound_class_set_gain ambient_nature 0.65 0)
(wake 10_foley)
(wake 10_stubbs_dialog)
(print b30_10: introduction)
(camera_set 10_01_a 0)
(camera_set_animation cinematics\animations\camera\b30_dam\b30_dam b30_cutscene_camera)
(fade_in 0.00 0.00 0.00 0)
(sleep 240)
(recording_play 10_hovertruck_1 10_hovertruck_1)
(sleep 30)
(sleep 30)
(sleep 30)
(object_create 10_hovertruck_2)
(sleep 50)
(recording_play 10_hovertruck_2 10_hovertruck_2)
(sleep 25)
(object_destroy 10_hovertruck_1)
(sleep 70)
(object_create 10_wye_2)
(object_create 10_scientist_2)
(object_beautify 10_wye_2 true)
(object_beautify 10_scientist_2 true)
(object_create 10_hovertruck_3)
(unit_enter_vehicle_now 10_wye_2 10_hovertruck_3 cr-driver)
(unit_enter_vehicle_now 10_scientist_2 10_hovertruck_3 cr-passenger)
(recording_play 10_hovertruck_3 10_hovertruck_3)
(unit_custom_animation_at_frame 10_wye_2 cinematics\animations\wye\b30\b30 b30_10_wye_1 false 50)
(sleep 40)
(sound_class_set_gain vehicle_engine 0.00 0)
(sound_class_set_gain ambient_nature 0.25 10)
(camera_set_relative 10_03 0 10_hovertruck_3)
(object_destroy 10_hovertruck_2)
(sleep 1)
(sound_impulse_start sound\dialog\b30\10_wye_1 10_wye_2 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\b30\10_wye_1) 15.00))
(sound_impulse_start sound\dialog\b30\10_scientist_1 10_scientist_2 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\b30\10_scientist_1) 15.00))
(sound_impulse_start sound\dialog\b30\10_wye_2 10_wye_2 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\b30\10_wye_2) 15.00))
(sound_impulse_start sound\dialog\b30\10_scientist_2 10_scientist_2 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\b30\10_scientist_2) 15.00))
(sound_impulse_start sound\dialog\b30\10_wye_3 10_wye_2 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\b30\10_wye_3) 30.00))
(object_create 10_hovertruck_4)
(unit_enter_vehicle_now 10_wye_1 10_hovertruck_4 cr-driver)
(unit_enter_vehicle_now 10_scientist_1 10_hovertruck_4 cr-passenger)
(recording_play 10_hovertruck_4 10_hovertruck_4)
(sleep 40)
(sound_class_set_gain vehicle_engine 0.50 15)
(sound_class_set_gain ambient_nature 0.65 15)
(fade_out 0.00 0.00 0.00 0)
(object_destroy 10_hovertruck_3)
(camera_set 10_04 0)
(fade_in 0.00 0.00 0.00 0)
(sleep 30)
(camera_set 10_05 60)
(sleep 60)
(object_create 10_stubbs_3)
(object_beautify 10_stubbs_3 true)
(object_create 10_sheep_1)
(sound_looping_predict sound\cinematics\b30\10_foley_2)
(sleep 30)
(custom_animation 10_sheep_1 cinematics\animations\sheep\b30\b30 b30_10_sheep_enter false)
(custom_animation 10_stubbs_3 cinematics\animations\stubbs\b30\b30 b30_10_stubbs_enter false)
(camera_set 10_06 0)
(sound_looping_start sound\cinematics\b30\10_foley_2 none 1.00)
(sleep 120)
(camera_set 10_06b 0)
(sleep 60)
(object_teleport 10_stubbs_3 10_stubbs_20)
(object_teleport 10_sheep_1 10_sheep_20)
(custom_animation 10_sheep_1 cinematics\animations\sheep\b30\b30 b30_10_sheep_1 false)
(custom_animation 10_stubbs_3 cinematics\animations\stubbs\b30\b30 b30_10_stubbs_1 false)
(camera_set 10_07 0)
(sleep 90)
(sleep 30)
(camera_set 10_08 0)
(sleep 80)
(sleep 40)
(camera_set 10_09c 0)
(sleep 60)
(camera_set 10_09 0)
(camera_set 10_09b 90)
(print stubbs needs to pee!!!!)
(sleep 240)
(camera_set 10_10 0)
(print stubbs goes to door)
(sleep
(-
(unit_get_custom_animation_time 10_stubbs_3) 30.00))
(fade_out 0.00 0.00 0.00 0)
(object_destroy_containing 10_) b30_10_run
(object_activation_clear)
(sound_class_set_gain vehicle_engine 1.00 15)
(sound_class_set_gain ambient_nature 1.00 15)))

(script dormant void 20_dialog
(begin
(sleep 48)
(sound_impulse_start sound\dialog\b30\20_scientist_1 20_scientist_1 1.00)
(sleep
(+
(sound_impulse_time sound\dialog\b30\20_scientist_1) 60.00))
(sound_impulse_start sound\dialog\b30\20_scientist_2 20_scientist_1 1.00)
(sleep
(+
(sound_impulse_time sound\dialog\b30\20_scientist_2) 90.00))
(sound_impulse_start sound\dialog\b30\20_scientist_4 20_scientist_1 1.00)
(sleep
(+
(sound_impulse_time sound\dialog\b30\20_scientist_4) 120.00))
(sound_impulse_start sound\dialog\b30\20_scientist_5 20_scientist_1 1.00)))

(script dormant void 20_stubbs_dialog
(begin
(sound_impulse_start sound\cinematics\b30\20_stubbs_1 20_stubbs_1 1.00)
(sleep
(sound_impulse_time sound\cinematics\b30\20_stubbs_1))
(sound_impulse_start sound\cinematics\b30\20_stubbs_2 20_stubbs_1 1.00)))

(script static void b30_20_run
(begin
(fade_out 0.00 0.00 0.00 0)
(sound_looping_predict sound\cinematics\b30\20_foley_1) b30_20_run
(switch_bsp 0)
(object_activation_add_camera 20_01)
(sleep 15)
(sound_looping_start sound\cinematics\b30\20_foley_1 none 1.00)
(wake 20_stubbs_dialog)
(print b30_20: card key scientist)
(object_create 20_scientist_1)
(unit_set_weapon 20_scientist_1 none)
(object_create 20_stubbs_1)
(object_beautify 20_scientist_1 true)
(object_beautify 20_stubbs_1 true)
(object_teleport 20_stubbs_1 20_stubbs_2)
(recording_play 20_stubbs_1 20_stubbs_2)
(sleep 5)
(camera_set 20_005 0)
(fade_in 0.00 0.00 0.00 0)
(sleep 45)
(custom_animation 20_scientist_1 cinematics\animations\scientist\b30\b30 b30_20_scientist_1 false)
(custom_animation 20_stubbs_1 cinematics\animations\stubbs\b30\b30 b30_20_stubbs_1 false)
(camera_set 20_01b 0)
(wake 20_dialog)
(sleep 120)
(camera_set 20_01c 0)
(sleep 120)
(camera_set 20_01 520)
(sleep
(-
(unit_get_custom_animation_time 20_stubbs_1) 90.00))
(camera_set 20_01d 0)
(sleep 90)
(fade_out 0.00 0.00 0.00 0)
(sleep 30) b30_20_run
(object_destroy_containing 20_)
(object_activation_clear)))

(script static void b30_30_run
(begin
(fade_out 0.00 0.00 0.00 0)
(sound_looping_predict sound\cinematics\b30\30_foley_1) b30_30_run
(switch_bsp 1)
(object_activation_add_camera 30_01)
(object_create 30_stubbs_1)
(object_beautify 30_stubbs_1 true)
(object_create 30_stubbs_2)
(object_beautify 30_stubbs_2 true)
(print b30_30: pee pee battle)
(camera_set 30_01 0)
(sleep 45)
(sound_looping_start sound\cinematics\b30\30_foley_1 none 1.00)
(sound_impulse_start sound\cinematics\b30\30_stubbs_1 30_stubbs_2 1.00)
(custom_animation 30_stubbs_1 cinematics\animations\stubbs\b30\b30 b30_30_stubbs_1 false)
(fade_in 0.00 0.00 0.00 0)
(sleep 60)
(sleep 20)
(custom_animation 30_stubbs_2 cinematics\animations\stubbs\b30\b30 b30_30_stubbs_1 false)
(camera_set 30_02 0)
(object_destroy 30_stubbs_1)
(sleep 60)
(object_teleport 30_stubbs_2 30_stubbs_2)
(custom_animation 30_stubbs_2 cinematics\animations\stubbs\b30\b30 b30_30_stubbs_1 false)
(camera_set 30_03 0)
(sleep 60)
(custom_animation 30_stubbs_2 cinematics\animations\stubbs\b30\b30 b30_30_stubbs_2 false)
(camera_set 30_04 0)
(sleep 30)
(camera_set 30_05 90)
(sleep 120)
(camera_set 30_06 60)
(sleep 30)
(camera_set 30_07 60)
(sleep
(unit_get_custom_animation_time 30_stubbs_2))
(fade_out 0.00 0.00 0.00 0)
(object_destroy_containing 30_) b30_30_run
(object_activation_clear)))

(script static void b30_40_run
(begin
(fade_out 0.00 0.00 0.00 0)
(sound_looping_predict sound\cinematics\b30\40_foley_1) b30_40_run
(switch_bsp 1)
(object_activation_add_camera 40_01)
(object_teleport b30_40_run 40_hide_player)
(object_teleport b30_40_run 40_hide_player)
(object_teleport b30_40_run 40_hide_player)
(object_teleport b30_40_run 40_hide_player)
(sleep 15)
(sound_looping_start sound\cinematics\b30\40_foley_1 none 1.00)
(print b30_40: the basin is tainted)
(object_create 40_stubbs_1)
(object_beautify 40_stubbs_1 true)
(sound_impulse_start sound\cinematics\b30\40_stubbs_1 40_stubbs_1 1.00)
(unit_custom_animation_at_frame 40_stubbs_1 cinematics\animations\stubbs\b30\b30 b30_40_stubbs_1 false 30)
(camera_set 40_01 0)
(fade_in 0.00 0.00 0.00 0)
(sleep 60)
(camera_set 40_02 90)
(sleep 210)
(fade_out 0.00 0.00 0.00 0)
(object_destroy_containing 40_) b30_40_run
(object_activation_clear)))

(script dormant void animate_hitchhiker
(begin
(custom_animation 50_zombie_1 cinematics\animations\zombie\b30\b30 b30_50_zombie_1 false)
(sleep
(unit_get_custom_animation_time 50_zombie_1))
(custom_animation 50_zombie_1 cinematics\animations\zombie\b30\b30 b30_50_zombie_1 true)
(sleep
(unit_get_custom_animation_time 50_zombie_1))
(custom_animation 50_zombie_1 cinematics\animations\zombie\b30\b30 b30_50_zombie_1 true)))

(script dormant void 50_animate_wye
(begin
(custom_animation 50_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle false)
(sleep 15)
(custom_animation 50_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed threaten true)
(sleep
(unit_get_custom_animation_time 50_wye_1))
(custom_animation 50_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep 62)
(custom_animation 50_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed no true)
(sleep
(unit_get_custom_animation_time 50_wye_1))
(custom_animation 50_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep 36)
(custom_animation 50_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed point true)
(sleep
(unit_get_custom_animation_time 50_wye_1))
(custom_animation 50_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep 45)
(custom_animation 50_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed shrug true)
(sleep
(unit_get_custom_animation_time 50_wye_1))
(custom_animation 50_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 50_wye_1))
(custom_animation 50_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)))

(script static void b30_50_run
(begin
(fade_out 0.00 0.00 0.00 0)
(sound_looping_predict sound\cinematics\b30\50_foley_1) b30_50_run
(switch_bsp 1)
(object_activation_add_camera 50_01)
(object_activation_add_camera 50_09)
(sleep 30)
(sound_looping_start sound\cinematics\b30\50_foley_1 none 1.00)
(sound_impulse_start sound\cinematics\b30\50_stubbs_1 50_stubbs_1 1.00)
(print b30_50: track battle)
(object_create 50_stubbs_1)
(object_beautify 50_stubbs_1 true)
(object_create 50_hovertruck_1)
(camera_set 50_01 0)
(fade_in 0.00 0.00 0.00 0)
(sleep 30)
(camera_set 50_02 60)
(sleep 20)
(recording_play 50_stubbs_1 50_stubbs_1)
(sleep 90)
(camera_set 50_03 0)
(object_teleport 50_stubbs_1 50_stubbs_1)
(sleep 60)
(camera_set 50_04 0)
(recording_kill 50_stubbs_1)
(object_teleport 50_stubbs_1 50_stubbs_2)
(recording_play 50_stubbs_1 50_stubbs_3)
(sleep 60)
(camera_set_relative 50_07 0 50_hovertruck_1)
(recording_kill 50_stubbs_1)
(unit_enter_vehicle 50_stubbs_1 50_hovertruck_1 cr-driver)
(sleep 90)
(camera_set_relative 50_08 0 50_hovertruck_1)
(camera_set_relative 50_08c 90 50_hovertruck_1)
(object_create 50_wye_1)
(object_beautify 50_wye_1 true)
(unit_set_seat 50_wye_1 alert)
(unit_set_weapon 50_wye_1 none)
(sleep 30)
(sound_class_set_gain ambient_nature 0.00 15)
(camera_set_relative 50_08b 15 50_hovertruck_1)
(fade_out 1.00 1.00 1.00 15)
(sleep 15)
(wake 50_animate_wye)
(camera_set 50_09_new 0)
(camera_set 50_09c_new 530)
(fade_in 1.00 1.00 1.00 15)
(image_effect_set image_effects\television)
(cinematic_set_title 50_viewscreen)
(sleep 20)
(sound_impulse_start sound\dialog\b30\50_wye_1 50_wye_1 1.00)
(sleep
(+
(sound_impulse_time sound\dialog\b30\50_wye_1) 10.00))
(recording_play 50_hovertruck_1 50_hovertruck_1)
(camera_set 50_09b 0)
(cinematic_clear_title 50_viewscreen)
(sound_class_set_gain ambient_nature 1.00 0)
(image_effect_end)
(object_create 50_zombie_1)
(object_create 50_arm_1)
(objects_attach 50_zombie_1 meleer 50_arm_1 attachment)
(object_create 50_zombie_2)
(ai_place 50_zombie)
(sleep 89)
(wake animate_hitchhiker)
(sleep 1)
(camera_set 50_10 0)
(sleep 60)
(camera_set 50_11 120)
(sleep 60)
(object_destroy 50_hovertruck_1)
(object_create 50_hovertruck_2)
(ai_vehicle_enterable_team 50_hovertruck_2 zombie)
(unit_enter_vehicle 50_stubbs_1 50_hovertruck_2 cr-driver)
(sleep 30)
(recording_play 50_hovertruck_2 50_hovertruck_2)
(camera_set 50_14 120)
(sleep 30)
(sleep 30)
(sleep 48)
(sleep 31)
(sleep 61)
(sleep 60)
(fade_out 0.00 0.00 0.00 0)
(object_destroy_containing 50_)
(ai_erase 50_zombie) b30_50_run
(object_activation_clear)
(ai_vehicle_enterable_disable 50_hovertruck_2)))

(script static void b30_60_run
(begin
(fade_out 0.00 0.00 0.00 0) b30_60_run
(switch_bsp 1)
(object_activation_add_camera 60_01)
(object_activation_add_camera 60_10)
(object_activation_add_camera 60_11)
(object_activation_add_camera news_a)
(sound_class_set_gain device_machinery 0.30 0)
(sound_class_set_gain ambient_nature 0.30 0)
(sleep 15)
(sound_looping_start sound\cinematics\b30\60_foley_1 none 1.00)
(print b30_60: the dam is destroyed)
(object_create 60_hovertruck_1)
(object_create 60_stubbs_1)
(object_beautify 60_stubbs_1 true)
(object_create 60_worker_1)
(object_create 60_worker_2)
(object_create 60_worker_3)
(object_create 60_worker_4)
(object_create 60_chumley_1)
(unit_set_seat 60_chumley_1 alert)
(object_beautify 60_chumley_1 true)
(camera_set 60_01 0)
(fade_in 0.00 0.00 0.00 0)
(sleep 1)
(sound_impulse_start sound\cinematics\b30\60_stubbs_1 60_stubbs_1 1.00)
(sleep 89)
(custom_animation 60_stubbs_1 cinematics\animations\stubbs\b30\b30 b30_60_stubbs_1 false)
(camera_set 60_02 0)
(sleep 60)
(camera_set 60_03 0)
(sleep 60)
(custom_animation 60_worker_1 cinematics\animations\scientist\b30\b30 b30_60_scientist1_1 false)
(custom_animation 60_worker_2 cinematics\animations\scientist\b30\b30 b30_60_scientist2_1 false)
(custom_animation 60_worker_3 cinematics\animations\scientist\b30\b30 b30_60_scientist3_1 false)
(custom_animation 60_worker_4 cinematics\animations\scientist\b30\b30 b30_60_scientist4_1 false)
(camera_set 60_04 30)
(sleep 60)
(camera_set 60_05 0)
(sleep 60)
(camera_set 60_06 0)
(sleep 90)
(camera_set 60_07 0)
(sleep 60)
(camera_set 60_08b 60)
(sleep 30)
(camera_set 60_08 60)
(sleep 30)
(cinematic_show_letterbox false)
(sound_looping_predict sound\cinematics\b30\60_foley_2)
(sleep 30)
(cinematic_set_title 60_newscard)
(image_effect_set image_effects\television_clean)
(sleep 15)
(switch_bsp 3)
(object_activation_add_camera news_a)
(sleep 1)
(sound_looping_start sound\cinematics\b30\60_foley_2 none 1.00)
(sleep 44)
(object_create 60_paper_1)
(objects_attach 60_chumley_1 weapon 60_paper_1 attachment)
(camera_set news_a 0)
(custom_animation 60_chumley_1 cinematics\animations\chumley\b30\b30 b30_60_chumley_1 false)
(cinematic_clear_title 60_newscard)
(sleep 3)
(sound_impulse_start sound\dialog\b30\60_chumley_1 60_chumley_1 1.00)
(sleep
(sound_impulse_time sound\dialog\b30\60_chumley_1))
(cinematic_set_title 60_reporter)
(sleep 30)
(sound_impulse_start sound\dialog\b30\60_jimmy_nesbitt_1 none 0.01)
(sleep
(sound_impulse_time sound\dialog\b30\60_jimmy_nesbitt_1))
(camera_set news_a 0)
(custom_animation 60_chumley_1 cinematics\animations\chumley\b30\b30 b30_60_chumley_2 false)
(cinematic_clear_title 60_reporter)
(sleep 33)
(sound_impulse_start sound\dialog\b30\60_chumley_2 60_chumley_1 1.00)
(sleep
(sound_impulse_time sound\dialog\b30\60_chumley_2))
(sound_impulse_start sound\dialog\b30\60_chumley_3 60_chumley_1 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\b30\60_chumley_3) 15.00))
(camera_set news_static 0)
(image_effect_set image_effects\television_static)
(sleep 60)
(fade_out 0.00 0.00 0.00 0) b30_60_run
(object_activation_clear)
(object_destroy_containing 60_)
(sound_class_set_gain device_machinery 1.00 0)
(sound_class_set_gain ambient_nature 1.00 0)))

(script static void preview
(begin preview preview preview preview preview preview preview))

(script startup void test
(begin
(if
(> test 0) test)
(if
(= test 10) test)
(if
(= test 20) test)
(if
(= test 30) test)
(if
(= test 40) test)
(if
(= test 50) test)
(if
(= test 60) test)))

(script static void next_cutscene
(begin
(map_name levels\c10_offender\c10_offender_cutscene)))

(script static void unlockable_pickup
(begin
(damage_object equipment\hippo\hippo_pickup unlockable_pickup)
(if
(game_is_cooperative)
(damage_object equipment\hippo\hippo_pickup unlockable_pickup))))

(script static void stop_commentary
(begin
(sound_looping_stop sound\commentary\b30_dam\b30_dam_01)
(sound_looping_stop sound\commentary\b30_dam\b30_dam_02)
(sound_looping_stop sound\commentary\b30_dam\b30_dam_03)
(sound_looping_stop sound\commentary\b30_dam\b30_dam_04)
(sound_looping_stop sound\commentary\b30_dam\b30_dam_05)))

(script dormant void unlock_comment_1
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_1) 0.00) 7) unlock_comment_1
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_1
(sound_looping_start sound\commentary\b30_dam\b30_dam_01 none 1.00)
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
(sound_looping_start sound\commentary\b30_dam\b30_dam_02 none 1.00)
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
(sound_looping_start sound\commentary\b30_dam\b30_dam_03 none 1.00)
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
(sound_looping_start sound\commentary\b30_dam\b30_dam_04 none 1.00)
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
(sound_looping_start sound\commentary\b30_dam\b30_dam_05 none 1.00)
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