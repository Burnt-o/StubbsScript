(global bool cutscene_running false)

(global bool test_mode false)

(global bool micro_round_test false)

(global bool all_stop false)

(global bool bonus_enable true)

(global bool dancing false)

(global short number_of_waves 8)

(global short number_of_rounds 4)

(global long move_length 16)

(global short view_window 8)

(global long synch_point 15)

(global bool moving false)

(global short wave_length 4)

(global short wave_number 0)

(global short try_again 0)

(global short round_length 8)

(global short round_number 0)

(global bool enable_double_moves false)

(global bool double_move_execute_pass false)

(global short dance_direction 0)

(global short correct_moves 0)

(global short camera_direction 0)

(global short ddr_test_fail 1)

(global short ddr_test_expire 2)

(global short ddr_test_pass 3)

(global short ddr_test_result 0)

(global real light_flash 0.01)

(global short total_score 0)

(global short round_score 0)

(global short wave_score 0)

(global real round_win_percent 0.66)

(global real easy_win_percent 0.50)

(global real hard_win_percent 0.75)

(global short max_perfect_score 0)

(global long dance_start_time 0)

(global short loop_time 135)

(global weapon batter_up masters)

(global bool stubbs_idle false)

(global bool masters_idle false)

(global bool stubbs_promenade_enter false)

(global bool masters_promenade_enter false)

(global bool prior_move true)

(global short stubbs_dance_1 0)

(global short stubbs_dance_2 0)

(global short stubbs_dance_3 0)

(global short stubbs_dance_4 0)

(global short stubbs_dance_5 0)

(global short stubbs_dance_6 0)

(global short stubbs_dance_7 0)

(global short stubbs_dance_8 0)

(global long temp_time_test 0)

(global long temp_sync_test 0)

(global bool show_elapsed_time true)

(global short spin_type 0)

(global short spin_pause 30)

(global long temp_move_length 0)

(global short temp_view_window 0)

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

(script static void cutscenes_on
(begin
(set show_cutscenes true)))

(script static void a45_40
(begin
(if
(= show_cutscenes true) a45_40)))

(script static void a45_50
(begin
(if
(= show_cutscenes true) a45_50)))

(script static void elapsed_time
(begin
(if show_elapsed_time
(begin
(set temp_time_test
(-
(game_time) dance_start_time))
(inspect temp_time_test)
(set dance_start_time
(game_time))))))

(script static bool sync
(begin
(set temp_sync_test
(-
(game_time) dance_start_time))
(if
(=
(modulo temp_sync_test move_length) synch_point) true false)))

(script static void sync_check
(begin
(if
(not sync_check)
(begin
(print out of synch)
(set temp_sync_test
(modulo temp_sync_test move_length))
(inspect temp_sync_test)))))

(script continuous void moving_control
(begin
(sleep -1)
(set moving true)
(sleep
(- move_length 2.00))
(set moving false) moving_control))

(script continuous void fire_flash_pots
(begin
(sleep -1)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_1)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_2)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_3)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_4)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_1)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_2)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_3)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_4)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_1)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_2)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_3)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_4)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_1)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_2)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_3)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_4)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_1)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_2)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_3)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_4)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_1)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_2)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_3)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_4)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_1)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_2)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_3)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_4)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_1)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_2)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_3)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\flash_pot flash_pot_4)))

(script continuous void fire_confetti
(begin
(sleep -1)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_1)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_2)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_3)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_4)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_1)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_2)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_3)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_4)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_1)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_2)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_3)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_4)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_1)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_2)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_3)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_4)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_1)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_2)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_3)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_4)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_1)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_2)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_3)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_4)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_1)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_2)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_3)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_4)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_1)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_2)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_3)
(sleep 5)
(effect_new_on_flag cinematics\effects\a40\confetti confetti_4)
(sleep 5)))

(script continuous void dance_camera_action
(begin
(set camera_direction
(+ camera_direction 1.00))
(if
(> camera_direction 3)
(set camera_direction 0))
(if
(and
(= camera_direction 0)
(= dancing true))
(begin
(camera_set dance_cam_1 120))
(if
(and
(= camera_direction 1)
(= dancing true))
(begin
(camera_set dance_cam_2 120))
(if
(and
(= camera_direction 2)
(= dancing true))
(begin
(camera_set dance_cam_3 120))
(if
(and
(= camera_direction 3)
(= dancing true))
(begin
(camera_set dance_cam_4 120))))))
(sleep 90)))

(script continuous void zombie_dance_idle
(begin
(sleep -1)
(custom_animation zombie_1 cinematics\animations\zombie\a40\a40 dance_idle true)
(custom_animation zombie_2 cinematics\animations\zombie\a40\a40 dance_idle true)
(custom_animation zombie_3 cinematics\animations\zombie\a40\a40 dance_idle true)
(custom_animation zombie_4 cinematics\animations\zombie\a40\a40 dance_idle true)))

(script continuous void cop_dance_idle
(begin
(sleep -1)
(custom_animation riot_cop_1 cinematics\animations\riot_cop\a40\a40 dance_idle true)
(custom_animation riot_cop_2 cinematics\animations\riot_cop\a40\a40 dance_idle true)
(custom_animation riot_cop_3 cinematics\animations\riot_cop\a40\a40 dance_idle true)
(custom_animation riot_cop_4 cinematics\animations\riot_cop\a40\a40 dance_idle true)))

(script continuous void stubbs_dance_idle
(begin
(sleep
(unit_get_custom_animation_time stubbs))
(if stubbs_idle
(begin
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 dance_idle true)))))

(script continuous void masters_dance_idle
(begin
(sleep
(unit_get_custom_animation_time masters))
(if masters_idle
(begin
(custom_animation masters cinematics\animations\masters\a45\a45 dance_idle true)))))

(script continuous void beat_the_floor
(begin
(sleep -1)
(device_set_position_immediate dancefloor 1.00)
(sleep view_window)
(device_set_position_immediate dancefloor 0.00)))

(script continuous void stepper
(begin
(sleep -1)
(wake beat_the_floor)
(wake zombie_dance_idle)
(if
(= dance_direction 0)
(begin
(device_set_position_immediate dance_right light_flash)
(device_set_position_immediate dance_up 1.00)
(device_set_position_immediate dance_down light_flash)
(device_set_position_immediate dance_left light_flash))
(if
(= dance_direction 1)
(begin
(device_set_position_immediate dance_right light_flash)
(device_set_position_immediate dance_up light_flash)
(device_set_position_immediate dance_down 1.00)
(device_set_position_immediate dance_left light_flash))
(if
(= dance_direction 2)
(begin
(device_set_position_immediate dance_right light_flash)
(device_set_position_immediate dance_up light_flash)
(device_set_position_immediate dance_down light_flash)
(device_set_position_immediate dance_left 1.00))
(if
(= dance_direction 3)
(begin
(device_set_position_immediate dance_right 1.00)
(device_set_position_immediate dance_up light_flash)
(device_set_position_immediate dance_down light_flash)
(device_set_position_immediate dance_left light_flash))))))
(sleep view_window)
(device_set_position_immediate dance_up 0.00)
(device_set_position_immediate dance_down 0.00)
(device_set_position_immediate dance_left 0.00)
(device_set_position_immediate dance_right 0.00)))

(script static void dance_pad_countdown
(begin
(object_create countdown4)
(wake zombie_dance_idle)
(wake cop_dance_idle)
(device_set_position_immediate countdown4 1.00)
(device_set_position_immediate dance_right light_flash)
(device_set_position_immediate dance_up light_flash)
(device_set_position_immediate dance_down light_flash)
(device_set_position_immediate dance_left light_flash)
(sleep view_window)
(device_set_position_immediate countdown4 0.00)
(device_set_position_immediate dance_right 0.00)
(device_set_position_immediate dance_up 0.00)
(device_set_position_immediate dance_down 0.00)
(device_set_position_immediate dance_left 0.00)
(sleep
(- move_length view_window))
(object_destroy countdown4)
(object_create countdown3)
(wake zombie_dance_idle)
(wake cop_dance_idle)
(device_set_position_immediate countdown3 1.00)
(device_set_position_immediate dance_right light_flash)
(device_set_position_immediate dance_up light_flash)
(device_set_position_immediate dance_down light_flash)
(device_set_position_immediate dance_left light_flash)
(sleep view_window)
(device_set_position_immediate countdown3 0.00)
(device_set_position_immediate dance_right 0.00)
(device_set_position_immediate dance_up 0.00)
(device_set_position_immediate dance_down 0.00)
(device_set_position_immediate dance_left 0.00)
(sleep
(- move_length view_window))
(object_destroy countdown3)
(object_create countdown2)
(wake zombie_dance_idle)
(wake cop_dance_idle)
(device_set_position_immediate countdown2 1.00)
(device_set_position_immediate dance_right light_flash)
(device_set_position_immediate dance_up light_flash)
(device_set_position_immediate dance_down light_flash)
(device_set_position_immediate dance_left light_flash)
(sleep view_window)
(device_set_position_immediate countdown2 0.00)
(device_set_position_immediate dance_right 0.00)
(device_set_position_immediate dance_up 0.00)
(device_set_position_immediate dance_down 0.00)
(device_set_position_immediate dance_left 0.00)
(sleep
(- move_length view_window))
(object_destroy countdown2)
(object_create countdown1)
(wake zombie_dance_idle)
(wake cop_dance_idle)
(device_set_position_immediate countdown1 1.00)
(device_set_position_immediate dance_right light_flash)
(device_set_position_immediate dance_up light_flash)
(device_set_position_immediate dance_down light_flash)
(device_set_position_immediate dance_left light_flash)
(sleep view_window)
(device_set_position_immediate countdown1 0.00)
(device_set_position_immediate dance_right 0.00)
(device_set_position_immediate dance_up 0.00)
(device_set_position_immediate dance_down 0.00)
(device_set_position_immediate dance_left 0.00)
(sleep
(-
(- move_length view_window) 1.00))
(object_destroy countdown1)))

(script continuous void test_expire
(begin
(sleep -1)
(sleep view_window)
(if
(and
(=
(player_action_test_dance_down) false)
(=
(player_action_test_dance_up) false)
(=
(player_action_test_dance_left) false)
(=
(player_action_test_dance_right) false)
(= ddr_test_result 0))
(set ddr_test_result ddr_test_expire))))

(script continuous void test_up_fail
(begin
(if
(or
(player_action_test_dance_down)
(player_action_test_dance_left)
(player_action_test_dance_right))
(set ddr_test_result ddr_test_fail))))

(script continuous void test_down_fail
(begin
(if
(or
(player_action_test_dance_up)
(player_action_test_dance_left)
(player_action_test_dance_right))
(set ddr_test_result ddr_test_fail))))

(script continuous void test_left_fail
(begin
(if
(or
(player_action_test_dance_up)
(player_action_test_dance_down)
(player_action_test_dance_right))
(set ddr_test_result ddr_test_fail))))

(script continuous void test_right_fail
(begin
(if
(or
(player_action_test_dance_up)
(player_action_test_dance_left)
(player_action_test_dance_down))
(set ddr_test_result ddr_test_fail))))

(script startup void turn_off_tests
(begin
(sleep -1 test_up_fail)
(sleep -1 test_down_fail)
(sleep -1 test_left_fail)
(sleep -1 test_right_fail)))

(script static void ddr_test_up
(begin
(set ddr_test_result 0)
(player_action_test_reset)
(wake test_expire)
(sleep -1 test_down_fail)
(sleep -1 test_left_fail)
(sleep -1 test_right_fail)
(wake test_up_fail)
(sleep_until
(or
(player_action_test_dance_up)
(= ddr_test_result ddr_test_fail)
(= ddr_test_result ddr_test_expire)) 1)
(if
(= ddr_test_result 0)
(set ddr_test_result ddr_test_pass))))

(script static void ddr_test_down
(begin
(set ddr_test_result 0)
(player_action_test_reset)
(wake test_expire)
(sleep -1 test_up_fail)
(sleep -1 test_left_fail)
(sleep -1 test_right_fail)
(wake test_down_fail)
(sleep_until
(or
(player_action_test_dance_down)
(= ddr_test_result ddr_test_fail)
(= ddr_test_result ddr_test_expire)) 1)
(if
(= ddr_test_result 0)
(set ddr_test_result ddr_test_pass))))

(script static void ddr_test_left
(begin
(set ddr_test_result 0)
(player_action_test_reset)
(wake test_expire)
(sleep -1 test_down_fail)
(sleep -1 test_up_fail)
(sleep -1 test_right_fail)
(wake test_left_fail)
(sleep_until
(or
(player_action_test_dance_left)
(= ddr_test_result ddr_test_fail)
(= ddr_test_result ddr_test_expire)) 1)
(if
(= ddr_test_result 0)
(set ddr_test_result ddr_test_pass))))

(script static void ddr_test_right
(begin
(set ddr_test_result 0)
(player_action_test_reset)
(wake test_expire)
(sleep -1 test_down_fail)
(sleep -1 test_left_fail)
(sleep -1 test_up_fail)
(wake test_right_fail)
(sleep_until
(or
(player_action_test_dance_right)
(= ddr_test_result ddr_test_fail)
(= ddr_test_result ddr_test_expire)) 1)
(if
(= ddr_test_result 0)
(set ddr_test_result ddr_test_pass))))

(script static void reset_spectators
(begin
(object_teleport riot_cop_1 riot_cop_1)
(object_teleport riot_cop_2 riot_cop_2)
(object_teleport riot_cop_3 riot_cop_3)
(object_teleport riot_cop_4 riot_cop_4)
(object_teleport zombie_1 zombie_1)
(object_teleport zombie_2 zombie_2)
(object_teleport zombie_3 zombie_3)
(object_teleport zombie_4 zombie_4)))

(script static void camera_spin_a
(begin
(camera_set spin_1a
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_2a
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_3a
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_4a
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_5a
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_6a
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_7a
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set dance_cam
(* spin_pause 2.00))))

(script static void camera_spin_b
(begin
(camera_set spin_1b
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_2b
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_3b
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_4b
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_5b
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_6b
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_7b
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set dance_cam
(* spin_pause 2.00))))

(script static void camera_spin_c
(begin
(camera_set spin_1c
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_2c
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_3c
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_4c
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_5c
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_6c
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_7c
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set dance_cam
(* spin_pause 2.00))))

(script static void camera_spin_d
(begin
(camera_set spin_1d
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_2d
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_3d
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_4d
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_5d
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_6d
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set spin_7d
(* spin_pause 2.00))
(sleep spin_pause)
(camera_set dance_cam
(* spin_pause 2.00))))

(script continuous void camera_spin
(begin
(sleep -1)
(set spin_pause
(-
(* move_length 2.00) 2.00))
(set spin_type
(random_range 0 4))
(if
(= round_number 1)
(begin
(set spin_type 1))
(if
(= round_number 2)
(begin
(set spin_type 0))
(if
(= round_number 3)
(begin
(set spin_type 2))
(if
(= round_number 4)
(begin
(set spin_type 3))
(if
(= round_number 5)
(begin
(set spin_type 0)))))))
(custom_animation riot_cop_1 cinematics\animations\riot_cop\a40\a40 dance_spin true)
(custom_animation riot_cop_2 cinematics\animations\riot_cop\a40\a40 dance_spin true)
(custom_animation riot_cop_3 cinematics\animations\riot_cop\a40\a40 dance_spin true)
(custom_animation riot_cop_4 cinematics\animations\riot_cop\a40\a40 dance_spin true)
(custom_animation zombie_1 cinematics\animations\zombie\a40\a40 dance_spin true)
(custom_animation zombie_2 cinematics\animations\zombie\a40\a40 dance_spin true)
(custom_animation zombie_3 cinematics\animations\zombie\a40\a40 dance_spin true)
(custom_animation zombie_4 cinematics\animations\zombie\a40\a40 dance_spin true)
(if
(= spin_type 0)
(begin camera_spin)
(if
(= spin_type 1)
(begin camera_spin)
(if
(= spin_type 2)
(begin camera_spin)
(if
(= spin_type 3)
(begin camera_spin)))))
(sleep
(unit_get_custom_animation_time riot_cop_1)) camera_spin))

(script continuous void masters_move
(begin
(sleep -1)
(if
(= round_number 1)
(begin
(if
(= dance_direction 0)
(begin
(custom_animation masters cinematics\animations\masters\a45\a45 dance_back_1 true))
(if
(= dance_direction 1)
(begin
(custom_animation masters cinematics\animations\masters\a45\a45 dance_front_1 true))
(if
(= dance_direction 2)
(begin
(custom_animation masters cinematics\animations\masters\a45\a45 dance_left_1 true))
(if
(= dance_direction 3)
(begin
(custom_animation masters cinematics\animations\masters\a45\a45 dance_right_1 true)))))))
(if
(= round_number 2)
(begin
(if
(= dance_direction 0)
(begin
(custom_animation masters cinematics\animations\masters\a45\a45 dance_back_2 true))
(if
(= dance_direction 1)
(begin
(custom_animation masters cinematics\animations\masters\a45\a45 dance_front_2 true))
(if
(= dance_direction 2)
(begin
(custom_animation masters cinematics\animations\masters\a45\a45 dance_left_2 true))
(if
(= dance_direction 3)
(begin
(custom_animation masters cinematics\animations\masters\a45\a45 dance_right_2 true)))))))
(if
(= round_number 3)
(begin
(if
(= dance_direction 0)
(begin
(custom_animation masters cinematics\animations\masters\a45\a45 dance_back_3 true))
(if
(= dance_direction 1)
(begin
(custom_animation masters cinematics\animations\masters\a45\a45 dance_front_3 true))
(if
(= dance_direction 2)
(begin
(custom_animation masters cinematics\animations\masters\a45\a45 dance_left_3 true))
(if
(= dance_direction 3)
(begin
(custom_animation masters cinematics\animations\masters\a45\a45 dance_right_3 true)))))))
(if
(= round_number 4)
(begin
(if
(= dance_direction 0)
(begin
(custom_animation masters cinematics\animations\masters\a45\a45 dance_back_4 true))
(if
(= dance_direction 1)
(begin
(custom_animation masters cinematics\animations\masters\a45\a45 dance_front_4 true))
(if
(= dance_direction 2)
(begin
(custom_animation masters cinematics\animations\masters\a45\a45 dance_left_4 true))
(if
(= dance_direction 3)
(begin
(custom_animation masters cinematics\animations\masters\a45\a45 dance_right_4 true)))))))
(if
(= round_number 5)
(begin
(if
(= dance_direction 0)
(begin
(custom_animation masters cinematics\animations\masters\a45\a45 dance_back_1 true))
(if
(= dance_direction 1)
(begin
(custom_animation masters cinematics\animations\masters\a45\a45 dance_front_1 true))
(if
(= dance_direction 2)
(begin
(custom_animation masters cinematics\animations\masters\a45\a45 dance_left_1 true))
(if
(= dance_direction 3)
(begin
(custom_animation masters cinematics\animations\masters\a45\a45 dance_right_1 true))))))))))))))

(script continuous void stubbs_promenade_enter
(begin
(if stubbs_promenade_enter
(begin
(set stubbs_idle false)
(object_teleport stubbs stubbs_not_dancing)
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 promenade_enter true)
(sleep
(unit_get_custom_animation_time stubbs))
(set stubbs_promenade_enter false)
(set stubbs_idle false)))))

(script continuous void hud_perfect
(begin
(sleep -1)
(object_create perfect)
(sleep
(* move_length 3.00))
(object_destroy perfect)))

(script dormant void hud_tip
(begin
(show_hud_help_text true)
(hud_set_help_text dance_help)
(sleep 210)
(show_hud_help_text false)))

(script continuous void stubbs_promenade_exit
(begin
(sleep -1)
(set stubbs_idle false)
(if
(= wave_score wave_length)
(begin
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 promenade_win true)
(wake hud_perfect))
(begin
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 promenade_lose true)))
(sleep
(unit_get_custom_animation_time stubbs))
(if
(not stubbs_promenade_enter)
(set stubbs_idle true))))

(script continuous void wait_masters_promenade_enter
(begin
(sleep -1)
(sleep
(unit_get_custom_animation_time masters))
(set masters_promenade_enter false)
(set masters_idle false)))

(script continuous void masters_promenade_enter
(begin
(if masters_promenade_enter
(begin
(set masters_idle false)
(object_teleport masters masters_not_dancing)
(custom_animation masters cinematics\animations\masters\a45\a45 promenade_enter false)
(set masters_promenade_enter false)
(set masters_idle false)))))

(script continuous void masters_promenade_exit
(begin
(sleep -1)
(set masters_idle false)
(custom_animation masters cinematics\animations\masters\a45\a45 promenade_exit false)
(sleep
(unit_get_custom_animation_time masters))
(if
(not masters_promenade_enter)
(set masters_idle true))))

(script static void enable_stubbs_promenade_enter
(begin
(set stubbs_idle false)
(set stubbs_promenade_enter true)))

(script static void enable_masters_promenade_enter
(begin
(if
(!= number_of_waves wave_number)
(begin
(set masters_idle false)
(set masters_promenade_enter true)))))

(script static void dance_call
(begin
(set masters_idle false)
(wake moving_control)
(set dance_direction
(random_range 0 4))
(if
(= round_number 1)
(begin
(if
(= wave_number 1)
(set dance_direction 1))
(if
(= wave_number 2)
(set dance_direction 2))))
(wake stepper)
(wake masters_move)
(set stubbs_dance_1 dance_direction)
(if
(= wave_length 1) dance_call)
(sleep_until
(= moving false) 1)
(sleep 1)
(if
(>= wave_length 2)
(begin
(wake moving_control)
(set dance_direction
(random_range 0 4))
(if
(= round_number 1)
(begin
(if
(= wave_number 1)
(set dance_direction 1))
(if
(= wave_number 2)
(set dance_direction 2))))
(wake stepper)
(wake masters_move)
(set stubbs_dance_2 dance_direction)
(if
(= wave_length 2) dance_call)
(sleep_until
(= moving false) 1)
(sleep 1)))
(if enable_double_moves
(begin
(set temp_move_length move_length)
(set temp_view_window view_window)
(set move_length
(/ move_length 2.00))
(set view_window
(/ view_window 2.00))))
(if
(>= wave_length 3)
(begin
(wake moving_control)
(set dance_direction
(random_range 0 4))
(if
(and
(= enable_double_moves true)
(= dance_direction stubbs_dance_2))
(begin
(set dance_direction
(+ stubbs_dance_2 1.00))
(if
(> dance_direction 3)
(set dance_direction 0))))
(if
(= round_number 1)
(begin
(if
(= wave_number 1)
(set dance_direction 1))
(if
(= wave_number 2)
(set dance_direction 3))))
(wake stepper)
(wake masters_move)
(set stubbs_dance_3 dance_direction)
(if
(= wave_length 3) dance_call)
(sleep_until
(= moving false) 1)
(sleep 1)))
(if
(>= wave_length 4)
(begin
(wake moving_control)
(set dance_direction
(random_range 0 4))
(if
(= round_number 1)
(begin
(if
(= wave_number 1)
(set dance_direction 1))
(if
(= wave_number 2)
(set dance_direction 3))))
(if enable_double_moves
(set dance_direction stubbs_dance_3))
(wake stepper)
(wake masters_move)
(set stubbs_dance_4 dance_direction)
(if
(= wave_length 4) dance_call)
(sleep_until
(= moving false) 1)
(sleep 1)))
(if enable_double_moves
(begin
(set move_length temp_move_length)
(set view_window temp_view_window)))
(if
(>= wave_length 5)
(begin
(wake moving_control)
(set dance_direction
(random_range 0 4))
(if
(and
(= enable_double_moves true)
(= dance_direction stubbs_dance_4))
(begin
(set dance_direction
(+ stubbs_dance_4 1.00))
(if
(> dance_direction 3)
(set dance_direction 0))))
(if
(= wave_length 8)
(set dance_direction stubbs_dance_1))
(wake stepper)
(wake masters_move)
(set stubbs_dance_5 dance_direction)
(if
(= wave_length 5) dance_call)
(sleep_until
(= moving false) 1)
(sleep 1)))
(if
(>= wave_length 6)
(begin
(wake moving_control)
(set dance_direction
(random_range 0 4))
(if
(= wave_length 8)
(set dance_direction stubbs_dance_2))
(wake stepper)
(wake masters_move)
(set stubbs_dance_6 dance_direction)
(if
(= wave_length 6) dance_call)
(sleep_until
(= moving false) 1)
(sleep 1)))
(if
(>= wave_length 7)
(begin
(wake moving_control)
(set dance_direction
(random_range 0 4))
(if
(= wave_length 8)
(set dance_direction stubbs_dance_3))
(wake stepper)
(wake masters_move)
(set stubbs_dance_7 dance_direction)
(if
(= wave_length 7) dance_call)
(sleep_until
(= moving false) 1)
(sleep 1)))
(if
(>= wave_length 8)
(begin
(wake moving_control)
(set dance_direction
(random_range 0 4))
(if
(= wave_length 8)
(set dance_direction stubbs_dance_4))
(wake stepper)
(wake masters_move)
(set stubbs_dance_8 dance_direction)
(if
(= wave_length 8) dance_call)
(sleep_until
(= moving false) 1)
(sleep 1)))
(sleep 1)))

(script static void stubbs_move_execute
(begin
(if
(= round_number 1)
(begin
(if
(= dance_direction 0)
(begin
(if
(and prior_move
(not double_move_execute_pass))
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 dance_back_1 true)) stubbs_move_execute)
(if
(= dance_direction 1)
(begin
(if
(and prior_move
(not double_move_execute_pass))
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 dance_front_1 true)) stubbs_move_execute)
(if
(= dance_direction 2)
(begin
(if
(and prior_move
(not double_move_execute_pass))
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 dance_left_1 true)) stubbs_move_execute)
(if
(= dance_direction 3)
(begin
(if
(and prior_move
(not double_move_execute_pass))
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 dance_right_1 true)) stubbs_move_execute))))))
(if
(= round_number 2)
(begin
(if
(= dance_direction 0)
(begin
(if
(and prior_move
(not double_move_execute_pass))
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 dance_back_2 true)) stubbs_move_execute)
(if
(= dance_direction 1)
(begin
(if
(and prior_move
(not double_move_execute_pass))
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 dance_front_2 true)) stubbs_move_execute)
(if
(= dance_direction 2)
(begin
(if
(and prior_move
(not double_move_execute_pass))
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 dance_left_2 true)) stubbs_move_execute)
(if
(= dance_direction 3)
(begin
(if
(and prior_move
(not double_move_execute_pass))
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 dance_right_2 true)) stubbs_move_execute))))))
(if
(= round_number 3)
(begin
(if
(= dance_direction 0)
(begin
(if
(and prior_move
(not double_move_execute_pass))
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 dance_back_3 true)) stubbs_move_execute)
(if
(= dance_direction 1)
(begin
(if
(and prior_move
(not double_move_execute_pass))
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 dance_front_3 true)) stubbs_move_execute)
(if
(= dance_direction 2)
(begin
(if
(and prior_move
(not double_move_execute_pass))
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 dance_left_3 true)) stubbs_move_execute)
(if
(= dance_direction 3)
(begin
(if
(and prior_move
(not double_move_execute_pass))
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 dance_right_3 true)) stubbs_move_execute))))))
(if
(= round_number 4)
(begin
(if
(= dance_direction 0)
(begin
(if
(and prior_move
(not double_move_execute_pass))
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 dance_back_4 true)) stubbs_move_execute)
(if
(= dance_direction 1)
(begin
(if
(and prior_move
(not double_move_execute_pass))
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 dance_front_4 true)) stubbs_move_execute)
(if
(= dance_direction 2)
(begin
(if
(and prior_move
(not double_move_execute_pass))
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 dance_left_4 true)) stubbs_move_execute)
(if
(= dance_direction 3)
(begin
(if
(and prior_move
(not double_move_execute_pass))
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 dance_right_4 true)) stubbs_move_execute))))))
(if
(= round_number 5)
(begin
(if
(= dance_direction 0)
(begin
(if
(and prior_move
(not double_move_execute_pass))
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 dance_back_1 true)) stubbs_move_execute)
(if
(= dance_direction 1)
(begin
(if
(and prior_move
(not double_move_execute_pass))
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 dance_front_1 true)) stubbs_move_execute)
(if
(= dance_direction 2)
(begin
(if
(and prior_move
(not double_move_execute_pass))
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 dance_left_1 true)) stubbs_move_execute)
(if
(= dance_direction 3)
(begin
(if
(and prior_move
(not double_move_execute_pass))
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 dance_right_1 true)) stubbs_move_execute)))))))))))))

(script static bool move_flub
(begin
(or
(player_action_test_dance_up)
(player_action_test_dance_down)
(player_action_test_dance_left)
(player_action_test_dance_right))))

(script continuous void stubbs_move
(begin
(sleep -1)
(set prior_move false) stubbs_move
(if
(= ddr_test_result ddr_test_expire)
(begin
(set prior_move false)
(unit_stop_custom_animation stubbs)
(print expire))
(if
(= ddr_test_result ddr_test_fail)
(begin
(custom_animation stubbs cinematics\animations\stubbs\a45\a45 dance_fail true)
(sound_impulse_start sound\dialog\stubbs\grunt stubbs 1.00)
(print fail))
(if
(= ddr_test_result ddr_test_pass)
(begin
(print pass)
(sound_impulse_start sound\sfx\impulse\animations\stubbs\dance none 1.00)
(if
(not prior_move)
(begin
(set prior_move true) stubbs_move))
(set prior_move true)
(set round_score
(+ round_score 1.00))
(set wave_score
(+ wave_score 1.00))))))))

(script static void predict_next_song
(begin
(if
(= wave_number number_of_waves)
(begin
(if
(= round_number 1)
(begin
(begin
(print predicting round2)
(sound_looping_predict sound\music\a45\r2)))
(if
(= round_number 2)
(begin
(begin
(print predicting round3)
(sound_looping_predict sound\music\a45\r3)))
(if
(= round_number 3)
(begin
(begin
(print predicting round4)
(sound_looping_predict sound\music\a45\r4)))
(if
(= round_number 4)
(begin
(begin
(print predicting round5)
(sound_looping_predict sound\music\a45\r5)))))))))))

(script static void dance_response
(begin
(set stubbs_idle false)
(set correct_moves 0)
(set prior_move false) dance_response
(print move 1)
(wake moving_control)
(player_action_test_reset)
(set dance_direction stubbs_dance_1)
(wake stepper)
(wake stubbs_move)
(if
(= wave_length 1) dance_response)
(sleep_until
(= moving false) 1)
(player_action_test_reset)
(sleep 1)
(if
(>= wave_length 2)
(begin
(print move 2)
(wake moving_control)
(set dance_direction stubbs_dance_2)
(wake stepper)
(wake stubbs_move)
(if
(= wave_length 2) dance_response)
(sleep_until
(= moving false) 1)
(player_action_test_reset)
(sleep 1)))
(if enable_double_moves
(begin
(set temp_move_length move_length)
(set temp_view_window view_window)
(set move_length 7)
(set view_window 4)))
(if
(>= wave_length 3)
(begin
(print move 3)
(wake moving_control)
(set dance_direction stubbs_dance_3)
(wake stepper)
(wake stubbs_move)
(if
(= wave_length 3) dance_response)
(sleep_until
(= moving false) 1)
(player_action_test_reset)
(sleep 1)))
(if enable_double_moves
(begin
(set move_length 7)
(set view_window 4)))
(if
(>= wave_length 4)
(begin
(print move 4)
(wake moving_control)
(set dance_direction stubbs_dance_4)
(wake stepper)
(if enable_double_moves
(set double_move_execute_pass true))
(wake stubbs_move)
(if
(= wave_length 4) dance_response)
(sleep_until
(= moving false) 1)
(player_action_test_reset)
(sleep 1)
(if enable_double_moves
(set double_move_execute_pass false))))
(if enable_double_moves
(begin
(set move_length temp_move_length)
(set view_window temp_view_window)))
(if
(>= wave_length 5)
(begin
(print move 5)
(wake moving_control)
(set dance_direction stubbs_dance_5)
(wake stepper)
(wake stubbs_move)
(if
(= wave_length 5) dance_response)
(sleep_until
(= moving false) 1)
(player_action_test_reset)
(sleep 1)))
(if
(>= wave_length 6)
(begin
(wake moving_control)
(set dance_direction stubbs_dance_6)
(wake stepper)
(wake stubbs_move)
(if
(= wave_length 6) dance_response)
(sleep_until
(= moving false) 1)
(player_action_test_reset)
(sleep 1)))
(if
(>= wave_length 7)
(begin
(wake moving_control)
(set dance_direction stubbs_dance_7)
(wake stepper)
(wake stubbs_move)
(if
(= wave_length 7) dance_response)
(sleep_until
(= moving false) 1)
(player_action_test_reset)
(sleep 1)))
(if
(>= wave_length 8)
(begin
(wake moving_control)
(set dance_direction stubbs_dance_8)
(wake stepper)
(wake stubbs_move)
(if
(= wave_length 8) dance_response)
(sleep_until
(= moving false) 1)
(sleep 1)))))

(script static void round_header
(begin
(wake camera_spin)
(if
(game_is_cooperative)
(begin
(if
(= round_number 1)
(begin
(cinematic_set_title round_one_coop))
(if
(= round_number 2)
(begin
(begin
(cinematic_set_title round_two_coop)
(wake fire_flash_pots)))
(if
(= round_number 3)
(begin
(begin
(cinematic_set_title round_three_coop)
(wake fire_confetti)))
(if
(= round_number 4)
(begin
(begin
(cinematic_set_title round_four_coop)
(wake fire_flash_pots)
(wake fire_confetti)))
(if
(= round_number 5)
(begin
(cinematic_set_title bonus_round_coop))))))))
(begin
(if
(= round_number 1)
(begin
(cinematic_set_title round_one))
(if
(= round_number 2)
(begin
(begin
(cinematic_set_title round_two)
(wake fire_flash_pots)))
(if
(= round_number 3)
(begin
(begin
(cinematic_set_title round_three)
(wake fire_confetti)))
(if
(= round_number 4)
(begin
(begin
(cinematic_set_title round_four)
(wake fire_flash_pots)
(wake fire_confetti)))
(if
(= round_number 5)
(begin
(cinematic_set_title bonus_round)))))))))))

(script continuous void intro_masters_idle
(begin
(sleep -1)
(sleep 1)
(sleep
(unit_get_custom_animation_time masters))
(set masters_idle true)))

(script static void intro
(begin
(print running intro)
(set dance_start_time
(game_time)) intro intro
(wake intro_masters_idle)
(wake beat_the_floor)
(sleep 4)
(sleep
(- move_length 4.00))
(wake beat_the_floor)
(sleep move_length)
(wake beat_the_floor)
(sleep move_length)
(wake beat_the_floor)
(sleep move_length)
(wake beat_the_floor)
(sleep move_length)
(wake beat_the_floor)
(sleep move_length)
(wake beat_the_floor)
(sleep move_length)
(wake beat_the_floor)
(sleep move_length)
(wake beat_the_floor)
(sleep move_length)
(wake beat_the_floor)
(sleep move_length)
(wake beat_the_floor)
(sleep move_length)
(wake beat_the_floor)
(sleep move_length)))

(script static void masters_concede
(begin
(if
(= round_number 1)
(begin
(sound_impulse_start sound\dialog\a45\se_masters_lose_1 masters 1.00))
(if
(= round_number 2)
(begin
(sound_impulse_start sound\dialog\a45\se_masters_lose_2 masters 1.00))
(if
(= round_number 3)
(begin
(sound_impulse_start sound\dialog\a45\se_masters_lose_3 masters 1.00))
(if
(= round_number 4)
(begin
(sound_impulse_start sound\dialog\a45\se_masters_lose_4 masters 1.00))))))))

(script static void masters_taunt
(begin
(if
(= round_number 1)
(begin
(sound_impulse_start sound\dialog\a45\se_masters_win_1 masters 1.00)
(sleep
(sound_impulse_time sound\dialog\a45\se_masters_win_1)))
(if
(= round_number 2)
(begin
(sound_impulse_start sound\dialog\a45\se_masters_win_2 masters 1.00)
(sleep
(sound_impulse_time sound\dialog\a45\se_masters_win_2)))
(if
(= round_number 3)
(begin
(sound_impulse_start sound\dialog\a45\se_masters_win_3 masters 1.00)
(sleep
(sound_impulse_time sound\dialog\a45\se_masters_win_3)))
(if
(= round_number 4)
(begin
(sound_impulse_start sound\dialog\a45\se_masters_win_4 masters 1.00)
(sleep
(sound_impulse_time sound\dialog\a45\se_masters_win_4)))))))))

(script static void stop_music
(begin
(if
(= round_number 1)
(begin
(sound_looping_stop sound\music\a45\r1))
(if
(= round_number 2)
(begin
(sound_looping_stop sound\music\a45\r2))
(if
(= round_number 3)
(begin
(sound_looping_stop sound\music\a45\r3))
(if
(= round_number 4)
(begin
(sound_looping_stop sound\music\a45\r4))
(if
(= round_number 5)
(begin
(sound_looping_stop sound\music\a45\r5)))))))))

(script static void start_music
(begin
(if
(= round_number 1)
(begin
(sound_looping_start sound\music\a45\r1 none 0.50))
(if
(= round_number 2)
(begin
(sound_looping_start sound\music\a45\r2 none 0.50))
(if
(= round_number 3)
(begin
(sound_looping_start sound\music\a45\r3 none 0.50))
(if
(= round_number 4)
(begin
(sound_looping_start sound\music\a45\r4 none 0.50))
(if
(= round_number 5)
(begin
(sound_looping_start sound\music\a45\r5 none 0.50)))))))))

(script static void restart_round
(begin
(set try_again
(+ try_again 1.00))
(if
(and
(> round_number 1)
(= try_again 3))
(begin
(set bonus_enable false)
(set try_again 0)
(display_scenario_help 2)
(sleep 2)))
(set wave_number 0)
(set round_score 0)
(fade_out 0.00 0.00 0.00 0) restart_round
(unit_stop_custom_animation stubbs)
(unit_stop_custom_animation masters)
(sleep -1 dance_camera_action)
(camera_set dance_cam 0)
(set stubbs_idle true)
(object_teleport stubbs stubbs_not_dancing)
(object_teleport masters masters_not_dancing)
(fade_in 0.00 0.00 0.00 30) restart_round
(print intro: restart round) restart_round
(wake dance_camera_action)))

(script static void check_for_spaz
(begin
(if
(< round_score 4)
(begin
(if
(= try_again 0)
(begin
(display_scenario_help 0)
(sleep 1)))
(if
(= try_again 1)
(begin
(display_scenario_help 1)
(sleep 1)))
(if
(= try_again 2)
(begin
(display_scenario_help 2)
(sleep 2)
(set try_again 0))) check_for_spaz))))

(script static void victory_condition
(begin
(if
(and
(= round_number 1)
(= wave_number 1)) victory_condition)
(if
(= wave_number number_of_waves)
(begin
(sleep -1 dance_camera_action) victory_condition
(inspect round_score)
(inspect total_score)
(if
(or
(>
(/ round_score
(* wave_length number_of_waves)) round_win_percent)
(= round_number 5))
(begin
(set dancing false) victory_condition)
(begin
(print you lose)
(object_teleport masters masters_not_dancing)
(camera_set dance_lose 30) victory_condition victory_condition))))))

(script continuous void do_the_dance
(begin
(if dancing
(begin
(set wave_number
(+ wave_number 1.00))
(set wave_score 0) do_the_dance do_the_dance
(wake masters_promenade_exit) do_the_dance do_the_dance
(wake stubbs_promenade_exit) do_the_dance do_the_dance))))

(script static void round_handler
(begin
(if
(game_is_cooperative)
(begin
(player_action_test_enable 1 false)
(player_action_test_enable 0 true)))
(set round_number 1)
(set wave_number 0)
(set round_score 0)
(set total_score 0)
(set try_again 0)
(set number_of_waves 4)
(if micro_round_test
(set number_of_waves 1)) round_handler round_handler
(set max_perfect_score
(+ max_perfect_score
(* number_of_waves wave_length)))
(set dancing true)
(wake dance_camera_action)
(sleep_until
(= dancing false) 1)
(set total_score
(+ total_score round_score))
(sleep 1)
(if
(game_is_cooperative)
(begin
(player_action_test_enable 1 true)
(player_action_test_enable 0 false)))
(set round_number 2)
(set wave_number 0)
(set round_score 0)
(set try_again 0)
(set number_of_waves 4)
(if micro_round_test
(set number_of_waves 1)) round_handler
(print intro: roundhandlerii) round_handler
(set max_perfect_score
(+ max_perfect_score
(* number_of_waves wave_length)))
(set dancing true)
(wake dance_camera_action)
(sleep_until
(= dancing false) 1)
(set total_score
(+ total_score round_score))
(sleep 1)
(if
(game_is_cooperative)
(begin
(player_action_test_enable 1 false)
(player_action_test_enable 0 true)))
(set move_length 14)
(set view_window 7)
(set round_number 3)
(set wave_number 0)
(set round_score 0)
(set try_again 0)
(set number_of_waves 8)
(if micro_round_test
(set number_of_waves 1)) round_handler
(set max_perfect_score
(+ max_perfect_score
(* number_of_waves wave_length))) round_handler
(set dancing true)
(wake dance_camera_action)
(sleep_until
(= dancing false) 1)
(set total_score
(+ total_score round_score))
(sleep 1)
(if
(game_is_cooperative)
(begin
(player_action_test_enable 1 true)
(player_action_test_enable 0 false)))
(set round_number 4)
(set move_length 14)
(set view_window 7)
(set wave_number 0)
(set round_score 0)
(set try_again 0)
(set number_of_waves 8)
(if micro_round_test
(set number_of_waves 1))
(set wave_length 5)
(set enable_double_moves true) round_handler round_handler
(set max_perfect_score
(+ max_perfect_score
(* number_of_waves wave_length)))
(set dancing true)
(wake dance_camera_action)
(sleep_until
(= dancing false) 1)
(set total_score
(+ total_score round_score))
(sleep 1)
(if bonus_enable
(begin
(if
(game_is_cooperative)
(begin
(player_action_test_enable 1 false)
(player_action_test_enable 0 true)))
(set move_length 14)
(set view_window 7)
(set round_number 5)
(set wave_number 0)
(set round_score 0)
(set try_again 0)
(set number_of_waves 8)
(if micro_round_test
(set number_of_waves 1))
(set wave_length 8)
(set enable_double_moves false) round_handler round_handler
(set max_perfect_score
(+ max_perfect_score
(* number_of_waves wave_length)))
(set dancing true)
(wake dance_camera_action)
(sleep_until
(= dancing false) 1)
(set total_score
(+ total_score round_score)))
(begin
(set max_perfect_score
(+ max_perfect_score
(* number_of_waves wave_length)))))))

(script static void dance_difficulty
(begin
(if
(=
(game_difficulty_get) easy)
(set round_win_percent easy_win_percent))
(if
(=
(game_difficulty_get) hard)
(set round_win_percent hard_win_percent))
(if
(=
(game_difficulty_get) impossible)
(set round_win_percent hard_win_percent))))

(script static void perfect_scene
(begin
(fade_out 0.00 0.00 0.00 0)
(sound_looping_predict sound\music\barbershop\maggies_melons) perfect_scene
(object_activation_add_camera perfect_01)
(object_destroy stubbs)
(object_destroy masters)
(object_destroy zombie_1)
(object_destroy zombie_2)
(object_destroy zombie_3)
(object_destroy zombie_4)
(object_destroy riot_cop_1)
(object_destroy riot_cop_2)
(object_destroy riot_cop_3)
(object_destroy riot_cop_4)
(object_create perfect_podium)
(object_create perfect_microphone)
(object_create perfect_limo)
(object_create perfect_skegness_1)
(unit_set_seat perfect_skegness_1 alert)
(unit_set_weapon perfect_skegness_1 none)
(object_create perfect_security_1)
(unit_set_seat perfect_security_1 alert)
(unit_set_weapon perfect_security_1 none)
(object_create perfect_security_2)
(unit_set_seat perfect_security_2 alert)
(unit_set_weapon perfect_security_2 none)
(object_create perfect_security_3)
(unit_set_seat perfect_security_3 alert)
(unit_set_weapon perfect_security_3 none)
(sleep 30)
(print a45_perfect)
(camera_set perfect_01 0)
(camera_set perfect_01b 120)
(fade_in 0.00 0.00 0.00 0)
(sound_looping_start sound\music\barbershop\maggies_melons none 1.00)
(sleep 120)
(camera_set perfect_02 1500)
(sleep 60)
(sleep
(* 62.00 30.00))
(fade_out 0.00 0.00 0.00 90)
(sleep 90) perfect_scene
(object_activation_clear)
(object_destroy_containing perfect_)))

(script static void end_cutscene
(begin
(fade_out 0.00 0.00 0.00 0) end_cutscene
(sleep 1)
(print the dance is over)
(print your score:)
(inspect total_score)
(object_destroy stubbs)
(object_destroy masters)
(object_destroy zombie_1)
(object_destroy zombie_2)
(object_destroy zombie_3)
(object_destroy zombie_4)
(object_destroy riot_cop_1)
(object_destroy riot_cop_2)
(object_destroy riot_cop_3)
(object_destroy riot_cop_4)
(if end_cutscene end_cutscene) end_cutscene))

(script dormant void quit
(begin
(set all_stop true) quit quit
(game_won)))

(script static void abort_dance
(begin
(wake quit)))

(script startup void dance_battle
(begin
(fade_out 0.00 0.00 0.00 0)
(sleep -1 dance_camera_action) dance_battle
(if dance_battle dance_battle) dance_battle dance_battle
(cinematic_show_letterbox false)
(player_action_test_enable 1 false)
(sound_class_set_gain unit_footsteps 0.00 0)
(player_enable_input false)
(camera_control true 0)
(camera_set dance_cam 0) dance_battle
(sound_looping_predict sound\music\a45\r1)
(object_create masters)
(object_create stubbs)
(object_create dancefloor)
(object_create riot_cop_1)
(object_create riot_cop_2)
(object_create riot_cop_3)
(object_create riot_cop_4)
(object_create zombie_1)
(object_create zombie_2)
(object_create zombie_3)
(object_create zombie_4)
(object_create disco_ball)
(object_create dance_up)
(object_create dance_down)
(object_create dance_left)
(object_create dance_right)
(sleep 60)
(camera_set dance_cam 0)
(object_teleport stubbs stubbs_not_dancing)
(object_teleport masters masters_not_dancing)
(set stubbs_idle true)
(set masters_idle true)
(image_effect_set image_effects\technicolor)
(fade_in 0.00 0.00 0.00 30)
(wake hud_tip) dance_battle
(sleep -1 dance_camera_action)
(sleep 30)
(sound_class_set_gain unit_footsteps 1.00 0)
(if
(= max_perfect_score total_score) dance_battle) dance_battle
(player_action_test_enable 1 true)
(player_action_test_enable 0 true)
(game_won)))

(script continuous void all_stop_now
(begin
(if all_stop
(begin
(set dancing false)
(sleep -1 dance_battle)
(sleep -1 dance_camera_action)
(sleep -1 round_handler)
(sleep -1 check_for_spaz)
(sleep -1 restart_round)
(sleep -1 camera_spin)
(sleep -1 do_the_dance)
(sleep -1 victory_condition)
(sleep -1 stubbs_dance_idle)
(sleep -1 masters_dance_idle)
(sleep -1 beat_the_floor)
(sleep -1 stubbs_dance_idle)
(sleep -1 intro)
(sleep -1 dance_battle)))))

(script static void a45_40_run
(begin
(fade_out 0.00 0.00 0.00 0)
(sound_looping_predict sound\cinematics\a45\40_foley_1) a45_40_run
(object_activation_add_camera 40_01)
(object_create 40_stubbs_1)
(object_beautify 40_stubbs_1 true)
(object_create 40_masters_1)
(object_beautify 40_masters_1 true)
(object_create 40_chair_1)
(sound_looping_start sound\cinematics\a45\40_foley_1 none 0.60)
(print a45_40:  masters blasters)
(custom_animation 40_stubbs_1 cinematics\animations\stubbs\a40\a40 a40_40_stubbs_1 false)
(camera_set 40_01 0)
(fade_in 0.00 0.00 0.00 0)
(sleep 90)
(custom_animation 40_masters_1 cinematics\animations\masters\a40\a40 a40_40_masters_3 false)
(scenery_animation_start 40_chair_1 scenery\a40_police_station\leather_chair\leather_chair a40_40_chair_3)
(camera_set 40_02 0)
(camera_set 40_02b 300)
(sleep 54)
(sound_impulse_start sound\dialog\a45\40_masters_1 40_masters_1 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\a45\40_masters_1) 30.00))
(object_create 40_cop_1)
(object_beautify 40_cop_1 true)
(object_create 40_cop_2)
(object_beautify 40_cop_2 true)
(object_create 40_cop_3)
(object_beautify 40_cop_3 true)
(object_create 40_cop_4)
(object_beautify 40_cop_4 true)
(recording_play 40_cop_1 40_cop_1)
(recording_play 40_cop_3 40_cop_3)
(recording_play 40_cop_4 40_cop_4)
(sleep 10)
(recording_play 40_cop_2 40_cop_2)
(custom_animation 40_masters_1 cinematics\animations\masters\a40\a40 a40_40_masters_4 false)
(scenery_animation_start 40_chair_1 scenery\a40_police_station\leather_chair\leather_chair a40_40_chair_4)
(camera_set 40_03 0)
(sleep 17)
(sound_impulse_start sound\dialog\a45\40_masters_2 40_masters_1 1.00)
(sleep
(-
(sound_impulse_time sound\dialog\a45\40_masters_2) 120.00))
(camera_set 40_02 0)
(sleep
(-
(sound_impulse_time sound\dialog\a45\40_masters_2) 35.00))
(camera_set 40_02c 0)
(print masters does the snf pose)
(object_create 40_zombie_1)
(object_create 40_zombie_2)
(object_create 40_zombie_3)
(object_create 40_zombie_4)
(recording_play 40_zombie_1 40_zombie_1)
(recording_play 40_zombie_2 40_zombie_2)
(recording_play 40_zombie_3 40_zombie_3)
(recording_play 40_zombie_4 40_zombie_4)
(sleep 30)
(object_create 40_disco_ball_1)
(sleep
(unit_get_custom_animation_time 40_masters_1))
(object_teleport 40_stubbs_1 40_stubbs_1)
(custom_animation 40_stubbs_1 cinematics\animations\stubbs\a40\a40 a40_40_stubbs_2 false)
(camera_set 40_06 0)
(print zombies bust into room)
(sleep
(unit_get_custom_animation_time 40_stubbs_1))
(fade_out 0.00 0.00 0.00 0) a45_40_run
(object_activation_clear)
(object_destroy_containing 40_)))

(script static void a45_50_run
(begin
(fade_out 0.00 0.00 0.00 0)
(sound_looping_predict sound\cinematics\a45\50_foley_1) a45_50_run
(object_activation_add_camera 50_01)
(object_create 50_masters_1)
(object_beautify 50_masters_1 true)
(object_create 50_guts_1)
(objects_attach 50_masters_1 leftfoot 50_guts_1 none)
(effect_new_on_object_marker weapons\gut_grenade\gut_trail 50_masters_1 leftfoot)
(sleep 30)
(sound_looping_start sound\cinematics\a45\50_foley_1 none 0.75)
(print a45_50:  masters blast off)
(custom_animation 50_masters_1 cinematics\animations\masters\a40\a40 a40_50_masters_1start false)
(camera_set 50_01 0)
(fade_in 0.00 0.00 0.00 0)
(sleep 45)
(camera_set 50_01b 330)
(sleep
(unit_get_custom_animation_time 50_masters_1))
(custom_animation 50_masters_1 cinematics\animations\masters\a40\a40 a40_50_masters_1end false)
(camera_set 50_02 0)
(camera_set 50_02b 150)
(sleep
(unit_get_custom_animation_time 50_masters_1))
(object_create_anew 50_masters_1)
(object_create 50_guts_1)
(objects_attach 50_masters_1 leftfoot 50_guts_1 none)
(object_teleport 50_masters_1 50_masters_4)
(camera_set 50_03 0)
(print ta-da!)
(sound_impulse_start sound\dialog\a45\50_masters_1 50_masters_1 1.00)
(sleep
(sound_impulse_time sound\dialog\a45\50_masters_1))
(sound_class_set_gain projectile_detonation 0.00 0)
(sound_impulse_start sound\sfx\weapons\gut_grenade\idle 50_guts_1 1.00)
(camera_set 50_04 15)
(sleep 30)
(effect_new_on_object_marker weapons\gut_grenade\gut_grenade_detonation 50_masters_1 leftfoot)
(sound_looping_predict sound\cinematics\a45\50_foley_2)
(sound_impulse_stop sound\sfx\weapons\gut_grenade\idle)
(sleep 30)
(fade_out 1.00 1.00 1.00 15)
(sleep 15)
(switch_bsp 1)
(sleep 1)
(cinematic_set_near_clip_distance 0.01)
(object_create 50_stubbs_1)
(custom_animation 50_stubbs_1 cinematics\animations\stubbs\a40\a40 a40_50_stubbs_1 false)
(sound_looping_start sound\cinematics\a45\50_foley_2 none 1.00)
(camera_set 50_05 0)
(fade_in 1.00 1.00 1.00 15)
(sleep 5)
(object_activation_add_camera 50_05)
(sleep 2)
(effect_new_on_flag weapons\gut_grenade\gut_grenade_detonation 50_explosion_1)
(sleep 1)
(effect_new_on_flag weapons\gut_grenade\gut_grenade_detonation 50_explosion_2)
(sleep 2)
(effect_new_on_flag weapons\gut_grenade\gut_grenade_detonation 50_explosion_3)
(sleep 42)
(fade_out 0.00 0.00 0.00 0) a45_50_run
(object_activation_clear)
(object_destroy_containing 50_)
(sound_class_set_gain projectile_detonation 1.00 30)))

(script static void cutscenes_off
(begin
(set show_cutscenes false)))

(script static void preview
(begin preview preview preview))

(script startup void test
(begin
(if
(> test 0) test)
(if
(= test 40) test)
(if
(= test 50) test)))

(script static void next_cutscene
(begin
(map_name levels\a50_maul\a50_maul_cutscene)))