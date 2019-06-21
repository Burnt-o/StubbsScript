(global bool cutscene_running false)

(global bool stealth_msg false)

(global bool ready_to_flatch false)

(global short test_tutorial 0)

(global real guidebot_nav_point_height 0.45)

(global short hud_flash_timer 150)

(global short modal_help_timer 300)

(global bool fighting false)

(global bool flatching false)

(global bool waiting false)

(global short waiting_timeout 0)

(global long waiting_start 0)

(global bool whistle_gather false)

(global bool guidebot_post_training_chatter false)

(global bool ambient_monorail_on false)

(global bool marching_band_on false)

(global long marching_band_on_time
(* 30.00 30.00))

(global long marching_band_break_time
(* 30.00 60.00))

(global long marching_band_start_time 0)

(global bool sk_waiting false)

(global bool flatch_cop_talking false)

(global bool show_cutscenes false)

(global short test 0)

(global bool otis false)

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

(script static void a10_05
(begin
(fade_out 0.00 0.00 0.00 0)
(sound_looping_predict sound\cinematics\a10\05_foley_1) a10_05
(object_activation_add_camera 05_01)
(sleep 30)
(sound_looping_start sound\cinematics\a10\05_foley_1 none 0.00)
(print a10_05:  credits)
(camera_set 05_01 0)
(fade_in 0.00 0.00 0.00 0)
(sleep 60)
(fade_out 0.00 0.00 0.00 0) a10_05
(object_activation_clear)
(object_destroy_containing 05_)))

(script static void a10_10
(begin
(if
(= show_cutscenes true) a10_10)))

(script static void a10_50
(begin
(if
(= show_cutscenes true) a10_50)))

(script static void cutscenes_on
(begin
(set show_cutscenes true)))

(script static void wake_up_second_bsp_scripts
(begin
(wake plaza_mid_point_script)
(wake plaza_left_script)
(wake plaza_right_script)
(wake left_spawn1_script)
(wake center_spawn1_script)
(wake right_spawn1_script)))

(script static void game_save_pmc
(begin
(game_save_cancel)
(game_save_no_timeout)))

(script static void fighting_on
(begin
(ai_braindead zombies false)
(set fighting true)))

(script static void fighting_off
(begin
(set fighting false)))

(script continuous void keep_zombies_alive
(begin
(objects_cannot_take_damage
(ai_actors zombies) true)
(objects_cannot_lose_regions
(ai_actors zombies) true)))

(script continuous void keep_the_peace
(begin
(sleep 11)
(if
(= fighting false)
(begin
(ai_set_disguise_known citizens2 zombie false)
(ai_set_disguise_knowable citizens2 zombie false)
(ai_set_disguise_known ted_n_judy zombie false)
(ai_set_disguise_knowable ted_n_judy zombie false)
(ai_set_disguise_known tutorial_cops zombie false)
(ai_set_disguise_knowable tutorial_cops zombie false)
(ai_set_disguise_known tutorial_flatch zombie false)
(ai_set_disguise_knowable tutorial_flatch zombie false)
(ai_set_disguise_known drivers zombie false)
(ai_set_disguise_knowable drivers zombie false)
(ai_braindead zombies true)))))

(script dormant void gate_navpoint
(begin
(sleep 4000)
(activate_nav_point_flag default gate_navpoint gate_nav_flag 0.00)
(activate_nav_point_flag default gate_navpoint gate_nav_flag 0.00)))

(script static void gate_navpoint_off
(begin
(sleep -1 gate_navpoint)
(deactivate_nav_point_flag gate_navpoint_off gate_nav_flag)
(deactivate_nav_point_flag gate_navpoint_off gate_nav_flag)))

(script continuous void monorail_loop
(begin
(if ambient_monorail_on
(begin
(device_set_position ambient_monorail 1.00)
(sleep
(* 30.00
(random_range 20 40)))
(object_create_anew ambient_monorail)
(device_set_position_immediate ambient_monorail 0.60)
(device_set_position ambient_monorail 0.00)
(sleep
(* 30.00
(random_range 20 40)))
(sleep
(* 30.00 5.00))))))

(script continuous void marching_band_flair
(begin
(if marching_band_on
(begin
(sound_looping_start sound\sfx\ambience\a10_plaza\marching_band plaza_gate 0.50)
(set marching_band_start_time
(game_time))
(sleep_until
(or
(= marching_band_on false)
(>
(-
(game_time) marching_band_start_time) marching_band_on_time)))
(sound_looping_stop sound\sfx\ambience\a10_plaza\marching_band)
(sleep marching_band_break_time)))))

(script static void waiting_on
(begin
(set waiting_start
(game_time))
(set waiting_timeout
(random_range
(* 30.00 10.00)
(* 30.00 30.00)))
(set waiting true)))

(script static void waiting_off
(begin
(set waiting false)
(sound_impulse_stop sound\dialog\a10\se_guidebot_comeback)))

(script continuous void summon_player
(begin
(if waiting
(begin
(if
(>
(-
(game_time) waiting_start) waiting_timeout)
(begin
(sound_impulse_start sound\dialog\a10\se_guidebot_comeback
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(set waiting_start
(game_time))))))))

(script static void waypoint_on
(begin
(activate_nav_point_object guidebot waypoint_on
(list_get
(ai_actors tutorial_bot/guidebot) 0) guidebot_nav_point_height)
(activate_nav_point_object guidebot waypoint_on
(list_get
(ai_actors tutorial_bot/guidebot) 0) guidebot_nav_point_height)
(print waypoint on)))

(script static void waypoint_off
(begin
(deactivate_nav_point_object waypoint_off
(list_get
(ai_actors tutorial_bot/guidebot) 0))
(deactivate_nav_point_object waypoint_off
(list_get
(ai_actors tutorial_bot/guidebot) 0))
(print waypoint off)))

(script continuous void woozy_ted
(begin
(custom_animation
(unit
(list_get
(ai_actors ted_n_judy/ted) 0)) cinematics\animations\ted\a10\a10 stand unarmed expire true)
(sleep 157)))

(script startup void park_woozy_ted
(begin
(sleep -1 woozy_ted)))

(script dormant void stealth_kill_hud_tip_on
(begin
(print stealth_kill_hud_tip_on)
(show_hud_help_text true)
(hud_set_help_text stealthkill)
(sleep modal_help_timer)
(hud_set_help_text blank)
(sleep 2)
(display_scenario_help 5)
(sleep 2)
(show_hud_help_text true)
(hud_set_help_text stealthkill)
(sleep -1)))

(script static void stealth_kill_hud_tip_off
(begin
(print steal_kill_hud_tip_off)
(sleep -1 stealth_kill_hud_tip_on)
(enable_hud_help_flash false)
(hud_set_help_text blank)))

(script dormant void melee_hud_tip_on
(begin
(print melee_hud_tip_on)
(show_hud_help_text true)
(hud_set_help_text melee)
(sleep modal_help_timer)
(hud_set_help_text blank)
(sleep 2)
(display_scenario_help 1)
(sleep 2)
(show_hud_help_text true)
(hud_set_help_text melee)
(sleep -1)))

(script static void melee_hud_tip_off
(begin
(print melee_hud_tip_off)
(sleep -1 melee_hud_tip_on)
(enable_hud_help_flash false)
(hud_set_help_text blank)))

(script dormant void finishing_hud_tip_on
(begin
(print finishing_hud_tip_on)
(show_hud_help_text true)
(hud_set_help_text finishing)
(sleep modal_help_timer)
(hud_set_help_text blank)
(sleep 2)
(display_scenario_help 2)
(sleep 2)
(show_hud_help_text true)
(hud_set_help_text finishing)
(sleep -1)))

(script static void finishing_hud_tip_off
(begin
(print finishing_hud_tip_off)
(sleep -1 finishing_hud_tip_on)
(enable_hud_help_flash false)
(hud_set_help_text blank)))

(script dormant void moving_hud_tip_on
(begin
(print moving_hud_tip_on)
(show_hud_help_text true)
(hud_set_help_text moving)
(sleep
(sound_impulse_time sound\dialog\a10\se_guidebot_4))
(sleep 90)
(hud_set_help_text blank)
(sleep 2)
(display_scenario_help 4)
(sleep 2)
(sleep
(sound_impulse_time sound\dialog\a10\se_guidebot_5))
(show_hud_help_text true)
(hud_set_help_text moving)
(sleep -1)))

(script static void moving_hud_tip_off
(begin
(print moving_hud_tip_off)
(sleep -1 moving_hud_tip_on)
(enable_hud_help_flash false)
(hud_set_help_text blank)))

(script dormant void looking_hud_tip_on
(begin
(print looking_hud_tip_on)
(show_hud_help_text true)
(hud_set_help_text looking)
(sleep modal_help_timer)
(hud_set_help_text blank)
(sleep 2)
(display_scenario_help 3)
(sleep 2)
(show_hud_help_text true)
(hud_set_help_text looking)
(sleep -1)))

(script static void looking_hud_tip_off
(begin
(print looking_hud_tip_off)
(sleep -1 looking_hud_tip_on)
(enable_hud_help_flash false)
(hud_set_help_text blank)))

(script dormant void flatch_hud_tip_on
(begin
(print flatch_hud_tip_on)
(show_hud_help_text true)
(hud_set_help_text flatch)
(hud_show_special_attack 0 false)
(sleep modal_help_timer)
(hud_set_help_text blank)
(sleep 2)
(display_scenario_help 6)
(sleep 2)
(display_scenario_help 7)
(sleep 2)
(show_hud_help_text true)
(hud_set_help_text flatch)
(sleep -1)))

(script static void flatch_hud_tip_off
(begin
(print flatch_hud_tip_off)
(sleep -1 flatch_hud_tip_on)
(enable_hud_help_flash false)
(hud_set_help_text blank)))

(script dormant void post_flatch_hud_tip_on
(begin
(print post_flatch_hud_tip_on)
(show_hud_help_text true)
(hud_set_help_text postflatch)
(sleep -1)))

(script static void post_flatch_hud_tip_off
(begin
(print post_flatch_hud_tip_off)
(sleep -1 post_flatch_hud_tip_on)
(enable_hud_help_flash false)
(show_hud_help_text true)
(hud_set_help_text blank)))

(script dormant void whistle_hud_tip_on
(begin
(print whistle_hud_tip_on)
(show_hud_help_text true)
(hud_set_help_text whistlea)
(sleep modal_help_timer)
(hud_set_help_text blank)
(sleep 2)
(display_scenario_help 8)
(sleep 2)
(display_scenario_help 9)
(sleep 2)
(show_hud_help_text true)
(hud_set_help_text whistlea)
(sleep -1)))

(script static void whistle_hud_tip_off
(begin
(print whistle_hud_tip_off)
(sleep -1 whistle_hud_tip_on)
(enable_hud_help_flash false)
(show_hud_help_text false)))

(script dormant void whistle_hud_tip2_on
(begin
(print whistle_hud_tip2_on)
(show_hud_help_text false)
(sleep modal_help_timer)
(hud_set_help_text blank)
(show_hud_help_text true)
(sleep 2)
(display_scenario_help 10)
(sleep 2)
(show_hud_help_text false)
(sleep -1)))

(script static void whistle_hud_tip2_off
(begin
(print whistle_hud_tip2_off)
(sleep -1 whistle_hud_tip2_on)
(enable_hud_help_flash false)
(show_hud_help_text true)
(hud_set_help_text blank)))

(script dormant void shove_hud_tip_on
(begin
(print shove_hud_tip_on)
(show_hud_help_text true)
(hud_set_help_text shove1)
(sleep modal_help_timer)
(show_hud_help_text true)
(hud_set_help_text blank)
(sleep 2)
(display_scenario_help 11)
(sleep 2)
(show_hud_help_text true)
(hud_set_help_text shove1)
(sleep -1)))

(script static void shove_hud_tip_off
(begin
(print shove_hud_tip_off)
(sleep -1 shove_hud_tip_on)
(enable_hud_help_flash false)
(show_hud_help_text true)
(hud_set_help_text blank)))

(script dormant void shove_hud_tip2_on
(begin
(print shove_hud_tip2_on)
(show_hud_help_text true)
(hud_set_help_text shove2)
(sleep modal_help_timer)
(show_hud_help_text true)
(hud_set_help_text blank)
(sleep 2)
(display_scenario_help 11)
(sleep 2)
(display_scenario_help 12)
(sleep 2)
(show_hud_help_text true)
(hud_set_help_text shove2)
(sleep -1)))

(script static void shove_hud_tip2_off
(begin
(print shove_hud_tip2_off)
(sleep -1 shove_hud_tip2_on)
(enable_hud_help_flash false)
(show_hud_help_text true)
(hud_set_help_text blank)))

(script dormant void exit_hud_tip_on
(begin
(sleep 2)
(sleep -1)))

(script static void exit_hud_tip_off
(begin
(sleep -1 whistle_hud_tip_on)
(enable_hud_help_flash false)
(show_hud_help_text false)))

(script dormant void turn_off_moving_message
(begin
(sleep_until
(=
(volume_test_objects player_moved
(players_current)) false)) turn_off_moving_message))

(script continuous void show_stealth_message
(begin
(if stealth_msg
(begin
(sleep_until
(volume_test_objects stealthkill_waypoint
(players_current)))
(if
(=
(ai_living_fraction tutorial_cops) 1.00)
(begin
(wake stealth_kill_hud_tip_on)))
(sleep_until
(or
(=
(volume_test_objects stealthkill_waypoint
(players_current)) false)
(<
(ai_living_fraction tutorial_cops) 1.00)))
(if
(<
(ai_living_fraction tutorial_cops) 1.00)
(begin
(set stealth_msg false) show_stealth_message))))))

(script dormant void erase_judy
(begin
(sleep_until
(=
(ai_command_list_status
(ai_actors ted_n_judy/judy)) 1))
(ai_erase ted_n_judy/judy)))

(script static void melee_training
(begin
(player_enable_input false)
(objects_cannot_take_damage
(ai_actors tutorial_bot/guidebot) true)
(objects_cannot_take_damage
(ai_actors bots) true)
(objects_cannot_die
(ai_actors tutorial_bot/guidebot) true)
(ai_enable_communication tutorial_bot false)
(ai_enable_communication citizens2 false)
(print melee training) melee_training
(ai_command_list ted_n_judy/ted ted_rush_stubbs)
(sleep
(* 30.00 3.00))
(sound_impulse_start sound\dialog\a10\10_ted_2
(list_get
(ai_actors ted_n_judy/ted) 0) 1.00)
(sleep_until
(=
(ai_command_list_status
(ai_actors ted_n_judy/ted)) 2)) melee_training
(ai_look_at_object
(unit
(list_get
(ai_actors ted_n_judy/ted) 0))
(list_get
(players_current) 0))
(objects_cannot_take_damage
(ai_actors ted_n_judy/ted) true)
(objects_cannot_lose_regions
(ai_actors ted_n_judy/ted) true)
(camera_control false 90)
(wake melee_hud_tip_on)
(player_action_test_reset)
(sleep_until
(player_action_test_melee) 1) melee_training
(magic_melee_attack)
(sleep 15)
(wake woozy_ted)
(sleep 10)
(ai_command_list ted_n_judy/judy judy_surprise)
(sound_impulse_start sound\dialog\plaza\judy\my_goodness
(list_get
(ai_actors ted_n_judy/judy) 0) 1.00)))

(script static void braineat_training
(begin
(print brain eat training)
(ai_command_list tutorial_bot/guidebot tutorial_bot_braineat)
(sleep
(* 30.00 2.00))
(sound_impulse_start sound\dialog\a10\se_guidebot_1
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_guidebot_1))
(sleep 30)
(wake finishing_hud_tip_on)
(player_action_test_reset)
(sleep_until
(player_action_test_action) 1) braineat_training
(sleep -1 woozy_ted) braineat_training
(objects_cannot_take_damage
(ai_actors ted_n_judy/ted) false)
(unit_finishing_move braineat_training)
(sleep 30) braineat_training
(ai_set_current_state ted_n_judy/judy alert)
(ai_command_list ted_n_judy/judy judy_flee)
(wake erase_judy)
(sound_impulse_start sound\dialog\plaza\judy\scream_short
(list_get
(ai_actors ted_n_judy/judy) 0) 1.00)
(sleep 30)
(ai_look_at_object
(unit
(list_get
(ai_actors tutorial_bot/guidebot) 0))
(list_get
(players_current) 0))
(sleep
(* 30.00 3.00))
(sound_impulse_start sound\dialog\a10\se_guidebot_2
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_guidebot_2))
(recording_play braineat_training left_turn_3)
(sound_impulse_start sound\dialog\a10\se_stubbs_1 none 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_stubbs_1))
(sleep 30)
(sound_impulse_start sound\dialog\a10\se_guidebot_3
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_guidebot_3))))

(script static void looking_training
(begin
(print camera look training)
(wake looking_hud_tip_on)
(player_action_test_reset)
(sleep_until
(player_action_test_look_relative_all_directions)) looking_training))

(script static void movement_training
(begin
(print movement training)
(sound_impulse_start sound\dialog\a10\se_guidebot_4
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_guidebot_4))
(sound_impulse_start sound\dialog\a10\se_guidebot_34
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(ai_stop_looking
(unit
(list_get
(ai_actors tutorial_bot/guidebot) 0)))
(ai_command_list tutorial_bot/guidebot tutorial_bot_movement)
(sleep 30)
(player_enable_input true)
(sleep 15) movement_training
(ai_command_list tutorial_bot/guidebot tutorial_bot_movement)
(sleep
(sound_impulse_time sound\dialog\a10\se_guidebot_34))
(sleep 15)
(wake moving_hud_tip_on)
(wake turn_off_moving_message)
(sleep 15)
(sound_impulse_start sound\dialog\a10\se_guidebot_5
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(sleep_until
(or
(=
(ai_command_list_status
(ai_actors tutorial_bot/guidebot)) 1)
(volume_test_objects stealthkill_waypoint
(players_current))) 1)
(ai_look_at_object
(unit
(list_get
(ai_actors tutorial_bot/guidebot) 0))
(list_get
(players_current) 0)) movement_training
(sleep_until
(or
(volume_test_objects movement_waypoint
(players_current))
(volume_test_objects stealthkill_waypoint
(players_current))) 1) movement_training movement_training
(if
(volume_test_objects movement_waypoint
(players_current))
(begin
(sound_impulse_start sound\dialog\a10\se_guidebot_7
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(sleep_until
(or
(<
(sound_impulse_time sound\dialog\a10\se_guidebot_7) 30)
(volume_test_objects stealthkill_waypoint
(players_current))) 1)
(ai_stop_looking
(unit
(list_get
(ai_actors tutorial_bot/guidebot) 0)))
(ai_command_list tutorial_bot/guidebot tutorial_bot_commotion)
(sleep_until
(or
(=
(ai_command_list_status
(ai_actors tutorial_bot/guidebot)) 1)
(volume_test_objects stealthkill_waypoint
(players_current))) 1)
(ai_look_at_object
(unit
(list_get
(ai_actors tutorial_bot/guidebot) 0))
(list_get
(players_current) 0)) movement_training movement_training))))

(script static void stealth_kill_cutscene
(begin
(sound_looping_predict sound\music\a40\cop_theme)
(fade_out 0.00 0.00 0.00 15)
(sleep 15) stealth_kill_cutscene
(unit_custom_animation_at_frame
(unit
(list_get
(ai_actors tutorial_cops/dupe) 0)) cinematics\animations\beat_cop\a10\a10 plaza_beatcop_1 true 120)
(camera_set stealth_kill_1 0)
(sound_looping_start sound\music\a40\cop_theme none 0.50)
(fade_in 0.00 0.00 0.00 15)
(camera_set stealth_kill_2 300)
(object_teleport
(list_get
(ai_actors tutorial_bot/guidebot) 0) stealth_kill_guidebot)
(object_teleport stealth_kill_cutscene stealth_kill_stubbs)
(ai_braindead tutorial_cops false)
(ai_look_at_object
(unit
(list_get
(ai_actors tutorial_bot/guidebot) 0))
(list_get
(ai_actors tutorial_cops/dupe) 0))
(sound_impulse_start sound\dialog\a10\se_guidebot_sk_1
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_guidebot_sk_1))
(sound_impulse_start sound\dialog\a10\se_dupe_sk_1
(list_get
(ai_actors tutorial_cops/dupe) 0) 1.00)
(sleep 30)
(ai_look_at_object
(unit
(list_get
(ai_actors tutorial_cops/dupe) 0)) stealth_kill_cutscene)
(sleep
(sound_impulse_time sound\dialog\a10\se_dupe_sk_1))
(camera_set stealth_kill_3 0)
(sound_impulse_start sound\dialog\a10\se_guidebot_sk_2
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_guidebot_sk_2))
(camera_set stealth_kill_4 0)
(camera_set stealth_kill_4d 240)
(ai_look_at_object
(unit
(list_get
(ai_actors tutorial_cops/dupe) 0))
(list_get
(ai_actors tutorial_bot/guidebot) 0))
(sound_impulse_start sound\dialog\a10\se_dupe_sk_2
(list_get
(ai_actors tutorial_cops/dupe) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_dupe_sk_2))
(custom_animation
(unit
(list_get
(ai_actors tutorial_cops/hannity) 0)) cinematics\animations\beat_cop\a10\a10 hannity_plaza_beatcop_1 false)
(camera_set stealth_kill_4b 10)
(sound_impulse_start sound\dialog\a10\se_hannity_sk_1
(list_get
(ai_actors tutorial_cops/hannity) 0) 1.00)
(sleep 10)
(unit_stop_custom_animation
(unit
(list_get
(ai_actors tutorial_cops/dupe) 0)))
(sleep
(-
(sound_impulse_time sound\dialog\a10\se_hannity_sk_1) 10.00))
(custom_animation
(unit
(list_get
(ai_actors tutorial_cops/dupe) 0)) cinematics\animations\beat_cop\a10\a10 plaza_beatcop_3 false)
(camera_set stealth_kill_4a 10)
(sleep 12)
(camera_set stealth_kill_4c 390)
(ai_look_at_object
(unit
(list_get
(ai_actors tutorial_cops/dupe) 0)) stealth_kill_cutscene)
(sound_impulse_start sound\dialog\a10\se_dupe_sk_3
(list_get
(ai_actors tutorial_cops/dupe) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_dupe_sk_3))
(ai_look_at_object
(unit
(list_get
(ai_actors tutorial_cops/dupe) 0)) cop_car)
(ai_look_at_object
(unit
(list_get
(ai_actors tutorial_cops/hannity) 0)) cop_car)
(camera_set stealth_kill_1 0)
(sound_impulse_start sound\dialog\a10\se_guidebot_sk_3
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_guidebot_sk_3))
(sound_impulse_start sound\dialog\a10\se_dupe_sk_4
(list_get
(ai_actors tutorial_cops/dupe) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_dupe_sk_4))
(sleep 30)
(sound_looping_stop sound\music\a40\cop_theme) stealth_kill_cutscene
(image_effect_set image_effects\technicolor)
(sound_impulse_start sound\dialog\a10\se_guidebot_11_c
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(set stealth_msg true)))

(script continuous void sk_waiting_dialog
(begin
(if sk_waiting
(begin
(sleep
(* 30.00
(random_range 2 4)))
(sound_impulse_start sound\dialog\a10\se_dupe_sk_waiting
(list_get
(ai_actors tutorial_cops/dupe) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_dupe_sk_waiting))
(sleep
(* 30.00
(random_range 2 4)))
(sound_impulse_start sound\dialog\a10\se_hannity_sk_waiting
(list_get
(ai_actors tutorial_cops/hannity) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_hannity_sk_waiting))))))

(script static void stop_sk_waiting_dialog
(begin
(set sk_waiting false)
(sleep -1 sk_waiting_dialog)
(sound_impulse_stop sound\dialog\a10\se_dupe_sk_waiting)
(sound_impulse_stop sound\dialog\a10\se_hannity_sk_waiting)))

(script dormant void start_sk_hey_dialog
(begin
(if
(>
(ai_living_count tutorial_cops/dupe) 0)
(begin
(sound_impulse_start sound\dialog\a10\se_dupe_sk_hey
(list_get
(ai_actors tutorial_cops/dupe) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_dupe_sk_hey))))
(if
(>
(ai_living_count tutorial_cops/hannity) 0)
(begin
(sound_impulse_start sound\dialog\a10\se_hannity_sk_hey
(list_get
(ai_actors tutorial_cops/hannity) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_hannity_sk_hey))))
(sleep
(* 30.00
(random_range 2 4)))
(if
(>
(ai_living_count tutorial_cops/dupe) 0)
(begin
(sound_impulse_start sound\dialog\a10\se_dupe_sk_hey
(list_get
(ai_actors tutorial_cops/dupe) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_dupe_sk_hey))))
(if
(>
(ai_living_count tutorial_cops/hannity) 0)
(begin
(sound_impulse_start sound\dialog\a10\se_hannity_sk_hey
(list_get
(ai_actors tutorial_cops/hannity) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_hannity_sk_hey))))
(sleep
(* 30.00
(random_range 2 4)))
(if
(>
(ai_living_count tutorial_cops/dupe) 0)
(begin
(sound_impulse_start sound\dialog\a10\se_dupe_sk_hey
(list_get
(ai_actors tutorial_cops/dupe) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_dupe_sk_hey))))
(if
(>
(ai_living_count tutorial_cops/hannity) 0)
(begin
(sound_impulse_start sound\dialog\a10\se_hannity_sk_hey
(list_get
(ai_actors tutorial_cops/hannity) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_hannity_sk_hey))))))

(script static void stealthkill_training
(begin
(print stealth kill training)
(sleep_until
(or
(volume_test_objects guidebot_waypoint
(players_current))
(volume_test_objects stealthkill_waypoint
(players_current))) 1) stealthkill_training
(if
(volume_test_objects guidebot_waypoint
(players_current))
(begin
(sound_impulse_start sound\dialog\a10\se_guidebot_8
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(sleep_until
(or
(<
(sound_impulse_time sound\dialog\a10\se_guidebot_8) 2)
(volume_test_objects stealthkill_waypoint
(players_current))) 1)))
(ai_stop_looking
(unit
(list_get
(ai_actors tutorial_bot/guidebot) 0)))
(ai_command_list tutorial_bot/guidebot tutorial_bot_stealthkill)
(sleep_until
(volume_test_objects stealthkill_waypoint
(players_current)) 1) stealthkill_training stealthkill_training
(ai_braindead tutorial_cops true)
(objects_cannot_take_damage
(ai_actors tutorial_cops) false)
(objects_cannot_be_finished
(ai_actors tutorial_cops) false)
(ai_stop_looking
(unit
(list_get
(ai_actors tutorial_bot/guidebot) 0)))
(ai_command_list tutorial_bot/guidebot tutorial_bot_stealthkill_02)
(set sk_waiting true)
(sleep_until
(<
(ai_living_fraction tutorial_cops) 1.00) 1) stealthkill_training stealthkill_training
(wake start_sk_hey_dialog)
(set stealth_msg false)
(ai_command_list tutorial_cops stealthkill_freakout) stealthkill_training))

(script dormant void flatch_cop_dialog
(begin
(sleep 30)
(sound_impulse_start sound\dialog\a10\se_cop_flatch_3
(list_get
(ai_actors tutorial_flatch/cop_car_2) 0) 1.00)
(sleep 15)
(sound_impulse_start sound\dialog\a10\se_cop_flatch_2
(list_get
(ai_actors tutorial_flatch/cop_car_2) 1) 1.00)
(sleep -1)
(sound_impulse_start sound\dialog\a10\se_cop_flatch_1
(list_get
(ai_actors tutorial_flatch/cop_car_3) 0) 1.00)
(sleep 40)
(sound_impulse_start sound\dialog\a10\se_cop_flatch_4
(list_get
(ai_actors tutorial_flatch/cop_car_3) 1) 1.00)))

(script dormant void cop_cars_pull_up
(begin
(object_create cop_car_2)
(object_create cop_car_3)
(unit_set_enterable_by_player cop_car_2 false)
(unit_set_enterable_by_player cop_car_3 false)
(ai_place tutorial_flatch)
(unit_enter_vehicle_now
(unit
(list_get
(ai_actors tutorial_flatch/cop_car_2) 0)) cop_car_2 cr-driver)
(unit_enter_vehicle_now
(unit
(list_get
(ai_actors tutorial_flatch/cop_car_2) 1)) cop_car_2 cr-passenger)
(unit_enter_vehicle_now
(unit
(list_get
(ai_actors tutorial_flatch/cop_car_3) 0)) cop_car_3 cr-driver)
(unit_enter_vehicle_now
(unit
(list_get
(ai_actors tutorial_flatch/cop_car_3) 1)) cop_car_3 cr-passenger)
(recording_play cop_car_2 cop_car_2)
(recording_play cop_car_3 cop_car_3)
(sleep
(recording_time cop_car_2))
(vehicle_unload cop_car_2 )
(sleep
(recording_time cop_car_3))
(vehicle_unload cop_car_3 )
(objects_cannot_lose_regions
(ai_actors tutorial_flatch) true)
(ai_command_list_by_unit
(unit
(list_get
(ai_actors tutorial_flatch/cop_car_2) 1)) flatch_cops_01)
(ai_command_list_by_unit
(unit
(list_get
(ai_actors tutorial_flatch/cop_car_2) 0)) flatch_cops_02)
(ai_command_list_by_unit
(unit
(list_get
(ai_actors tutorial_flatch/cop_car_3) 1)) flatch_cops_03)
(ai_command_list_by_unit
(unit
(list_get
(ai_actors tutorial_flatch/cop_car_3) 0)) flatch_cops_04)
(sleep_until
(=
(ai_command_list_status
(ai_actors tutorial_flatch)) 2))
(wake flatch_cop_dialog)
(ai_command_list_advance tutorial_flatch)
(set ready_to_flatch true)))

(script static void flatch_training
(begin
(print flatch training)
(wake cop_cars_pull_up)
(ai_stop_looking
(unit
(list_get
(ai_actors tutorial_bot/guidebot) 0)))
(ai_command_list tutorial_bot/guidebot tutorial_bot_flatch)
(sleep_until
(=
(ai_command_list_status
(ai_actors tutorial_bot/guidebot)) 1))
(ai_look_at_object
(unit
(list_get
(ai_actors tutorial_bot/guidebot) 0))
(list_get
(players_current) 0)) flatch_training flatch_training
(sleep_until
(volume_test_objects flatch_waypoint
(players_current)) 1) flatch_training flatch_training
(player_enable_input false)
(sleep_until ready_to_flatch)
(sleep 90)
(sound_impulse_start sound\dialog\a10\se_guidebot_11
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\a10\se_guidebot_11) 60.00))
(ai_command_list tutorial_bot/guidebot tutorial_bot_flatch_stand_back)
(sleep
(* 30.00 3.00))
(wake flatch_cop_dialog)
(player_set_profile flatch_training flatch true)
(if
(game_is_cooperative)
(player_set_profile flatch_training flatch true))
(hud_show_health false)
(show_hud true)
(wake flatch_hud_tip_on)
(player_action_test_reset)
(sleep_until
(player_action_test_flatulence) 1) flatch_training flatch_training
(unit_special_attack_animated flatch_training 0)
(player_enable_input true)
(sleep 60)
(wake post_flatch_hud_tip_on)
(sleep
(* 30.00 10.00)) flatch_training flatch_training
(sound_impulse_start sound\dialog\a10\se_guidebot_12
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_guidebot_12))))

(script continuous void whistle_gather_cmd
(begin
(if whistle_gather
(begin
(ai_command_list zombies gather_zombies_for_whistle)
(sleep 30)))))

(script static void whistle_training
(begin
(print whistle training)
(ai_stop_looking
(unit
(list_get
(ai_actors tutorial_bot/guidebot) 0)))
(ai_command_list tutorial_bot/guidebot tutorial_bot_whistle)
(if
(=
(ai_living_count zombies) 0)
(begin
(ai_attach extra_zombie_1 zombies)
(ai_attach extra_zombie_2 zombies)
(ai_attach extra_zombie_3 zombies)))
(set whistle_gather true)
(sleep_until
(=
(ai_command_list_status
(ai_actors tutorial_bot/guidebot)) 1))
(ai_look_at_object
(unit
(list_get
(ai_actors tutorial_bot/guidebot) 0))
(list_get
(players_current) 0)) whistle_training
(sleep_until
(volume_test_objects whistle_waypoint
(players_current))) whistle_training
(sleep_until
(volume_test_objects whistle_target
(ai_actors zombies)))
(player_set_weapons whistle_training normal true)
(player_set_weapons whistle_training normal true)
(sound_impulse_start sound\dialog\a10\se_guidebot_whistle_1
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_guidebot_whistle_1))
(wake whistle_hud_tip_on)
(player_action_test_reset)
(sleep_until
(player_action_test_whistle_enabled)) whistle_training
(sound_impulse_start sound\dialog\a10\se_guidebot_whistle_2
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(wake whistle_hud_tip2_on)
(set whistle_gather false)
(sleep_until
(player_action_test_whistle)) whistle_training
(sleep 45)
(sound_impulse_start sound\dialog\a10\se_guidebot_whistle_3
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_guidebot_whistle_3))))

(script static void shove_training
(begin
(print shove training)
(ai_command_list zombies gather_zombies_for_shove1)
(ai_command_list_by_unit
(unit
(list_get
(ai_actors zombies) 0)) gather_zombies_for_shove2)
(ai_command_list_by_unit
(unit
(list_get
(ai_actors zombies) 1)) gather_zombies_for_shove3)
(ai_command_list_by_unit
(unit
(list_get
(ai_actors zombies) 2)) gather_zombies_for_shove4)
(ai_stop_looking
(unit
(list_get
(ai_actors tutorial_bot/guidebot) 0)))
(ai_command_list tutorial_bot/guidebot tutorial_bot_shove)
(sleep_until
(=
(ai_command_list_status
(ai_actors tutorial_bot/guidebot)) 1))
(ai_look_at_object
(unit
(list_get
(ai_actors tutorial_bot/guidebot) 0))
(list_get
(players_current) 0)) shove_training
(sleep_until
(volume_test_objects shove_waypoint
(players_current))) shove_training
(sound_impulse_start sound\dialog\a10\se_guidebot_shove_1
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_guidebot_shove_1))
(wake shove_hud_tip_on)
(player_action_test_reset)
(sleep_until
(player_action_test_shove_enabled))
(sound_impulse_start sound\dialog\a10\se_guidebot_shove_2
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00) shove_training
(wake shove_hud_tip2_on)
(player_action_test_reset)
(sleep_until
(player_action_test_shove)) shove_training
(sleep 5)
(sound_impulse_start sound\dialog\a10\se_guidebot_shove_3
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_guidebot_shove_3))))

(script static void health_training
(begin
(ai_stop_looking
(unit
(list_get
(ai_actors tutorial_bot/guidebot) 0)))
(ai_command_list tutorial_bot/guidebot tutorial_health)
(sleep_until
(=
(ai_command_list_status
(ai_actors tutorial_bot/guidebot)) 1))
(ai_look_at_object
(unit
(list_get
(ai_actors tutorial_bot/guidebot) 0))
(list_get
(players_current) 0)) health_training
(sleep_until
(volume_test_objects health_waypoint
(players_current))) health_training
(player_enable_input false)
(ai_look_at_object
(unit
(list_get
(ai_actors tutorial_bot/guidebot) 0))
(list_get
(players_current) 0))
(sound_impulse_start sound\sfx\ui\hud_special_ability none 1.00)
(hud_show_health true)
(hud_blink_health true)
(sleep 30)
(sound_impulse_start sound\dialog\a10\se_guidebot_health_1
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\a10\se_guidebot_health_1) 60.00))
(ai_stop_looking
(unit
(list_get
(ai_actors tutorial_bot/guidebot) 0)))
(ai_command_list tutorial_bot/guidebot tutorial_bot_health_hit)
(sleep 50)
(damage_object cinematics\effects\a10\guidebot_hit health_training)
(hud_blink_health false)
(player_set_profile health_training no_health true)
(damage_object characters\beat_cop\taser_melee health_training)
(sleep
(* 30.00 5.00))
(player_enable_input true)
(sound_impulse_start sound\dialog\a10\se_guidebot_health_2
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\se_guidebot_health_2))))

(script dormant void trigger_to_greenhouse_script
(begin
(sleep_until
(volume_test_objects trigger_to_greenhouse
(players_current)))
(print have fun at the greenhouse!!!) trigger_to_greenhouse_script
(fade_out 0.00 0.00 0.00
(* 30.00 2.00))
(sleep
(* 30.00 2.00))
(if trigger_to_greenhouse_script trigger_to_greenhouse_script) trigger_to_greenhouse_script
(game_won)))

(script static void setup_for_second_bsp
(begin
(sleep -1 tutorial)
(sleep -1 melee_training)
(sleep -1 braineat_training)
(sleep -1 looking_training)
(sleep -1 movement_training)
(sleep -1 stealthkill_training)
(sleep -1 flatch_training)
(sleep -1 whistle_training)
(sleep -1 shove_training)
(object_teleport setup_for_second_bsp flag_plaza)
(object_teleport setup_for_second_bsp flag_plaza_p2)
(ai_place tutorial_bot_city_hall)
(objects_cannot_take_damage
(ai_actors tutorial_bot_city_hall) true)
(ai_place citizens_plaza)
(ai_place cops_plaza/cops_plaza01)
(ai_place zombies_plaza)
(ai_set_disguise_known citizens_plaza zombie false)
(ai_set_disguise_known cops_plaza zombie false)
(ai_set_disguise_knowable citizens_plaza zombie false)
(ai_set_disguise_knowable cops_plaza zombie false)
(game_save) setup_for_second_bsp
(show_hud true)
(wake trigger_to_greenhouse_script)
(wake plaza_dudes_know_of_stubbs)))

(script dormant void plaza_flatch_tip
(begin
(player_action_test_reset)
(sleep_until
(player_action_test_flatulence) 1)
(show_hud_help_text true)
(hud_set_help_text plazaflatch)
(sleep
(* 30.00 15.00))
(show_hud_help_text false)))

(script static void really_exit_training
(begin
(fade_out 1.00 1.00 1.00 15)
(sleep 15) really_exit_training
(object_teleport really_exit_training stubbs_exit)
(if
(game_is_cooperative)
(object_teleport really_exit_training grubbs_exit))
(camera_control true 0)
(camera_set tutorial_02 0)
(camera_set tutorial_02b 330) really_exit_training
(fade_in 1.00 1.00 1.00 15)
(sleep 15)
(sound_impulse_start sound\music\a10\main_gate_open none 1.00)
(device_set_position plaza_gate 1.00)
(sleep 60)
(ai_command_list tutorial_bot/guidebot tutorial_bot_gate)
(ai_command_list zombies zombies_gate_run)
(recording_play really_exit_training stubbs_exit)
(if
(game_is_cooperative)
(recording_play really_exit_training stubbs_exit))
(sleep
(* 30.00 7.00))
(fade_out 1.00 1.00 1.00 15)
(sleep 20)
(switch_bsp 1) really_exit_training really_exit_training really_exit_training
(camera_control false 0)
(sleep
(* 30.00 1.00))
(recording_kill really_exit_training)
(player_set_profile really_exit_training flatch true)
(player_set_profile really_exit_training flatch true)
(fade_in 1.00 1.00 1.00 15) really_exit_training
(sleep 20)
(game_save)
(set guidebot_post_training_chatter true)
(hud_show_health true)
(sleep
(* 30.00 1.00))
(show_hud_help_text true)
(hud_set_help_text inplaza)
(sleep
(* 30.00 15.00))
(show_hud_help_text false)
(wake plaza_flatch_tip)
(sleep 4000)
(activate_nav_point_flag default really_exit_training monorail_flag 0.00)
(activate_nav_point_flag default really_exit_training monorail_flag 0.00)))

(script static void exit_training
(begin
(print exit training)
(wake exit_hud_tip_on)
(ai_enable_communication citizens2 true) exit_training
(ai_command_list tutorial_bot/guidebot tutorial_bot_exit)
(sound_impulse_start sound\dialog\a10\se_guidebot_15
(list_get
(ai_actors tutorial_bot/guidebot) 0) 1.00)
(sleep_until
(=
(ai_command_list_status
(ai_actors tutorial_bot/guidebot)) 1))
(ai_look_at_object
(unit
(list_get
(ai_actors tutorial_bot/guidebot) 0))
(list_get
(players_current) 0))
(ai_allegiance_remove zombie civilian)
(sleep_until
(volume_test_objects trigger_to_plaza
(players_current)))
(set marching_band_on false) exit_training))

(script startup void coop_exit_first_bsp
(begin
(sleep 30)
(if
(game_is_cooperative)
(begin
(sleep_until
(volume_test_objects trigger_to_plaza
(players_current))) coop_exit_first_bsp))))

(script static void checkpoint2
(begin
(switch_bsp 1) checkpoint2 checkpoint2 checkpoint2
(player_enable_input true)
(camera_control false 0)))

(script continuous void guidebot_chatter
(begin
(if guidebot_post_training_chatter
(begin
(sleep
(random_range
(* 30.00 20.00)
(* 30.00 50.00)))
(sound_impulse_start sound\dialog\a10\se_guidebot_punchbowl
(list_get
(ai_actors tutorial_bot_city_hall) 0) 1.50)))))

(script static void tutorial
(begin
(camera_control true 0)
(camera_set tutorial_01 0)
(objects_cannot_take_damage
(players_current) true)
(if
(> test_tutorial 0)
(begin
(object_teleport
(list_get
(ai_actors tutorial_bot/guidebot) 0) test_guidebot)
(object_teleport tutorial test_player)
(camera_control false 0)))
(if
(< test_tutorial 2) tutorial)
(if
(< test_tutorial 3) tutorial)
(if
(< test_tutorial 4) tutorial)
(if
(< test_tutorial 5) tutorial)
(ai_enable_communication bots true)
(if
(< test_tutorial 6) tutorial)
(set marching_band_on true)
(if
(< test_tutorial 7) tutorial)
(if
(< test_tutorial 8) tutorial)
(if
(< test_tutorial 9) tutorial)
(if
(< test_tutorial 10) tutorial)
(objects_cannot_take_damage
(players_current) false) tutorial))

(script dormant void plaza_dudes_know_of_stubbs
(begin
(sleep_until
(or
(volume_test_objects plaza_mid_point
(players_current))
(<
(ai_strength citizens_plaza) 1.00)
(<
(ai_strength cops_plaza) 1.00))) plaza_dudes_know_of_stubbs
(ai_set_disguise_knowable citizens_plaza zombie true)
(ai_set_all_enemies_unopposable citizens_plaza true)
(ai_set_disguise_knowable cops_plaza zombie true)
(ai_set_disguise_known cops_plaza zombie true)
(ai_set_disguise_known citizens_plaza zombie true)))

(script static void coop_setup
(begin coop_setup
(camera_control true 0)
(camera_set tutorial_01 0)
(ai_command_list ted_n_judy/judy judy_coop_flee)
(ai_command_list ted_n_judy/ted ted_rush_stubbs)
(sleep
(* 30.00 3.00))
(sound_impulse_start sound\dialog\a10\10_ted_2
(list_get
(ai_actors ted_n_judy/ted) 0) 1.00)
(sleep
(* 30.00 5.00))
(ai_erase ted_n_judy/judy) coop_setup
(camera_control false 0) coop_setup
(hud_show_health true)
(show_hud_help_text false)
(hud_show_special_attack 1 true)
(hud_show_special_attack 2 true)
(hud_show_special_attack 3 true)
(hud_show_special_attack 0 false)
(player_set_profile coop_setup flatch true)
(player_set_profile coop_setup flatch true)
(player_enable_input true) coop_setup
(ai_set_disguise_knowable citizens2 zombie true)
(ai_set_disguise_knowable coop_cops zombie true)
(ai_set_all_enemies_unopposable citizens2 true)
(ai_braindead tutorial_cops false)
(ai_place coop_cops)
(ai_migrate tutorial_cops coop_cops/coop_cops1)
(ai_enable_communication bots true)
(ai_enable_communication tutorial_bot true)
(wake gate_navpoint)))

(script startup void begin_level
(begin
(player_enable_input false) begin_level
(fade_out 0.00 0.00 0.00 0)
(if begin_level begin_level) begin_level
(player_enable_input false)
(image_effect_set image_effects\technicolor)
(object_create ambient_monorail)
(set ambient_monorail_on true)
(object_teleport begin_level player_1_start)
(object_teleport begin_level player_2_start)
(fade_in 0.00 0.00 0.00 30)
(ai_place citizens2)
(ai_allegiance zombie civilian)
(ai_place tutorial_bot)
(ai_enable_communication tutorial_bot false)
(ai_enable_communication bots false)
(ai_place ted_n_judy)
(ai_enable_communication ted_n_judy false)
(ai_place tutorial_cops)
(object_create stealth_kill_dupe)
(ai_attach stealth_kill_dupe tutorial_cops/dupe)
(ai_enable_communication tutorial_cops false)
(ai_braindead tutorial_cops true)
(object_create cop_car)
(unit_set_enterable_by_player cop_car false)
(object_teleport
(list_get
(ai_actors ted_n_judy/ted) 0) ted_start)
(if
(not
(game_is_cooperative))
(begin
(hud_show_health false)
(show_hud_help_text false)
(hud_show_special_attack 0 true)
(hud_show_special_attack 1 true)
(hud_show_special_attack 2 true)
(hud_show_special_attack 3 true) begin_level
(objects_cannot_take_damage
(ai_actors tutorial_cops) true)
(objects_cannot_be_finished
(ai_actors tutorial_cops) true)
(objects_cannot_lose_regions
(ai_actors tutorial_cops) true)
(objects_cannot_take_damage
(ai_actors zombies) true) begin_level) begin_level)))

(script continuous void mail_bot_flavor
(begin
(sleep 10)
(sleep_until
(volume_test_objects mail_bot
(players_current)))
(ai_set_current_state bots/mail_bot alert)
(sleep
(* 30.00 15.00))
(sleep_until
(=
(volume_test_objects mail_bot
(players_current)) false))
(ai_set_current_state bots/mail_bot sleep)))

(script continuous void phone_bot_flavor
(begin
(sleep 12)
(sleep_until
(volume_test_objects phone_bot
(players_current)))
(ai_set_current_state bots/phone_bot alert)
(sleep
(* 30.00 15.00))
(sleep_until
(=
(volume_test_objects phone_bot
(players_current)) false))
(ai_set_current_state bots/phone_bot sleep)))

(script dormant void plaza_mid_point_script
(begin
(sleep_until
(volume_test_objects plaza_mid_point
(players_current)))
(print last round of cops showing up!)
(ai_place cops_plaza/cops_plaza02)
(ai_command_list zombies_plaza zombies_towards_monorail)
(ai_migrate citizens_plaza/cit_01 citizens_plaza/cit_04)
(ai_migrate citizens_plaza/cit_02 citizens_plaza/cit_04)
(ai_migrate citizens_plaza/cit_03 citizens_plaza/cit_04)
(sleep
(* 30.00 30.00))
(ai_command_list tutorial_bot_city_hall guidebot_plaza_center)))

(script dormant void plaza_left_script
(begin
(sleep_until
(volume_test_objects plaza_left_side
(players_current)))
(ai_migrate citizens_plaza/cit_03 citizens_plaza/cit_04)
(ai_command_list tutorial_bot_city_hall guidebot_plaza_left)
(print left)))

(script dormant void plaza_right_script
(begin
(sleep_until
(volume_test_objects plaza_right_side
(players_current)))
(ai_migrate citizens_plaza/cit_02 citizens_plaza/cit_04)
(ai_command_list tutorial_bot_city_hall guidebot_plaza_right)
(print right)))

(script dormant void left_spawn1_script
(begin
(sleep_until
(volume_test_objects trigger_wrong_way2
(players_current)))
(objects_cannot_take_damage
(players_origin) true)
(fade_out 0.00 0.00 0.00 0) left_spawn1_script
(camera_set spawn_cam_left1 0)
(ai_place cops_plaza_spawns/left_spawn1)
(ai_try_to_fight_player cops_plaza_spawns/left_spawn1)
(sleep 20)
(fade_in 0.00 0.00 0.00 30)
(camera_set spawn_cam_left1b 120)
(sleep 90)
(objects_cannot_take_damage
(players_origin) false) left_spawn1_script left_spawn1_script))

(script dormant void center_spawn1_script
(begin
(sleep_until
(volume_test_objects trigger_wrong_way3
(players_current)))
(objects_cannot_take_damage
(players_origin) true)
(fade_out 0.00 0.00 0.00 0) center_spawn1_script
(camera_set spawn_cam_center1 0)
(ai_place cops_plaza_spawns/center_spawn1)
(ai_try_to_fight_player cops_plaza_spawns/center_spawn1)
(sleep 20)
(fade_in 0.00 0.00 0.00 30)
(camera_set spawn_cam_center1b 120)
(sleep 90)
(objects_cannot_take_damage
(players_origin) false) center_spawn1_script center_spawn1_script))

(script dormant void right_spawn1_script
(begin
(sleep_until
(volume_test_objects near_monorail
(players_current)))
(objects_cannot_take_damage
(players_origin) true)
(fade_out 0.00 0.00 0.00 0) right_spawn1_script
(camera_set spawn_cam_right1 0)
(ai_place cops_plaza_spawns/right_spawn1)
(ai_try_to_fight_player cops_plaza_spawns/right_spawn1)
(sleep 20)
(fade_in 0.00 0.00 0.00 30)
(camera_set spawn_cam_right1b 120)
(sleep 90)
(objects_cannot_take_damage
(players_origin) false) right_spawn1_script right_spawn1_script))

(script continuous void drown_stubbs_script
(begin
(sleep 15)
(if
(volume_test_objects plaza_water_trig drown_stubbs_script)
(begin
(damage_object globals\falling drown_stubbs_script)))
(if
(volume_test_objects plaza_water_trig drown_stubbs_script)
(begin
(damage_object globals\falling drown_stubbs_script)))))

(script dormant void 10_foley
(begin
(sleep 5)
(sound_looping_start sound\cinematics\a10\10_foley_1 none 0.50)))

(script static void countdown_sequence
(begin
(fade_in 0.00 0.00 0.00 0)
(cinematic_set_title counter_pre_1)
(sleep 1)
(cinematic_clear_title counter_pre_1)
(cinematic_set_title counter_pre_2)
(sleep 1)
(cinematic_clear_title counter_pre_2)
(cinematic_set_title counter_pre_2b)
(sleep 1)
(cinematic_clear_title counter_pre_2b)
(cinematic_set_title counter_pre_2c)
(sleep 1)
(cinematic_clear_title counter_pre_2c)
(cinematic_set_title counter_pre_3)
(sleep 1)
(cinematic_clear_title counter_pre_3)
(cinematic_set_title counter_pre_4)
(sleep 2)
(cinematic_clear_title counter_pre_4)
(cinematic_set_title counter_pre_5)
(sleep 1)
(cinematic_clear_title counter_pre_5)
(cinematic_set_title counter_pre_6)
(sleep 1)
(cinematic_clear_title counter_pre_6)
(cinematic_set_title counter_pre_7)
(sleep 1)
(cinematic_clear_title counter_pre_7)
(cinematic_set_title counter_5_1)
(sleep 1)
(cinematic_clear_title counter_5_1)
(cinematic_set_title counter_5_2)
(sleep 1)
(cinematic_clear_title counter_5_2)
(cinematic_set_title counter_5_3)
(sleep 1)
(cinematic_clear_title counter_5_3)
(cinematic_set_title counter_5_4)
(sleep 2)
(cinematic_clear_title counter_5_4)
(cinematic_set_title counter_5_5)
(sleep 1)
(cinematic_clear_title counter_5_5)
(cinematic_set_title counter_5_6)
(sleep 1)
(cinematic_clear_title counter_5_6)
(cinematic_set_title counter_5_7)
(sleep 1)
(cinematic_clear_title counter_5_7)
(cinematic_set_title counter_5_8)
(sleep 2)
(cinematic_clear_title counter_5_8)
(cinematic_set_title counter_5_9)
(sleep 1)
(cinematic_clear_title counter_5_9)
(cinematic_set_title counter_5_10)
(sleep 1)
(cinematic_clear_title counter_5_10)
(cinematic_set_title counter_5_11)
(sleep 1)
(cinematic_clear_title counter_5_11)
(cinematic_set_title counter_5_12)
(sleep 2)
(cinematic_clear_title counter_5_12)
(cinematic_set_title counter_5_13)
(sleep 1)
(cinematic_clear_title counter_5_13)
(cinematic_set_title counter_5_14)
(sleep 1)
(cinematic_clear_title counter_5_14)
(cinematic_set_title counter_5_15)
(sleep 1)
(cinematic_clear_title counter_5_15)
(cinematic_set_title counter_5_16)
(sleep 2)
(cinematic_clear_title counter_5_16)
(cinematic_set_title counter_5_17)
(sleep 1)
(cinematic_clear_title counter_5_17)
(cinematic_set_title counter_5_18)
(sleep 1)
(cinematic_clear_title counter_5_18)
(cinematic_set_title counter_5_19)
(sleep 1)
(cinematic_clear_title counter_5_19)
(cinematic_set_title counter_5_20)
(sleep 2)
(cinematic_clear_title counter_5_20)
(cinematic_set_title counter_5_21)
(sleep 1)
(cinematic_clear_title counter_5_21)
(cinematic_set_title counter_5_22)
(sleep 1)
(cinematic_clear_title counter_5_22)
(cinematic_set_title counter_5_23)
(sleep 1)
(cinematic_clear_title counter_5_23)
(cinematic_set_title counter_5_24)
(sleep 2)
(cinematic_clear_title counter_5_24)
(cinematic_set_title counter_4_1)
(sleep 1)
(cinematic_clear_title counter_4_1)
(cinematic_set_title counter_4_2)
(sleep 1)
(cinematic_clear_title counter_4_2)
(cinematic_set_title counter_4_3)
(sleep 1)
(cinematic_clear_title counter_4_3)
(cinematic_set_title counter_4_4)
(sleep 2)
(cinematic_clear_title counter_4_4)
(cinematic_set_title counter_4_5)
(sleep 1)
(cinematic_clear_title counter_4_5)
(cinematic_set_title counter_4_6)
(sleep 1)
(cinematic_clear_title counter_4_6)
(cinematic_set_title counter_4_7)
(sleep 1)
(cinematic_clear_title counter_4_7)
(cinematic_set_title counter_4_8)
(sleep 2)
(cinematic_clear_title counter_4_8)
(cinematic_set_title counter_4_9)
(sleep 1)
(cinematic_clear_title counter_4_9)
(cinematic_set_title counter_4_10)
(sleep 1)
(cinematic_clear_title counter_4_10)
(cinematic_set_title counter_4_11)
(sleep 1)
(cinematic_clear_title counter_4_11)
(cinematic_set_title counter_4_12)
(sleep 2)
(cinematic_clear_title counter_4_12)
(cinematic_set_title counter_4_13)
(sleep 1)
(cinematic_clear_title counter_4_13)
(cinematic_set_title counter_4_14)
(sleep 1)
(cinematic_clear_title counter_4_14)
(cinematic_set_title counter_4_15)
(sleep 1)
(cinematic_clear_title counter_4_15)
(cinematic_set_title counter_4_16)
(sleep 2)
(cinematic_clear_title counter_4_16)
(cinematic_set_title counter_4_17)
(sleep 1)
(cinematic_clear_title counter_4_17)
(cinematic_set_title counter_4_18)
(sleep 1)
(cinematic_clear_title counter_4_18)
(cinematic_set_title counter_4_19)
(sleep 1)
(cinematic_clear_title counter_4_19)
(cinematic_set_title counter_4_20)
(sleep 2)
(cinematic_clear_title counter_4_20)
(cinematic_set_title counter_4_21)
(sleep 1)
(cinematic_clear_title counter_4_21)
(cinematic_set_title counter_4_22)
(sleep 1)
(cinematic_clear_title counter_4_22)
(cinematic_set_title counter_4_23)
(sleep 1)
(cinematic_clear_title counter_4_23)
(cinematic_set_title counter_4_24)
(sleep 2)
(cinematic_clear_title counter_4_24)
(cinematic_set_title counter_3_1)
(sleep 1)
(cinematic_clear_title counter_3_1)
(cinematic_set_title counter_3_2)
(sleep 1)
(cinematic_clear_title counter_3_2)
(cinematic_set_title counter_3_3)
(sleep 1)
(cinematic_clear_title counter_3_3)
(cinematic_set_title counter_3_4)
(sleep 2)
(cinematic_clear_title counter_3_4)
(cinematic_set_title counter_3_5)
(sleep 1)
(cinematic_clear_title counter_3_5)
(cinematic_set_title counter_3_6)
(sleep 1)
(cinematic_clear_title counter_3_6)
(cinematic_set_title counter_3_7)
(sleep 1)
(cinematic_clear_title counter_3_7)
(cinematic_set_title counter_3_8)
(sleep 2)
(cinematic_clear_title counter_3_8)
(cinematic_set_title counter_3_9)
(sleep 1)
(cinematic_clear_title counter_3_9)
(cinematic_set_title counter_3_10)
(sleep 1)
(cinematic_clear_title counter_3_10)
(cinematic_set_title counter_3_11)
(sleep 1)
(cinematic_clear_title counter_3_11)
(cinematic_set_title counter_3_12)
(sleep 2)
(cinematic_clear_title counter_3_12)
(cinematic_set_title counter_3_13)
(sleep 1)
(cinematic_clear_title counter_3_13)
(cinematic_set_title counter_3_14)
(sleep 1)
(cinematic_clear_title counter_3_14)
(cinematic_set_title counter_3_15)
(sleep 1)
(cinematic_clear_title counter_3_15)
(cinematic_set_title counter_3_16)
(sleep 2)
(cinematic_clear_title counter_3_16)
(cinematic_set_title counter_3_17)
(sleep 1)
(cinematic_clear_title counter_3_17)
(cinematic_set_title counter_3_18)
(sleep 1)
(cinematic_clear_title counter_3_18)
(cinematic_set_title counter_3_19)
(sleep 1)
(cinematic_clear_title counter_3_19)
(cinematic_set_title counter_3_20)
(sleep 2)
(cinematic_clear_title counter_3_20)
(cinematic_set_title counter_3_21)
(sleep 1)
(cinematic_clear_title counter_3_21)
(cinematic_set_title counter_3_22)
(sleep 1)
(cinematic_clear_title counter_3_22)
(cinematic_set_title counter_3_23)
(sleep 1)
(cinematic_clear_title counter_3_23)
(cinematic_set_title counter_3_24)
(sleep 2)
(cinematic_clear_title counter_3_24)
(cinematic_set_title counter_2_1)
(sleep 2)
(cinematic_clear_title counter_2_1)
(cinematic_set_title counter_gray)
(sleep 58)
(cinematic_clear_title counter_gray)
(fade_out 0.00 0.00 0.00 0)))

(script dormant void civilian_flourish
(begin
(object_create 10_civ_1)
(object_beautify 10_civ_1 true)
(unit_set_weapon 10_civ_1 none)
(unit_set_seat 10_civ_1 alert)
(object_create 10_civ_2)
(object_beautify 10_civ_2 true)
(unit_set_weapon 10_civ_2 none)
(unit_set_seat 10_civ_2 alert)
(object_create 10_civ_3)
(object_beautify 10_civ_3 true)
(unit_set_weapon 10_civ_3 none)
(unit_set_seat 10_civ_3 alert)
(object_create 10_belair_1)
(object_beautify 10_belair_1 true)
(object_create 10_wagon_1)
(object_beautify 10_wagon_1 true)
(recording_play 10_civ_1 10_civ_1)
(recording_play 10_civ_2 10_civ_1)
(recording_play 10_civ_3 10_civ_3)
(recording_play 10_belair_1 10_belair_1)
(sleep 30)
(recording_play 10_wagon_1 10_wagon_1)
(sleep -1)
(object_create 10_civ_4)
(object_beautify 10_civ_4 true)
(unit_set_weapon 10_civ_4 none)
(unit_set_seat 10_civ_4 alert)
(object_create 10_civ_5)
(object_beautify 10_civ_5 true)
(unit_set_weapon 10_civ_5 none)
(unit_set_seat 10_civ_5 alert)
(object_create 10_civ_6)
(object_beautify 10_civ_6 true)
(unit_set_weapon 10_civ_6 none)
(unit_set_seat 10_civ_6 alert)
(object_create 10_trafficbot_1)
(object_beautify 10_trafficbot_1 true)
(object_create 10_eldorado_2)
(object_beautify 10_eldorado_2 true)
(sleep 10)
(recording_play 10_eldorado_2 10_eldorado_3)
(sleep -1)
(recording_play 10_civ_4 10_civ_4)
(recording_play 10_civ_5 10_civ_4)
(recording_play 10_civ_6 10_civ_4)
(sleep -1)
(object_create 10_monorail_1)
(device_set_position_immediate 10_monorail_1 0.35)
(device_set_position 10_monorail_1 0.00)
(sleep_until
(<
(device_get_position 10_monorail_1) 0.19) 1)
(object_create 10_civ_20)
(unit_set_seat 10_civ_20 alert)
(object_create 10_briefcase_1)
(objects_attach 10_civ_20 meleer 10_briefcase_1 meleer)
(object_create 10_civ_21)
(unit_set_seat 10_civ_21 alert)
(object_create 10_civ_22)
(unit_set_seat 10_civ_22 alert)
(object_create 10_civ_23)
(unit_set_seat 10_civ_23 alert)
(object_create 10_briefcase_2)
(objects_attach 10_civ_23 meleer 10_briefcase_2 meleer)
(object_create 10_civ_24)
(unit_set_seat 10_civ_24 alert)
(sleep_until
(<
(device_get_position 10_monorail_1) 0.11) 1)
(recording_play 10_civ_20 10_civ_20)
(recording_play 10_civ_22 10_civ_22)
(recording_play 10_civ_24 10_civ_21)
(sleep 10)
(recording_play 10_civ_21 10_civ_21)
(recording_play 10_civ_23 10_civ_22)
(sleep -1)
(object_destroy 10_eldorado_2)
(object_destroy 10_trafficbot_1)
(object_destroy 10_civ_4)
(object_destroy 10_civ_5)
(object_destroy 10_civ_6)
(object_create 10_mailbot_1)
(object_create 10_civ_7)
(object_create 10_envelope_1)
(objects_attach 10_civ_7 meleer 10_envelope_1 envelope)
(object_create 10_eldorado_3)
(recording_play 10_eldorado_3 10_eldorado_4)
(unit_set_weapon 10_civ_7 none)
(object_teleport 10_civ_7 10_scene_4)
(object_teleport 10_mailbot_1 10_scene_3)
(custom_animation 10_mailbot_1 cinematics\animations\pumpbot\a10\a10 a10_10_pumpbot_1 false)
(custom_animation 10_civ_7 cinematics\animations\civ_female\a10\a10 a10_10_female_civ_1 false)
(sleep 74)
(object_destroy 10_envelope_1)
(sleep -1)
(object_create 10_phonebot_1)
(object_create 10_civ_8)
(unit_set_weapon 10_civ_8 none)
(object_teleport 10_civ_8 10_scene_5)
(object_teleport 10_phonebot_1 10_scene_6)
(custom_animation 10_phonebot_1 cinematics\animations\pumpbot\a10\a10 a10_10_pumpbot_2 false)
(custom_animation 10_civ_8 cinematics\animations\civ_female\a10\a10 a10_10_female_civ_2 false)
(sound_impulse_start sound\dialog\a10\10_guidebot_1b 10_phonebot_1 0.00)
(sleep -1)
(object_create 10_wye_1)
(object_beautify 10_wye_1 true)
(unit_set_weapon 10_wye_1 none)
(custom_animation 10_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed wave true)
(sleep
(unit_get_custom_animation_time 10_wye_1))
(custom_animation 10_wye_1 cinematics\animations\civ_male_biz\common\common alert unarmed wave true)
(sleep -1)
(object_create 10_monday_1)
(object_beautify 10_monday_1 true)
(unit_set_weapon 10_monday_1 none)
(unit_set_seat 10_monday_1 alert)
(object_create 10_maggie_1)
(object_beautify 10_maggie_1 true)
(unit_set_weapon 10_maggie_1 none)
(unit_set_seat 10_maggie_1 alert)
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed wave true)
(sleep
(unit_get_custom_animation_time 10_monday_1))
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 10_monday_1))
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 10_monday_1))
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed wave true)
(sleep
(unit_get_custom_animation_time 10_monday_1))
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(object_create 10_civ_9)
(unit_set_weapon 10_civ_9 none)
(unit_set_seat 10_civ_9 alert)
(object_create 10_civ_10)
(unit_set_weapon 10_civ_10 none)
(unit_set_seat 10_civ_10 alert)
(object_beautify 10_civ_10 true)
(object_create 10_civ_11)
(unit_set_weapon 10_civ_11 none)
(unit_set_seat 10_civ_11 alert)
(object_create 10_civ_12)
(unit_set_weapon 10_civ_12 none)
(unit_set_seat 10_civ_12 alert)
(object_create 10_civ_13)
(unit_set_weapon 10_civ_13 none)
(unit_set_seat 10_civ_13 alert)
(object_create 10_civ_14)
(unit_set_weapon 10_civ_14 none)
(unit_set_seat 10_civ_14 alert)
(object_beautify 10_civ_14 true)
(object_create 10_civ_15)
(unit_set_weapon 10_civ_15 none)
(unit_set_seat 10_civ_15 alert)
(sleep -1)
(sleep -1)
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle false)
(sleep
(unit_get_custom_animation_time 10_monday_1))
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(unit_get_custom_animation_time 10_monday_1))
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed wave true)
(sleep
(unit_get_custom_animation_time 10_monday_1))
(custom_animation 10_monday_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep -1)))

(script dormant void picnic_flourish
(begin
(set otis false)
(object_create 10_judy_1)
(object_beautify 10_judy_1 true)
(object_create 10_ted_1)
(object_beautify 10_ted_1 true)
(object_create 10_hotdog_1)
(unit_set_weapon 10_ted_1 none)
(objects_attach 10_ted_1 meleer 10_hotdog_1 ted)
(object_create 10_stubbs_1)
(object_beautify 10_stubbs_1 true)
(sleep 10)
(effect_new_on_flag cinematics\effects\ground_burst 10_ground_burst_load)
(unit_custom_animation_at_frame 10_ted_1 cinematics\animations\ted\a10\a10 a10_10_ted_1 false 220)
(unit_custom_animation_at_frame 10_judy_1 cinematics\animations\judy\a10\a10 a10_10_judy_1 false 220)
(unit_custom_animation_at_frame 10_stubbs_1 cinematics\animations\stubbs\a10\a10 a10_10_stubbs_hotdog false 220)
(sleep 155)
(effect_new_on_flag cinematics\effects\ground_burst 10_groundburst_1)
(sleep 3)
(object_create_anew 10_hotdog_1)
(objects_attach 10_stubbs_1 melee 10_hotdog_1 stubbs)
(sound_impulse_start sound\dialog\plaza\judy\my_goodness 10_judy_1 1.00)
(sound_impulse_start sound\dialog\plaza\ted\short_scream 10_ted_1 1.00)
(sleep -1)
(custom_animation 10_ted_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle false)
(sleep
(unit_get_custom_animation_time 10_ted_1))
(custom_animation 10_ted_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)))

(script static void flash
(begin
(damage_object cinematics\effects\a10\photo_flash flash)))

(script dormant void flash_bulbs
(begin
(sleep 15) flash_bulbs
(sleep 30) flash_bulbs
(sleep 60) flash_bulbs
(sleep -1)
(sleep 15) flash_bulbs
(sleep 5) flash_bulbs
(sleep 15) flash_bulbs
(sleep -1)
(sleep 15) flash_bulbs
(sleep 20) flash_bulbs
(sleep -1) flash_bulbs
(sleep 25) flash_bulbs))

(script static void picnic
(begin
(if
(= test 15)
(begin picnic))
(switch_bsp 0)
(sleep 1)
(camera_set 10_16 0)
(object_activation_add_camera 10_16)
(wake picnic_flourish)
(fade_in 1.00 1.00 1.00 30)
(image_effect_start_blend image_effects\technicolor 3.00)
(cinematic_show_letterbox true)
(camera_set 10_17 90)
(sound_impulse_start sound\dialog\a10\10_narrator_13 none 1.00)
(sleep 5)
(sound_looping_start sound\cinematics\a10\10_foley_3 none 0.60)
(sleep 90)
(camera_set 10_18 180)
(sleep 150)
(sleep 32)
(camera_set 10_19 0)
(sleep
(unit_get_custom_animation_time 10_stubbs_1))
(object_teleport 10_ted_1 10_ted_1)
(object_teleport 10_judy_1 10_judy_1)
(camera_set 10_20a 0)
(camera_set 10_20 210)
(custom_animation 10_ted_1 cinematics\animations\ted\a10\a10 a10_10_ted_4 false)
(sound_impulse_start sound\dialog\a10\10_ted_1 10_ted_1 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\a10\10_ted_1) 45.00))
(object_create 10_guidebot_1)
(object_beautify 10_guidebot_1 true)
(recording_play 10_guidebot_1 10_guidebot_1)
(sleep 14)
(unit_set_seat 10_ted_1 alert)
(camera_set 10_30 30)
(sleep 30)
(camera_set 10_30a 120)
(sleep 30)
(sound_impulse_start sound\dialog\a10\10_guidebot_1b 10_guidebot_1 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\a10\10_guidebot_1b) 10.00))
(custom_animation 10_ted_1 cinematics\animations\ted\a10\a10 a10_10_ted_4 false)
(camera_set 10_21a 0)
(sound_impulse_start sound\dialog\a10\10_ted_2 10_ted_1 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\10_ted_2))
(camera_set 10_22 0)
(camera_set 10_22a 180)
(sound_impulse_start sound\dialog\a10\10_guidebot_2 10_guidebot_1 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\a10\10_guidebot_2) 30.00))
(object_destroy 10_ted_1)
(camera_set 10_23a 0)
(camera_set 10_23 210)
(custom_animation 10_guidebot_1 cinematics\animations\pumpbot\a10\a10 a10_10_guidebot_1 false)
(custom_animation 10_stubbs_1 cinematics\animations\stubbs\a10\a10 a10_10_stubbs_1 false)
(sleep 75)
(object_create_anew 10_hotdog_1)
(objects_attach 10_guidebot_1 gascap 10_hotdog_1 guidebot)
(sleep
(-
(unit_get_custom_animation_time 10_stubbs_1) 45.00))
(custom_animation 10_guidebot_1 characters\pumpbot\pumpbot stand unarmed idle false)
(custom_animation 10_stubbs_1 characters\stubbs\stubbs stand unarmed idle false)
(object_create 10_ted_1)
(object_teleport 10_ted_1 10_ted_1)
(object_teleport 10_stubbs_1 10_stubbs_1)
(object_teleport 10_guidebot_1 10_guidebot_1)
(camera_set 10_24 0)
(wake picnic_flourish)
(sound_impulse_start sound\dialog\a10\10_guidebot_3 10_guidebot_1 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\10_guidebot_3))
(camera_set 10_25a 0)
(camera_set 10_25 210)
(sound_impulse_start sound\dialog\a10\10_ted_3 10_ted_1 1.00)
(custom_animation 10_ted_1 cinematics\animations\civ_male_biz\common\common alert unarmed threaten true)
(sleep
(unit_get_custom_animation_time 10_ted_1))
(custom_animation 10_ted_1 cinematics\animations\civ_male_biz\common\common alert unarmed idle true)
(sleep
(sound_impulse_time sound\dialog\a10\10_ted_3))
(if
(= test 15)
(fade_out 0.00 0.00 0.00 0))))

(script static void a10_10_run
(begin
(fade_out 0.00 0.00 0.00 0)
(object_teleport a10_10_run 10_hide_player_1)
(object_teleport a10_10_run 10_hide_player_1)
(sound_class_set_gain vehicle_engine 0.00 0)
(sound_class_set_gain ambient_nature 0.00 0)
(sound_class_set_gain ambient_machinery 0.00 0)
(sound_class_set_gain device_nature 0.00 0)
(sound_class_set_gain unit_footsteps 0.00 0)
(sound_looping_predict sound\cinematics\a10\10_foley_1) a10_10_run
(cinematic_show_letterbox false)
(switch_bsp 0)
(object_activation_add_camera 10_01)
(wake 10_foley)
(print a10_10:  newsreel)
(image_effect_set image_effects\movietone)
(camera_set 10_01 0) a10_10_run
(cinematic_set_title 10_mondaytone_news)
(fade_in 0.00 0.00 0.00 0)
(sleep 90)
(cinematic_clear_title 10_mondaytone_news)
(cinematic_set_title 10_monday_presents)
(sound_impulse_start sound\dialog\a10\10_narrator_1 none 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\a10\10_narrator_1) 80.00))
(wake civilian_flourish)
(sleep 80)
(camera_set 10_01 0)
(cinematic_clear_title 10_monday_presents)
(sound_impulse_start sound\dialog\a10\10_narrator_2 none 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\a10\10_narrator_2) 90.00))
(wake civilian_flourish)
(sleep 90)
(camera_set 10_02 0)
(sound_impulse_start sound\dialog\a10\10_narrator_3 none 1.00)
(custom_animation 10_trafficbot_1 cinematics\animations\pumpbot\a10\a10 a10_10_trafficbot_1 false)
(sleep 90)
(wake civilian_flourish)
(sleep
(-
(sound_impulse_time sound\dialog\a10\10_narrator_3) 10.00))
(wake civilian_flourish)
(sleep 10)
(camera_set 10_03 0)
(sound_impulse_start sound\dialog\a10\10_narrator_4 none 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\a10\10_narrator_4) 30.00))
(sleep 60)
(wake civilian_flourish)
(sleep 10)
(camera_set 10_04 0)
(sound_impulse_start sound\dialog\a10\10_narrator_5 none 1.00)
(sleep
(-
(unit_get_custom_animation_time 10_mailbot_1) 30.00))
(wake civilian_flourish)
(sound_impulse_stop sound\dialog\a10\10_narrator_5)
(sound_looping_predict sound\cinematics\a10\10_foley_2)
(sleep 30)
(camera_set 10_05 0)
(sound_impulse_start sound\dialog\a10\10_narrator_6 none 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\10_narrator_6))
(cinematic_set_title 10_wye_photo)
(print audio must stop completely here)
(sleep 1)
(object_destroy 10_eldorado_3)
(switch_bsp 1)
(camera_set 10_06 0)
(object_activation_add_camera 10_06)
(object_teleport a10_10_run 10_hide_player_2)
(object_teleport a10_10_run 10_hide_player_2)
(sound_impulse_start sound\dialog\a10\10_narrator_7 none 1.00)
(sound_looping_start sound\cinematics\a10\10_foley_2 none 0.60)
(sleep
(-
(sound_impulse_time sound\dialog\a10\10_narrator_7) 10.00))
(wake civilian_flourish)
(sleep 10)
(cinematic_clear_title 10_wye_photo)
(sound_impulse_start sound\dialog\a10\10_narrator_8 none 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\10_narrator_8))
(camera_set 10_07 0)
(sound_impulse_start sound\dialog\a10\10_narrator_9 none 1.00)
(camera_set 10_07b
(-
(sound_impulse_time sound\dialog\a10\10_narrator_9) 60.00))
(sleep
(-
(sound_impulse_time sound\dialog\a10\10_narrator_9) 62.00))
(wake civilian_flourish)
(sleep 10)
(camera_set 10_08 0)
(wake flash_bulbs)
(sleep
(sound_impulse_time sound\dialog\a10\10_narrator_9))
(sound_impulse_start sound\dialog\a10\10_narrator_10 none 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\a10\10_narrator_10) 186.00))
(camera_set 10_08b 0)
(wake flash_bulbs)
(sleep
(-
(sound_impulse_time sound\dialog\a10\10_narrator_10) 84.00))
(sleep 10)
(camera_set 10_09 0)
(wake flash_bulbs)
(sleep
(sound_impulse_time sound\dialog\a10\10_narrator_10))
(sleep 10)
(wake civilian_flourish)
(camera_set 10_11 0)
(custom_animation 10_monday_1 cinematics\animations\monday\a10\a10 a10_10_monday_3 false)
(sleep 28)
(sound_impulse_start sound\dialog\a10\10_monday_1 10_monday_1 1.00)
(camera_set 10_12
(-
(sound_impulse_time sound\dialog\a10\10_monday_1) 60.00))
(sleep
(unit_get_custom_animation_time 10_monday_1))
(wake civilian_flourish)
(camera_set 10_13 0)
(wake flash_bulbs)
(sound_impulse_start sound\dialog\a10\10_narrator_11 none 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\10_narrator_11))
(camera_set 10_14 0)
(sound_impulse_start sound\dialog\a10\10_narrator_12 none 1.00)
(camera_set 10_15
(sound_impulse_time sound\dialog\a10\10_narrator_12))
(sleep
(-
(sound_impulse_time sound\dialog\a10\10_narrator_12) 30.00))
(sound_looping_predict sound\cinematics\a10\10_foley_3)
(fade_out 1.00 1.00 1.00 30)
(sleep 29)
(print audio must stop completely here)
(sleep 1) a10_10_run
(fade_out 0.00 0.00 0.00 0) a10_10_run
(object_activation_clear)
(object_destroy_containing 10_)
(sound_class_set_gain vehicle_engine 1.00 0)
(sound_class_set_gain ambient_nature 1.00 0)
(sound_class_set_gain ambient_machinery 1.00 0)
(sound_class_set_gain device_nature 1.00 0)
(sound_class_set_gain unit_footsteps 1.00 0)))

(script static void a10_50_run
(begin
(fade_out 0.00 0.00 0.00 0)
(sound_looping_predict sound\cinematics\a10\50_foley_1)
(sound_class_set_gain ambient_nature 0.00 0) a10_50_run
(switch_bsp 1)
(object_teleport a10_50_run 50_hide_player)
(object_teleport a10_50_run 50_hide_player)
(object_teleport a10_50_run 50_hide_player)
(object_teleport a10_50_run 50_hide_player)
(sound_class_set_gain vehicle_engine 0.00 0)
(object_activation_add_camera 50_01)
(object_create 50_stubbs_1)
(sleep 20)
(recording_play 50_stubbs_1 50_stubbs_1)
(sleep 10)
(sound_looping_start sound\cinematics\a10\50_foley_1 none 0.60)
(print a10_50:  monorail escape)
(camera_set 50_01c 0)
(fade_in 0.00 0.00 0.00 0)
(sleep 30)
(sound_impulse_start sound\dialog\a10\50_billboard_1 50_billboard_1 1.00)
(sleep 30)
(camera_set 50_01 60)
(sleep
(sound_impulse_time sound\dialog\a10\50_billboard_1))
(camera_set 50_01b 90)
(recording_kill 50_stubbs_1)
(recording_play 50_stubbs_1 50_stubbs_1c)
(sleep 30)
(object_create 50_cop_1)
(object_create 50_cop_2)
(object_create 50_cop_3)
(sleep 60)
(object_teleport 50_cop_1 50_cop_1b)
(object_teleport 50_cop_2 50_cop_2b)
(object_teleport 50_cop_3 50_cop_3b)
(recording_play 50_cop_1 50_cop_1b)
(recording_play 50_cop_2 50_cop_2b)
(recording_play 50_cop_3 50_cop_3b)
(sleep 60)
(camera_set 50_03 60)
(print monorail pulls in)
(sleep 30)
(object_create 50_monorail_1)
(device_set_position_immediate 50_monorail_1 0.67)
(object_teleport 50_monorail_1 50_monorail_1)
(device_set_position 50_monorail_1 1.00)
(sleep 60)
(object_destroy 50_stubbs_2)
(object_create 50_stubbs_3)
(recording_play 50_stubbs_3 50_stubbs_3)
(camera_set 50_04b 0)
(sleep 60)
(device_set_position 50_monorail_1 0.10)
(print screams)
(print monorail pulls out)
(sleep 30)
(object_destroy 50_stubbs_3)
(object_create 50_pistol_1)
(object_create 50_pistol_2)
(object_create 50_pistol_3)
(objects_attach 50_cop_3 weapon 50_pistol_3 trigger hand)
(objects_attach 50_cop_2 weapon 50_pistol_2 trigger hand)
(objects_attach 50_cop_1 weapon 50_pistol_1 trigger hand)
(object_teleport 50_cop_3 50_cop_3c)
(recording_play 50_cop_3 50_cop_1)
(sleep 10)
(object_teleport 50_cop_1 50_cop_1c)
(recording_play 50_cop_1 50_cop_1)
(effect_new_on_object weapons\pistol\fire 50_pistol_1)
(sleep 15)
(object_teleport 50_cop_2 50_cop_2c)
(recording_play 50_cop_2 50_cop_1)
(effect_new_on_object weapons\pistol\fire 50_pistol_3)
(sleep 15)
(effect_new_on_object weapons\pistol\fire 50_pistol_2)
(sleep 15)
(effect_new_on_object weapons\pistol\fire 50_pistol_3)
(object_create 50_chief_1)
(camera_set_relative 50_05 0 50_cop_3)
(sleep 30)
(camera_set_relative 50_05b 45 50_cop_3)
(sleep 30)
(fade_out 1.00 1.00 1.00 10)
(sleep 10)
(cinematic_set_title taser)
(image_effect_set image_effects\television)
(camera_set 50_06 0)
(sleep 1)
(custom_animation 50_chief_1 cinematics\animations\masters\a10\a10 a10_20_masters_1 false)
(sleep 11)
(sound_impulse_start sound\dialog\a10\50_chief_masters_1 50_chief_1 1.00)
(fade_in 1.00 1.00 1.00 15)
(sleep 15)
(sleep
(-
(sound_impulse_time sound\dialog\a10\50_chief_masters_1) 30.00))
(object_create 50_zombie_1)
(unit_set_seat 50_zombie_1 alert)
(object_create 50_zombie_2)
(unit_set_seat 50_zombie_2 alert)
(object_create 50_zombie_3)
(unit_set_seat 50_zombie_3 alert)
(object_create 50_zombie_4)
(unit_set_seat 50_zombie_4 alert)
(object_create 50_zombie_5)
(unit_set_seat 50_zombie_5 alert)
(object_teleport 50_cop_1 50_cop_1)
(object_teleport 50_cop_2 50_cop_2)
(object_teleport 50_cop_3 50_cop_3)
(recording_play 50_zombie_1 50_zombie_1)
(sleep 5)
(recording_play 50_zombie_2 50_zombie_1)
(sleep 5)
(recording_play 50_zombie_3 50_zombie_1)
(sleep 5)
(recording_play 50_zombie_4 50_zombie_1)
(sleep 5)
(recording_play 50_zombie_5 50_zombie_1)
(sleep 10)
(cinematic_clear_title taser)
(image_effect_end)
(camera_set 50_07b 0)
(camera_set 50_07c 120)
(sleep 1)
(sound_impulse_start sound\dialog\a10\50_officer_hannity_1 50_cop_2 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\a10\50_officer_hannity_1) 5.00))
(camera_set 50_07 0)
(sound_impulse_start sound\dialog\a10\50_cops_1 50_cop_1 1.00)
(sleep
(sound_impulse_time sound\dialog\a10\50_cops_1))
(fade_out 0.00 0.00 0.00 0) a10_50_run
(object_activation_clear)
(object_destroy_containing 50_)
(sound_class_set_gain vehicle_engine 1.00 0)
(sound_class_set_gain ambient_nature 1.00 0)))

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
(= test 15) test)
(if
(= test 50) test)))

(script static void preview
(begin preview preview preview))

(script static void next_cutscene
(begin
(map_name levels\a30_greenhouse\a30_greenhouse_cutscene)))

(script static void unlockable_pickup
(begin
(damage_object equipment\hippo\hippo_pickup unlockable_pickup)
(if
(game_is_cooperative)
(damage_object equipment\hippo\hippo_pickup unlockable_pickup))))

(script static void stop_commentary
(begin
(sound_looping_stop sound\commentary\a10_plaza\a10_plaza_01)
(sound_looping_stop sound\commentary\a10_plaza\a10_plaza_02)
(sound_looping_stop sound\commentary\a10_plaza\a10_plaza_03)
(sound_looping_stop sound\commentary\a10_plaza\a10_plaza_04)
(sound_looping_stop sound\commentary\a10_plaza\a10_plaza_05)
(sound_looping_stop sound\commentary\a10_plaza\a10_plaza_06)
(sound_looping_stop sound\commentary\a10_plaza\a10_plaza_07)
(sleep 1)))

(script dormant void unlock_comment_1
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_1) 0.00) 7) unlock_comment_1
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_1
(sound_looping_start sound\commentary\a10_plaza\a10_plaza_01 none 1.00)))

(script dormant void unlock_comment_2
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_2) 0.00) 7) unlock_comment_2
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_2
(sound_looping_start sound\commentary\a10_plaza\a10_plaza_02 none 1.00)))

(script dormant void unlock_comment_3
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_3) 0.00) 7) unlock_comment_3
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_3
(sound_looping_start sound\commentary\a10_plaza\a10_plaza_03 none 1.00)))

(script dormant void unlock_comment_4
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_4) 0.00) 7) unlock_comment_4
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_4
(sound_looping_start sound\commentary\a10_plaza\a10_plaza_04 none 1.00)))

(script dormant void unlock_comment_5
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_5) 0.00) 7) unlock_comment_5
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_5
(sound_looping_start sound\commentary\a10_plaza\a10_plaza_05 none 1.00)))

(script dormant void unlock_comment_6
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_6) 0.00) 7) unlock_comment_6
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_6
(sound_looping_start sound\commentary\a10_plaza\a10_plaza_06 none 1.00)))

(script dormant void unlock_comment_7
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_7) 0.00) 7) unlock_comment_7
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_7
(sound_looping_start sound\commentary\a10_plaza\a10_plaza_07 none 1.00)))

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