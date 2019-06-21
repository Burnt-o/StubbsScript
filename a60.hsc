(global bool cutscene_running false)

(global bool big_boss_fight false)

(global bool jumbo_music false)

(global bool hand_music false)

(global bool outer_d false)

(global short hunt 0)

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

(script static object_list big_boss
(begin
(ai_actors m6_defenders/brute_squad_a)))

(script static weapon boss
(begin
(unit
(list_get boss 0))))

(script static void a60_20
(begin
(if
(= show_cutscenes true) a60_20)))

(script static void a60_30
(begin
(if
(= show_cutscenes true) a60_30)))

(script static void cutscenes_on
(begin
(set show_cutscenes true)))

(script continuous void savesafe
(begin
(sleep 60)
(game_safe_to_save)))

(script static void mainsave
(begin
(sleep_until
(game_safe_to_save) 5)
(game_save)))

(script startup void car_lock
(begin
(begin
(print ))))

(script continuous void truck_hunt
(begin
(if
(volume_test_objects mall_fight_scene
(players_current))
(ai_vehicle_use_movement_positions mx_drivers false)
(ai_vehicle_use_movement_positions mx_drivers true))))

(script startup void maul_switch
(begin
(sleep_until
(volume_test_objects door_shut
(players_origin)) 1)
(device_operates_automatically_set mall_int_front false)
(device_set_position_immediate mall_int_front 0.00)
(game_save_cancel)
(deactivate_nav_point_object maul_switch mall_int_front)
(deactivate_nav_point_object maul_switch mall_int_front)
(ai_set_current_state z_crypt_03 move_loop_random)
(ai_set_return_state z_crypt_03 move_loop_random)
(sleep_until
(volume_test_objects bsp 0,1
(players_origin)) 1)
(player_enable_input false)
(game_save_cancel)
(game_save_no_timeout)
(player_enable_input true)))

(script dormant void jeb_snuffy
(begin
(sound_impulse_start sound\dialog\a50\se_snuffy_1
(list_get
(ai_actors warehouse) 1) 1.00)
(sleep
(sound_impulse_time sound\dialog\a50\se_snuffy_1))
(sound_impulse_start sound\dialog\a50\se_jeb_1
(list_get
(ai_actors warehouse) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a50\se_jeb_1))
(sound_impulse_start sound\dialog\a50\se_snuffy_2
(list_get
(ai_actors warehouse) 1) 1.00)
(sleep
(sound_impulse_time sound\dialog\a50\se_snuffy_2))))

(script static void militia_opening
(begin
(ai_place warehouse)
(camera_set fight_opening_01 0)
(wake jeb_snuffy)
(fade_in 0.00 0.00 0.00 30)
(sleep 120)
(camera_set fight_opening_02 0)
(sleep
(sound_impulse_time sound\dialog\a50\se_snuffy_1))
(sleep
(sound_impulse_time sound\dialog\a50\se_jeb_1))
(ai_command_list_advance warehouse)
(camera_set fight_opening_03 0)
(sleep 75)
(object_teleport militia_opening start_warehouse)
(sleep 90)
(fade_out 0.00 0.00 0.00 30)
(sleep 60)
(player_enable_input true)
(player_camera_control true)
(camera_control false 0)
(object_destroy opening_pickup)
(cinematic_stop)
(fade_in 0.00 0.00 0.00 30)))

(script static void otis_opening_cinema
(begin
(cinematic_start)
(image_effect_set image_effects\technicolor)
(player_enable_input false)
(player_camera_control false)
(camera_control true 0)
(camera_set opening_otis_cam 0)
(object_create opening_pickup)
(unit_set_weapon open_otis none)
(unit_set_seat audience_01 alert)
(unit_set_seat audience_03 alert)
(ai_attach_free audience_02 characters\militia_thin\militia_thin)
(custom_animation open_otis cinematics\animations\otis\a60_se\a60_se a60_se_otis_1 false)
(sleep 30)
(fade_in 0.00 0.00 0.00 30)
(camera_set open_otis_03 390)
(sleep 30)
(sound_impulse_start sound\dialog\a60\se_otis_2 open_otis 1.00)
(sleep 60)
(sleep
(sound_impulse_time sound\dialog\a60\se_otis_2))
(fade_out 0.00 0.00 0.00 0)
(sleep 30) otis_opening_cinema))

(script static void big_exterior_fight
(begin
(cinematic_start)
(ai_disregard
(players_origin) true)
(player_enable_input false)
(player_camera_control false)
(camera_control true 0)
(camera_set start_fight_03 0)
(camera_set start_fight_03b 60)
(sleep 120)
(camera_set start_fight_02 0)
(camera_set start_fight_02b 120)
(sleep 90)
(fade_out 0.00 0.00 0.00 0)
(sleep 30)
(player_enable_input true)
(player_camera_control true)
(camera_control false 0)
(cinematic_stop)))

(script static void exterior_final
(begin
(cinematic_start)
(ai_disregard
(players_origin) true)
(player_enable_input false)
(player_camera_control false)
(camera_control true 0)
(camera_set drop_wave_01 0)
(camera_set drop_wave_02 90)
(sleep 90)
(device_set_power mall_int_front 0.00)
(sleep 30)
(player_enable_input true)
(player_camera_control true)
(camera_control false 0)
(cinematic_stop)
(ai_disregard
(players_origin) false)))

(script continuous void outer_defense
(begin
(sleep_until outer_d)
(if
(objects_can_see_flag
(players_current) left_spawn 30.00)
(begin
(if
(and
(not
(objects_can_see_flag
(players_current) right_spawn 30.00))
(>
(ai_living_count mx_defenders/right_def) 4))
(ai_place mx_defenders/right_def)))
(begin
(if
(and
(not
(objects_can_see_flag
(players_current) left_spawn 30.00))
(>
(ai_living_count mx_defenders/right_def) 4))
(ai_place mx_defenders/left_def))))
(sleep 300)))

(script startup void mall_ext
(begin mall_ext
(fade_out 0.00 0.00 0.00 0)
(device_operates_automatically_set mall_int_front true)
(ai_set_resurrection_group z_crypt_03/zombie_b)
(objects_cannot_take_damage
(players_origin) true) mall_ext
(object_teleport mall_ext start_warehouse)
(object_destroy open_otis)
(object_destroy audience_01)
(object_destroy audience_02)
(object_destroy audience_03)
(fade_in 0.00 0.00 0.00 30)
(sleep 30)
(objects_cannot_take_damage
(players_origin) false)
(sleep_until
(or
(<
(ai_living_count warehouse) 2)
(volume_test_objects mall_fight_scene
(players_current))) 1)
(print )
(ai_begin_flee warehouse false 150)
(game_save_cancel)
(game_save_no_timeout)
(sleep_until
(volume_test_objects mall_fight_scene
(players_current)) 1)
(ai_place mx_defenders/top_def_01)
(ai_place civilian_fodder)
(ai_place z_crypt_03/zombie_a)
(sleep_until
(and
(volume_test_objects mall_fight_scene
(players_current))
(<=
(ai_living_count civilian_fodder) 2)) 1)
(set outer_d true)
(objects_cannot_take_damage
(players_origin) true)
(sleep 60)
(ai_place mx_defenders/front_def_01) mall_ext
(fade_in 0.00 0.00 0.00 0)
(sleep 60)
(objects_cannot_take_damage
(players_origin) false)
(ai_disregard
(players_origin) false)
(sleep 240)
(device_operates_automatically_set mall_int_front false)
(device_set_position mall_int_front 0.00)
(game_save_cancel)
(game_save_no_timeout)
(sleep_until
(<
(ai_living_count mx_defenders/front_def_01) 3))
(game_save_cancel)
(game_save_no_timeout)
(objects_cannot_take_damage
(players_origin) true)
(sleep 60)
(ai_disregard
(players_current) true)
(ai_disregard
(players_origin) true)
(ai_place mx_defenders/final_wave)
(device_operates_automatically_set mall_int_front false)
(device_set_position mall_int_front 1.00) mall_ext
(activate_nav_point_object default mall_ext mall_int_front 0.00)
(activate_nav_point_object default mall_ext mall_int_front 0.00)
(sleep 60)
(objects_cannot_take_damage
(players_origin) false)
(game_save_cancel)
(game_save_no_timeout)
(sleep 90)
(device_set_power mall_int_front 0.00)
(ai_berserk mx_defenders/final_wave true)
(ai_disregard
(players_current) false)
(ai_disregard
(players_origin) false)))

(script dormant void civ_actions
(begin
(sleep_until
(<
(ai_living_count mall_civilians/ground) 1))
(ai_begin_flee mall_civilians/ground false 300)
(ai_place m1_defenders)
(ai_magically_see_players m1_defenders)))

(script dormant void maul_maneuvers
(begin
(sleep_until
(<
(ai_living_count m1_defenders) 5))
(ai_defend m1_defenders)
(sleep_until
(<
(ai_living_count m1_defenders) 3))
(ai_begin_flee mall_civilians/ground true 0)
(game_save_cancel)
(game_save_no_timeout)))

(script continuous void get_out_of_jail
(begin
(if
(and
(not
(game_is_cooperative))
(<
(object_get_health get_out_of_jail) 0.40)
(unit_taking_damage get_out_of_jail)
(not
(unit_taking_damage get_out_of_jail))
(<
(objects_distance
(players_origin) get_out_of_jail) 2.00))
(begin
(ai_command_list m6_defenders taunt_player)
(sound_impulse_start sound\dialog\large_militia_combat\postcombat_celebrate get_out_of_jail 1.00)
(sleep 300)))))

(script dormant void maul_int
(begin
(sleep_until
(volume_test_objects mall_int_start
(players_origin)) 1)
(set outer_d false)
(ai_place z_crypt_04/zombie_a)
(ai_set_resurrection_group z_crypt_04/zombie_a)
(ai_place m1_defenders)
(ai_place mall_civilians)
(device_operates_automatically_set mall_int_inner true)
(wake maul_maneuvers)
(print )
(sleep_until
(volume_test_objects inside_the_mall
(players_origin)) 1)
(device_set_position mall_int_inner 0.00)
(sleep_until
(or
(volume_test_objects first_floor_out_a
(players_current))
(volume_test_objects first_floor_out
(players_current))
(volume_test_objects first_floor_out_b
(players_current))) 5)
(ai_place m2_defenders)
(ai_magically_see_players m2_defenders/militia_a)
(print )
(game_save_cancel)
(game_save_no_timeout)
(sleep_until
(volume_test_objects militia_out_02
(players_current)) 5)
(ai_place m3_defenders)
(ai_magically_see_players m3_defenders/shotgun_killer)
(game_save_cancel)
(game_save_no_timeout)))

(script startup void maul_int_top
(begin
(sleep_until
(or
(volume_test_objects militia_out_03
(players_current))
(volume_test_objects militia_out_03a
(players_current))) 1)
(game_save_cancel)
(game_save_no_timeout)
(ai_place m4_defenders)
(device_set_position second_floor_door 1.00)
(sleep_until
(volume_test_objects militia_out_04
(players_current)) 5)
(fade_out 0.00 0.00 0.00 0)
(volume_teleport_players_not_inside in_lil_shootist boss_top)
(ai_kill mall_civilians)
(ai_kill_silent z_crypt_04)
(if maul_int_top maul_int_top) maul_int_top
(fade_out 0.00 0.00 0.00 0)
(object_teleport maul_int_top boss_fight_start)
(object_teleport maul_int_top boss_fight_start_02)
(game_save_cancel)
(game_save_no_timeout)
(ai_place z_crypt_04/zombie_c)
(ai_place mall_civilians/top)
(ai_place m6_defenders)
(object_beautify
(list_get
(ai_actors m6_defenders/brute_squad_a) 0) true)
(ai_berserk m6_defenders true)
(ai_set_resurrection_group z_crypt_04/zombie_a)
(ai_braindead m6_defenders true)
(fade_in 0.00 0.00 0.00 30)
(sleep 30)
(set jumbo_music true)
(ai_braindead m6_defenders false)
(ai_try_to_fight z_crypt_04 m6_defenders)
(set big_boss_fight true)
(set hunt 1)
(device_set_position second_floor_door 1.00)
(ai_set_resurrection_group z_crypt_04)
(game_save_cancel)
(game_save_no_timeout)
(print )
(ai_force_active m6_defenders true)
(ai_magically_see_players m6_defenders)
(ai_try_to_fight_player m5_defenders)
(game_save_cancel)
(game_save_no_timeout)
(objects_cannot_die maul_int_top true)
(objects_cannot_lose_regions maul_int_top true)
(objects_cannot_be_possessed maul_int_top true)
(objects_cannot_be_finished maul_int_top true)
(object_set_maximum_vitality maul_int_top 1200.00 0.00)
(sleep_until
(<=
(object_get_health maul_int_top) 0.00))
(objects_cannot_lose_regions maul_int_top false)
(sleep_until
(object_region_destroyed maul_int_top armleft) 1)
(objects_cannot_be_finished maul_int_top true)
(inspect
(object_get_health maul_int_top))
(object_set_current_vitality maul_int_top 1200.00 0.00)
(inspect
(object_get_health maul_int_top))
(sound_impulse_start sound\dialog\large_militia_combat\maimed_limb maul_int_top 1.00)
(sleep_until
(<=
(object_get_health maul_int_top) 0.00))
(objects_cannot_be_finished maul_int_top false)
(sleep_until
(=
(ai_living_count m6_defenders) 0))
(set jumbo_music false)
(device_set_position mall_int_front 1.00)
(device_operates_automatically_set mall_int_front true)
(fade_out 0.00 0.00 0.00 0)
(ai_erase_all)
(sleep -1 mall_ext)
(game_save_cancel)
(sleep 1)
(if maul_int_top maul_int_top) maul_int_top
(game_won)))

(script startup void mainpath
(begin
(ai_allegiance zombie possessed)
(sleep_until
(volume_test_objects bsp 0,1
(players_origin)) 5)
(device_set_power mall_int_front 1.00)
(device_set_position mall_int_front 0.00)
(device_operates_automatically_set mall_int_front false)
(wake maul_int)))

(script static void checkpoint4
(begin
(switch_bsp 0)
(object_teleport checkpoint4 checkpoint_04)
(wake maul_int)))

(script continuous void boss_stalk
(begin
(sleep_until
(>
(ai_living_count m6_defenders) 0))
(ai_magically_see_players m6_defenders)
(if
(objects_can_see_object
(players_current) boss_stalk 30.00)
(print )
(begin
(print )
(if
(and
(volume_test_objects end_fight_top
(players_current))
(!= hunt 1))
(begin
(object_teleport boss_stalk boss_top)
(ai_magically_see_players m6_defenders)
(ai_force_active m6_defenders true)
(set hunt 1)
(print ))
(if
(and
(volume_test_objects end_fight_middle
(players_current))
(!= hunt 2))
(begin
(object_teleport boss_stalk boss_middle)
(ai_magically_see_players m6_defenders)
(ai_force_active m6_defenders true)
(set hunt 2)
(print ))
(if
(and
(volume_test_objects end_fight_bottom
(players_current))
(< hunt 7))
(begin
(object_teleport boss_stalk boss_bottom)
(ai_force_active m6_defenders true)
(ai_magically_see_players m6_defenders)
(set hunt 8)
(print ))
(if
(and
(volume_test_objects end_fight_ground
(players_current))
(< hunt 7))
(begin
(set hunt 7)
(object_teleport boss_stalk boss_ground)
(ai_force_active m6_defenders true)
(ai_magically_see_players m6_defenders)
(print ))
(if
(and
(volume_test_objects tvtp_top
(players_current))
(< hunt 5))
(begin
(set hunt 5)
(object_teleport boss_stalk tvtp_drop)
(ai_force_active m6_defenders true)
(ai_magically_see_players m6_defenders)
(print ))
(if
(and
(volume_test_objects militia_out_03
(players_current))
(< hunt 5))
(begin
(set hunt 6)
(object_teleport boss_stalk militia_drop)
(ai_force_active m6_defenders true)
(ai_magically_see_players m6_defenders)
(print ))))))))))))

(script continuous void zombie_spawner
(begin
(sleep_until big_boss_fight)
(sleep_until
(<
(ai_living_count z_crypt_04/zombie_c) 2))
(if
(objects_can_see_flag
(players_current) boss_battle 55.00)
(begin
(print i see flag))
(if
(not
(volume_test_objects fodder_volume
(players_current)))
(begin
(print i no see flag)
(ai_place z_crypt_04/zombie_c)
(ai_try_to_fight z_crypt_04/zombie_c m6_defenders))))))

(script continuous void escalators
(begin
(if
(volume_test_objects boss_escalator
(ai_actors m6_defenders))
(print )
(begin
(apply_impulse escalator_up escalator_up 0.09 0.13 effects\tubes\lift)
(apply_impulse escalator_down escalator_down 0.09 0.13 effects\tubes\lift)))))

(script continuous void falling_boss
(begin
(sleep_until
(volume_test_object boss_fall falling_boss) 1)
(if
(objects_can_see_flag
(players_current) boss_battle 30.00)
(object_teleport falling_boss boss_house)
(object_teleport falling_boss boss_top))))

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
(= jumbo_music false)) 1)
(sound_looping_start sound\music\hand_3\hand_3 none 1.00)
(sleep_until
(or
(= hand_music false)
(= jumbo_music true) hand_music) 1)
(sound_looping_stop sound\music\hand_3\hand_3)))

(script continuous void jumbo_music
(begin
(sleep_until
(= jumbo_music true) 1)
(if hand_music
(sleep 30))
(sound_looping_start sound\music\banjo\banjo none 0.85)
(sleep_until
(or
(= jumbo_music false) jumbo_music) 1)
(sound_looping_stop sound\music\banjo\banjo)))

(script static void unlockable_pickup
(begin
(damage_object equipment\hippo\hippo_pickup unlockable_pickup)
(if
(game_is_cooperative)
(damage_object equipment\hippo\hippo_pickup unlockable_pickup))))

(script static void stop_commentary
(begin
(sound_looping_stop sound\commentary\a60_maul\a60_maul_01)
(sound_looping_stop sound\commentary\a60_maul\a60_maul_02)
(sound_looping_stop sound\commentary\a60_maul\a60_maul_03)
(sound_looping_stop sound\commentary\a60_maul\a60_maul_04)))

(script dormant void unlock_comment_1
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_1) 0.00) 7) unlock_comment_1
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_1
(sound_looping_start sound\commentary\a60_maul\a60_maul_01 none 1.00)
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
(sound_looping_start sound\commentary\a60_maul\a60_maul_02 none 1.00)
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
(sound_looping_start sound\commentary\a60_maul\a60_maul_03 none 1.00)
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
(sound_looping_start sound\commentary\a60_maul\a60_maul_04 none 1.00)
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
(wake unlock_comment_4)))))

(script dormant void dialog
(begin
(sleep 12)
(sound_impulse_start sound\dialog\a60\20_otis_1 20_otis_1 1.00)
(sound_impulse_start sound\dialog\a60\20_jumbo_1 20_jumbo_1 1.00)))

(script static void a60_20_run
(begin
(fade_out 0.00 0.00 0.00 0) a60_20_run
(switch_bsp 1)
(sleep 2)
(sound_looping_predict sound\cinematics\a60\20_foley_1)
(object_teleport a60_20_run 20_hide_player)
(object_teleport a60_20_run 20_hide_player)
(object_teleport a60_20_run 20_hide_player)
(object_teleport a60_20_run 20_hide_player)
(object_activation_add_camera 20_01)
(sound_class_set_gain weapon_ready 0.00 0)
(sound_class_set_gain weapon_idle 0.00 0)
(sound_class_set_gain weapon_fire 0.00 0)
(object_create 20_stubbs_1)
(object_beautify 20_stubbs_1 true)
(object_create 20_jumbo_1)
(object_beautify 20_jumbo_1 true)
(object_create 20_otis_1)
(object_beautify 20_otis_1 true)
(sleep 30)
(sound_looping_start sound\cinematics\a60\20_foley_1 none 0.80)
(print a60_20:  chainsaw battle)
(camera_set 20_01 0)
(fade_in 0.00 0.00 0.00 0)
(sleep 45)
(recording_play 20_stubbs_1 20_stubbs_1)
(sound_class_set_gain weapon_ready 1.00 0)
(sound_class_set_gain weapon_fire 1.00 0)
(camera_set 20_02 60)
(sleep 75)
(recording_kill 20_stubbs_1)
(object_teleport 20_stubbs_1 20_stubbs_1)
(custom_animation 20_stubbs_1 cinematics\animations\stubbs\a60\a60 a60_10_stubbs_1 false)
(camera_set 20_03 0)
(sleep 30)
(camera_set 20_04
(unit_get_custom_animation_time 20_stubbs_1))
(sleep
(-
(unit_get_custom_animation_time 20_stubbs_1) 35.00))
(sound_impulse_start sound\sfx\weapons\shotgun\firing none 1.00)
(sleep 30)
(object_teleport 20_stubbs_1 20_stubbs_2)
(unit_stop_custom_animation 20_stubbs_1)
(sound_class_set_gain weapon_idle 1.00 0)
(custom_animation 20_otis_1 cinematics\animations\otis\a60\a60 a60_10_otis_1 false)
(custom_animation 20_jumbo_1 cinematics\animations\militia_large\a60\a60 a60_10_jumbo_1 false)
(wake dialog)
(camera_set 20_06 0)
(sleep 120)
(object_teleport 20_jumbo_1 20_jumbo_1)
(camera_set 20_07b 0)
(sleep 60)
(camera_set 20_07 270)
(sleep
(-
(sound_impulse_time sound\dialog\a60\20_jumbo_1) 20.00))
(fade_out 0.00 0.00 0.00 0)
(sleep 30) a60_20_run
(object_activation_clear)
(object_destroy_containing 20_)))

(script dormant void 30_foley
(begin
(inspect
(game_time))
(sound_looping_start sound\cinematics\a60\30_foley_1 none 0.80)))

(script static void a60_30_run
(begin
(fade_out 0.00 0.00 0.00 0) a60_30_run
(switch_bsp 0)
(sleep 1)
(object_activation_add_camera 30_01b)
(sound_class_set_gain vehicle_engine 0.00 0)
(sound_class_set_gain scripted_dialog_other 0.00 0)
(object_create 30_pickup_1)
(object_beautify 30_pickup_1 true)
(object_create 30_otis_1)
(object_beautify 30_otis_1 true)
(unit_set_weapon 30_otis_1 none)
(unit_enter_vehicle 30_otis_1 30_pickup_1 cr-driver)
(object_create 30_stubbs_1)
(object_beautify 30_stubbs_1 true)
(sleep 40)
(sound_looping_predict sound\cinematics\a60\30_foley_1)
(sleep 30)
(print a60_30:  otis's escape)
(camera_set 30_01b 0)
(fade_in 0.00 0.00 0.00 0)
(custom_animation 30_otis_1 cinematics\animations\otis\a60\a60 a60_20_otis_1 false)
(sleep 1)
(inspect
(game_time))
(sound_looping_start sound\cinematics\a60\30_foley_1 none 0.80)
(sleep 59)
(sound_class_set_gain vehicle_engine 1.00 0)
(camera_set 30_02 0)
(sound_impulse_start sound\dialog\a60\30_otis_1 30_otis_1 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\a60\30_otis_1) 20.00))
(recording_play 30_stubbs_1 30_stubbs_1b)
(sleep
(sound_impulse_time sound\dialog\a60\30_otis_1))
(camera_set 30_03 0)
(inspect
(game_time))
(sleep 30)
(camera_set 30_04b 60)
(sleep 30)
(camera_set 30_04 60)
(sleep 90)
(custom_animation 30_otis_1 cinematics\animations\otis\a60\a60 a60_20_otis_2 false)
(camera_set 30_02 0)
(sound_impulse_start sound\dialog\a60\30_otis_2 30_otis_1 1.00)
(print trying to start truck)
(sleep
(sound_impulse_time sound\dialog\a60\30_otis_2))
(object_destroy 30_stubbs_1)
(object_create 30_stubbs_2)
(object_beautify 30_stubbs_2 true)
(recording_play 30_stubbs_2 30_stubbs_2b)
(camera_set 30_05c 0)
(sleep 60)
(recording_play 30_pickup_1 30_pickup_2)
(camera_set 30_07 0)
(camera_set 30_07b 70)
(sound_impulse_start sound\dialog\a60\30_otis_3 30_otis_1 1.00)
(sleep 62)
(objects_attach 30_pickup_1 stubbsdrag 30_stubbs_2 body)
(sleep 128)
(camera_set 30_06 0)
(sleep 90)
(fade_out 0.00 0.00 0.00 60)
(sleep 60) a60_30_run
(object_activation_clear)
(object_destroy_containing 30_)
(sound_class_set_gain scripted_dialog_other 1.00 0)))

(script static void cutscenes_off
(begin
(set show_cutscenes false)))

(script startup void test
(begin
(if
(> test 0) test)
(if
(= test 20) test)
(if
(= test 30) test)))

(script static void preview
(begin preview preview preview))

(script static void next_cutscene
(begin
(map_name levels\b10_farm_house\b10_farm_house_cutscene)))