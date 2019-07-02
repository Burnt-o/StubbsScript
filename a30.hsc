
(global boolean cutscene_running false)

(global boolean sodomobile_music false)

(global short modal_help_timer 300)

(global boolean control_room_switch false)

(global boolean control_bots_placed false)

(global boolean allow_3_2_bsp_switch true)

(global boolean a30_40_wrapper_running false)

(global boolean scifi2_placed false)

(global boolean show_cutscenes false)

(global short test 0)


(script static weapon player_current0
    (unit (list_get (players_current) 0))
)

(script static weapon player_current1
    (unit (list_get (players_current) 1))
)

(script static weapon player_origin0
    (unit (list_get (players_origin) 0))
)

(script static weapon player_origin1
    (unit (list_get (players_origin) 1))
)

(script static weapon player_nonorigin0
    (unit (list_get (players_nonorigin) 0))
)

(script static weapon player_nonorigin1
    (unit (list_get (players_nonorigin) 1))
)

(script static boolean cinematic_skip_start
    (begin
        (cinematic_skip_start_internal)
        (game_save_totally_unsafe)
        (sleep_until (not (game_saving)) 1)
        (not (game_reverted))
    )
)

(script static void cinematic_skip_stop
    (cinematic_skip_stop_internal)
)

(script static void start_cutscene
    (begin
        (show_hud false)
        (player_enable_input false)
        (player_camera_control false)
        (camera_control true 0)
        (image_effect_set "image_effects\technicolor")
        (cinematic_start)
        (set cutscene_running true)
    )
)

(script static void stop_cutscene
    (begin
        (show_hud true)
        (player_enable_input true)
        (player_camera_control true)
        (camera_control false 0)
        (image_effect_end)
        (cinematic_stop)
        (set cutscene_running false)
    )
)

(script static void start_cutscene_no_effect
    (begin
        (show_hud false)
        (player_enable_input false)
        (player_camera_control false)
        (camera_control true 0)
        (cinematic_start)
        (set cutscene_running true)
    )
)

(script static boolean cutscene_in_progress
    (if cutscene_running
        true
        false
    )
)

(script static weapon player0
    (unit (list_get (players) 0))
)

(script static weapon player1
    (unit (list_get (players) 1))
)

(script static void skip_first_bsp
    (begin
        (switch_bsp 1)
        (object_teleport (player0) "farm_start_flag")
        (object_teleport (player1) "farm_start_flag2")
        (farm_setup)
    )
)

(script static void game_save_pmc
    (begin
        (game_save_cancel)
        (game_save_no_timeout)
    )
)

(script dormant vehicle_hud_tip_on
    (begin
        (print "vehicle_hud_tip_on")
        (show_hud_help_text true)
        (hud_set_help_text "vehicles")
        (if (not (game_is_cooperative))
            (begin
                (sleep modal_help_timer)
                (show_hud_help_text true)
                (hud_set_help_text "blank")
                (sleep 2)
                (display_scenario_help 0)
                (sleep 2)
                (show_hud_help_text true)
                (hud_set_help_text "vehicles")
            )
        )
        (sleep (* 30 60))
        (show_hud_help_text false)
        (sleep -1)
    )
)

(script static void vehicle_hud_tip_off
    (begin
        (print "vehicle_hud_tip_off")
        (sleep -1 vehicle_hud_tip_on)
        (enable_hud_help_flash false)
        (show_hud_help_text false)
    )
)

(script dormant vehicle_hud_tip2_on
    (begin
        (print "vehicle_hud_tip2_on")
        (show_hud_help_text true)
        (hud_set_help_text "vehicles2")
        (if (not (game_is_cooperative))
            (begin
                (sleep modal_help_timer)
                (hud_set_help_text "blank")
                (sleep 2)
                (display_scenario_help 1)
                (sleep 2)
                (hud_set_help_text "vehicles2")
            )
        )
        (sleep (* 30 60))
        (show_hud_help_text false)
        (sleep -1)
    )
)

(script static void vehicle_hud_tip2_off
    (begin
        (print "vehicle_hud_tip2_off")
        (sleep -1 vehicle_hud_tip2_on)
        (enable_hud_help_flash false)
        (show_hud_help_text false)
    )
)

(script dormant grenade_hud_tip_on
    (begin
        (print "grenade_hud_tip_on")
        (show_hud_help_text true)
        (hud_set_help_text "grenade")
        (if (not (game_is_cooperative))
            (begin
                (sleep modal_help_timer)
                (show_hud_help_text true)
                (hud_set_help_text "blank")
                (sleep 2)
                (display_scenario_help 2)
                (sleep 2)
                (show_hud_help_text true)
                (hud_set_help_text "grenade")
            )
        )
        (sleep (* 30 60))
        (show_hud_help_text false)
        (sleep -1)
    )
)

(script static void grenade_hud_tip_off
    (begin
        (print "grenade_hud_tip_off")
        (sleep -1 grenade_hud_tip_on)
        (enable_hud_help_flash false)
        (show_hud_help_text false)
    )
)

(script dormant grenade_hud_tip2_on
    (begin
        (print "grenade_hud_tip2_on")
        (show_hud_help_text true)
        (hud_set_help_text "grenade2")
        (sleep (* 30 10))
        (show_hud_help_text false)
        (sleep -1)
    )
)

(script static void grenade_hud_tip2_off
    (begin
        (print "grenade_hud_tip2_off")
        (sleep -1 grenade_hud_tip2_on)
        (enable_hud_help_flash false)
        (show_hud_help_text false)
    )
)

(script static void give_player_grenade
    (begin
        (player_set_profile (player_origin0) "grenade" true)
        (if (game_is_cooperative)
            (player_set_profile (player_origin1) "grenade" true)
        )
    )
)

(script static void begin_level
    (print "begin_level")
)

(script startup lets_get_bizzay
    (begin
        (ai_allegiance "player" "zombie")
        (cutscenes_on)
        (fade_out 0 0 0 0)
        (if (cinematic_skip_start)
            (a30_10)
        )
        (cinematic_skip_stop)
        (skip_first_bsp)
    )
)

(script dormant control_room_waypoint
    (begin
        (sleep 9000)
        (if (= (device_group_get "scifi_group") 0)
            (begin
                (object_activation_add_object "scifi_switch")
                (activate_nav_point_object "default" (player_origin0) "scifi_switch" 0.2)
                (activate_nav_point_object "default" (player_origin1) "scifi_switch" 0.2)
                (sleep_until (= (device_group_get "scifi_group") 1))
                (deactivate_nav_point_object (player_origin0) "scifi_switch")
                (deactivate_nav_point_object (player_origin1) "scifi_switch")
            )
        )
    )
)

(script dormant scifi_door_waypoint
    (begin
        (sleep 9000)
        (if (= (structure_bsp_index) 1)
            (begin
                (activate_nav_point_object "default" (player_origin0) "scifi_door" 0.5)
                (activate_nav_point_object "default" (player_origin1) "scifi_door" 0.5)
                (volume_test_objects "farm_ai_trig_12" (players_current))
                (deactivate_nav_point_object (player_origin0) "scifi_door")
                (deactivate_nav_point_object (player_origin1) "scifi_door")
            )
        )
    )
)

(script static void farm_setup
    (begin
        (cutscenes_on)
        (if (cinematic_skip_start)
            (a30_20)
        )
        (cinematic_skip_stop)
        (object_teleport (player0) "farm_start_flag")
        (object_teleport (player1) "farm_start_flag2")
        (object_create "sodomobile")
        (object_create "pre_podium")
        (ai_place "farm_cops/cinema_cops")
        (ai_playfight "farm_cops/cinema_cops" true)
        (ai_place "farm_cops/fcops0")
        (ai_place "farm_cops/fcops1")
        (ai_place "farm_cops/fcops2")
        (ai_place "farm_cops/fcops3")
        (sleep 30)
        (game_save_pmc)
        (fade_in 0 0 0 30)
        (sleep 30)
        (wake control_room_waypoint)
        (wake vehicle_hud_tip_on)
        (player_action_test_reset)
        (sleep_until (= (player_action_test_vehicle_enter) true))
        (vehicle_hud_tip_off)
        (wake vehicle_hud_tip2_on)
        (player_action_test_reset)
        (sleep_until (= (player_action_test_primary_trigger) true))
        (vehicle_hud_tip2_off)
    )
)

(script static void checkpoint2
    (print "checkpoint2 is disabled")
)

(script startup farm1_trig_script
    (begin
        (sleep_until (volume_test_objects "farm1_trig" (players_current)))
        (print "farm1_trig")
        (farm_setup)
        (game_save_pmc)
    )
)

(script startup farm_ai_trig_01_script
    (begin
        (sleep_until (or (volume_test_objects "farm_ai_trig_01" (players_current)) (volume_test_objects "farm_ai_trig_03" (players_current))))
        (print "farm_ai_trig_01")
        (game_save_pmc)
        (if (= control_room_switch false)
            (begin
                (ai_place "farm_cops/fcops4")
                (ai_place "farm_cops/fcops5")
                (ai_place "farm_cops/fcops6")
                (ai_place "farm_cops/fcops6_2_sod")
                (ai_command_list "farm_cops/fcops6_2_sod" "get_in_vehicle")
            )
        )
    )
)

(script startup farm_ai_trig_02_script
    (begin
        (sleep_until (volume_test_objects "farm_ai_trig_02" (players_current)))
        (print "farm_ai_trig_02")
        (game_save_pmc)
        (ai_place "farm_cops/fcops7")
        (ai_place "control_bots")
        (set control_bots_placed true)
        (object_activation_add_camera "levenohnahne")
        (camera_video_set "levenohnahne")
        (sleep_until (volume_test_objects "in_control_room_trig" (players_current)))
        (print "in the control room")
        (device_set_power "control_door" 1)
        (device_set_position_immediate "control_door" 0)
        (device_operates_automatically_set "control_door" false)
        (volume_teleport_players_not_inside "farm_ai_trig_02" "control_room_flag")
        (vehicle_unload "sodomobile" "")
        (sleep (* 2 30))
        (volume_teleport_players_not_inside "farm_ai_trig_02" "control_room_flag")
        (if (not (volume_test_objects "outside_control_room" "sodomobile"))
            (object_teleport "sodomobile" "teleport_sod")
        )
        (game_save_pmc)
    )
)

(script startup control_room_combat_robots
    (begin
        (sleep_until (and control_bots_placed (< (ai_strength "control_bots") 0.99)))
        (ai_set_blind "control_bots" false)
        (ai_set_deaf "control_bots" false)
    )
)

(script startup check_control_room_switch
    (begin
        (sleep_until (= (device_group_get "scifi_group") 1))
        (print "the switch has been thrown!")
        (device_operates_automatically_set "scifi_door" true)
        (device_operates_automatically_set "hang_door" true)
        (sound_impulse_start "sound\sfx\ambience\c30_lab\forcefield_powerdown" "scifi_switch" 1)
        (device_operates_automatically_set "control_door" true)
        (object_activation_add_camera "levenohnahne")
        (ai_place "farm_cops3/fcops21")
        (wake scifi_door_waypoint)
        (object_destroy "pre_podium")
        (object_create "post_podium")
    )
)

(script startup control_room_switch_trig_script
    (begin
        (sleep_until (= (device_group_get "scifi_group") 1))
        (print "control_room_switch_trig")
        (ai_erase "farm_cops/fcops0")
        (ai_erase "farm_cops/fcops1")
        (ai_erase "farm_cops/fcops2")
        (ai_erase "farm_cops/fcops3")
        (ai_erase "farm_cops/fcops4")
        (ai_erase "farm_cops/fcops5")
        (ai_erase "farm_cops/fcops6")
        (set control_room_switch true)
        (ai_command_list "farm_zombies" "get_the_fuck_out")
        (object_create "cop_sodomobile1")
        (object_create "cop_sodomobile2")
        (object_create "cop_sodomobile3")
        (ai_place "farm_cops2/fcops8_sod")
        (ai_place "farm_cops4")
        (ai_place "farm_cops2/fcops9")
        (game_save_pmc)
    )
)

(script continuous in_hangar_script
    (begin
        (sleep_until (volume_test_objects "in_hangar_trig" (players_current)) 1)
        (device_set_position "hang_door" 1)
    )
)

(script startup farm_ai_trig_03_script
    (begin
        (sleep_until (and (volume_test_objects "farm_ai_trig_03" (players_current)) (= control_room_switch true)))
        (print "farm_ai_trig_03")
        (game_save_pmc)
        (ai_place "farm_cops2/fcops10")
        (ai_place "farm_cops2/fcops11")
        (ai_place "farm_civs/in_hangar")
    )
)

(script startup farm_ai_trig_04_script
    (begin
        (sleep_until (and (volume_test_objects "farm_ai_trig_04" (players_current)) (= control_room_switch true)))
        (print "farm_ai_trig_04")
        (game_save_pmc)
        (ai_place "farm_cops2/fcops12")
        (ai_place "farm_cops2/fcops13")
    )
)

(script startup farm_ai_trig_05_script
    (begin
        (sleep_until (and (volume_test_objects "farm_ai_trig_05" (players_current)) (= control_room_switch true)))
        (print "farm_ai_trig_05")
        (game_save_pmc)
        (ai_place "farm_cops2/fcops14")
        (ai_place "farm_cops2/fcops15")
    )
)

(script startup farm_cops3_16_script
    (begin
        (sleep_until (and (or
                    (volume_test_objects "farm_ai_trig_06" (players_current))
                    (volume_test_objects "farm_ai_trig_07" (players_current))
                    (volume_test_objects "farm_ai_trig_09" (players_current))
                ) (= control_room_switch false)
            )
        )
        (print "farm_cops3_16")
        (game_save_pmc)
        (ai_place "farm_cops3/fcops16")
    )
)

(script startup farm_cops3_17_script
    (begin
        (sleep_until (and (or (volume_test_objects "farm_ai_trig_08" (players_current)) (volume_test_objects "farm_ai_trig_04" (players_current))) (= control_room_switch false)))
        (print "farm_cops3_17")
        (game_save_pmc)
        (ai_place "farm_cops3/fcops17")
    )
)

(script startup farm_cops3_18_script
    (begin
        (sleep_until (and (or (volume_test_objects "farm_ai_trig_07" (players_current)) (volume_test_objects "farm_ai_trig_04" (players_current))) (= control_room_switch false)))
        (print "farm_cops3_18")
        (game_save_pmc)
        (ai_place "farm_cops3/fcops18")
    )
)

(script startup farm_cops3_19_script
    (begin
        (sleep_until (or (volume_test_objects "farm_ai_trig_10" (players_current)) (volume_test_objects "farm_ai_trig_11" (players_current))))
        (print "farm_cops3_19")
        (game_save_pmc)
        (ai_place "farm_cops3/fcops19")
    )
)

(script startup farm_cops3_20_script
    (begin
        (sleep_until (or (volume_test_objects "farm_ai_trig_08" (players_current)) (volume_test_objects "farm_ai_trig_03" (players_current))))
        (print "farm_cops3_20")
        (game_save_pmc)
        (ai_place "farm_cops3/fcops20")
    )
)

(script startup farm_cops3_21_script
    (begin
        (sleep_until (and (volume_test_objects "farm_ai_trig_12" (players_current)) (= control_room_switch true)))
        (print "farm_cops3_21")
        (game_save_pmc)
        (ai_command_list "farm_zombies" "get_the_fuck_out")
    )
)
(script static void scifi_setup
    (begin
        (game_save_cancel)
        (switch_bsp 2)
        (sleep 1)
        (ai_erase_all)
        (cutscenes_on)
        (if (cinematic_skip_start)
            (a30_30)
        )
        (cinematic_skip_stop)
        (player_force_respawn)
        (object_teleport (player0) "scifi_jump_flag0")
        (object_teleport (player1) "scifi_jump_flag1")
        (ai_place "scifi_cops/cops1")
        (ai_place "tutorial_bot")
        (objects_cannot_take_damage (ai_actors "tutorial_bot/guidebot") true)
        (objects_cannot_die (ai_actors "tutorial_bot/guidebot") true)
        (ai_place "scifi_bots")
        (fade_in 0 0 0 30)
        (game_save_pmc)
    )
)

(script static void checkpoint3
    (begin
        (print "checkpoint3")
        (switch_bsp 2)
        (scifi_setup)
    )
)

(script static void checkpoint4
    (begin
        (print "checkpoint4")
        (ai_erase_all)
        (switch_bsp 3)
        (object_teleport (player0) "checkpoint4_1")
        (object_teleport (player1) "checkpoint4_2")
    )
)

(script static void checkpoint5
    (begin
        (print "checkpoint5")
        (ai_erase_all)
        (switch_bsp 3)
        (object_teleport (player0) "checkpoint5_1")
        (object_teleport (player1) "checkpoint5_2")
    )
)

(script startup scifi1_trig_script
    (begin
        (sleep_until (volume_test_objects "scifi1_trig" (players_current)) 1)
        (print "scifi1_trig")
        (fade_out 0 0 0 30)
        (sleep 30)
        (scifi_setup)
    )
)

(script static void a30_60
    (begin
        (fade_out 0 0 0 0)
        (start_cutscene)
        (switch_bsp 2)
        (sleep 30)
        (object_activation_add_camera "guidebot_closeup")
        (camera_set "guidebot_closeup" 0)
        (fade_in 0 0 0 30)
        (sleep 30)
        (sound_impulse_start "sound\dialog\a30\se_guidebot_grenade_1" (list_get (ai_actors "tutorial_bot/guidebot") 0) 1)
        (sleep (sound_impulse_time "sound\dialog\a30\se_guidebot_grenade_1"))
        (sleep 30)
        (camera_set "conv_shot" 0)
        (sound_impulse_start "sound\dialog\a30\se_guidebot_grenade_2" (list_get (ai_actors "tutorial_bot/guidebot") 0) 1)
        (sleep (sound_impulse_time "sound\dialog\a30\se_guidebot_grenade_2"))
        (camera_set "grenade_fodder" 30)
        (sleep 30)
        (fade_out 0 0 0 30)
        (sleep 30)
        (stop_cutscene)
    )
)

(script dormant you_throw_grenade
    (begin
        (sleep (* 30 3))
        (sound_impulse_start "sound\dialog\a30\se_guidebot_grenade_3" (list_get (ai_actors "tutorial_bot/guidebot") 0) 1)
        (sleep (sound_impulse_time "sound\dialog\a30\se_guidebot_grenade_3"))
        (ai_enable_communication "tutorial_bot" true)
    )
)

(script startup scifi2_trig_script
    (begin
        (sleep_until (volume_test_objects "scifi2_trig" (players_current)))
        (print "scifi2_trig")
        (game_save_cancel)
        (ai_place "scifi_cops/cops2")
        (object_activation_add_camera "i_see_cops")
        (ai_enable_communication "tutorial_bot" false)
        (fade_out 0 0 0 30)
        (sleep 30)
        (player_set_weapons (player_origin0) "greenhouse" true)
        (player_set_weapons (player_origin1) "greenhouse" true)
        (ai_braindead "scifi_cops/cops1" true)
        (game_save_cancel)
        (cutscenes_on)
        (object_teleport (player0) "stubbs_talking_to_guidebot")
        (object_teleport (unit (list_get (ai_actors "tutorial_bot/guidebot") 0)) "guidebot_in_cinema")
        (ai_command_list "tutorial_bot" "guidebot_look")
        (fade_out 0 0 0 0)
        (objects_cannot_take_damage (players_current) true)
        (a30_60)
        (player_force_respawn)
        (object_teleport (player0) "stubbs_talking_to_guidebot2")
        (sleep 15)
        (give_player_grenade)
        (wake grenade_hud_tip_on)
        (fade_in 0 0 0 30)
        (sleep 30)
        (objects_cannot_take_damage (players_current) false)
        (ai_braindead "scifi_cops/cops1" false)
        (player_action_test_reset)
        (sleep_until (= (player_action_test_grenade) true))
        (grenade_hud_tip_off)
        (ai_command_list "moon_zombies" "zombies_come_out")
        (ai_command_list "zombies" "zombies_come_out")
        (sleep 5)
        (wake you_throw_grenade)
        (wake grenade_hud_tip2_on)
        (player_action_test_reset)
        (sleep_until (= (player_action_test_abandon) true))
        (grenade_hud_tip2_off)
    )
)

(script startup scifi2_2_trig_script
    (begin
        (sleep_until (volume_test_objects "scifi2_2_trig" (players_current)))
        (print "scifi2_2_trig")
        (ai_place "scifi_cops/cops2_1")
    )
)

(script continuous sci_jabber
    (begin
        (sound_impulse_start "sound\dialog\scientist_combat\idle_noncombat" (unit (list_get (ai_actors "scifi_scientists/conv") 0)) 1)
        (sleep 180)
        (sound_impulse_start "sound\dialog\scientist_combat\idle_noncombat" (unit (list_get (ai_actors "scifi_scientists/conv") 1)) 1)
        (sleep 180)
    )
)

(script startup scifi3_trig_script
    (begin
        (sleep -1 sci_jabber)
        (sleep_until (volume_test_objects "scifi3_trig" (players_current)))
        (print "scifi3_trig")
        (game_save_pmc)
        (ai_place "scifi_cops/cops2_2")
        (ai_place "scifi_cops/cops3")
        (ai_place "scifi_scientists/conv")
        (wake sci_jabber)
    )
)

(script startup scifi4_trig_script
    (begin
        (sleep_until (volume_test_objects "scifi4_trig" (players_current)))
        (print "scifi4_trig")
        (ai_place "scifi_cops/cops4")
        (ai_place "scifi_cops/cops3_1")
        (sleep -1 sci_jabber)
    )
)

(script startup scifi4_1_trig_script
    (begin
        (sleep_until (volume_test_objects "scifi4_1_trig" (players_current)))
        (print "scifi4_1_trig")
        (ai_place "scifi_cops/cops4_1")
    )
)

(script startup scifi5_trig_script
    (begin
        (sleep_until (volume_test_objects "scifi5_trig" (players_current)))
        (print "scifi5_trig")
        (game_save_pmc)
    )
)

(script dormant a30_40_wrapper
    (begin
        (print "a30_40_wrapper")
        (game_save_cancel)
        (if (and (= a30_40_wrapper_running false) (= (structure_bsp_index) 3))
            (begin
                (set a30_40_wrapper_running true)
                (set allow_3_2_bsp_switch false)
                (game_save_cancel)
                (cutscenes_on)
                (ai false)
                (fade_out 0 0 0 30)
                (sleep 31)
                (switch_bsp 3)
                (object_destroy "maggie_biped")
                (object_destroy "skag_biped")
                (object_destroy "is_biped1")
                (object_destroy "is_biped2")
                (object_destroy "is_biped3")
                (if (cinematic_skip_start)
                    (a30_40)
                )
                (cinematic_skip_stop)
                (ai true)
                (player_force_respawn)
                (object_teleport (player0) "scifi_jump_flag")
                (object_teleport (player1) "scifi_jump_flag2")
                (fade_in 0 0 0 30)
                (sleep 30)
                (set allow_3_2_bsp_switch true)
            )
            (print "a30_40 is already running -- or you switched bsps!!!")
        )
    )
)

(script startup scifi5_5_trig_script
    (begin
        (sleep_until (volume_test_objects "scifi5_5_trig" (players_current)))
        (print "scifi5_5_trig")
        (object_create "maggie_biped")
        (object_create "skag_biped")
        (object_create "is_biped1")
        (object_create "is_biped2")
        (object_create "is_biped3")
        (recording_play "maggie_biped" "skegness_1")
        (recording_play "skag_biped" "skegness_1")
        (recording_play "is_biped1" "skegness_1")
        (recording_play "is_biped2" "skegness_1")
        (recording_play "is_biped3" "skegness_1")
        (sleep (* 30 10))
        (if (= a30_40_wrapper_running false)
            (wake a30_40_wrapper)
        )
    )
)

(script startup scifi6_trig_script
    (begin
        (sleep_until (volume_test_objects "scifi6_trig" (players_current)))
        (print "scifi6_trig")
        (if (= a30_40_wrapper_running false)
            (wake a30_40_wrapper)
        )
        (ai_place "scifi_cops/cops6")
        (ai_migrate "scifi_cops/cops6" "scifi_cops2/cop_bucket")
    )
)

(script startup overpass_cops_trig_script
    (begin
        (sleep_until (volume_test_objects "overpass_cops_trig" (players_current)))
        (print "overpass_cops")
        (ai_place "scifi_cops2/overpass_cops")
        (ai_place "moon2_zombies2/tube_zombies")
    )
)

(script startup scifi7_trig_script
    (begin
        (sleep_until (volume_test_objects "scifi7_trig" (players_current)))
        (print "scifi7_trig")
        (ai_place "scifi_cops2/overpass_cops2")
    )
)

(script startup scifi8_trig_script
    (begin
        (sleep_until (volume_test_objects "scifi8_trig" (players_current)))
        (print "scifi8_trig")
        (game_save_pmc)
        (ai_place "scifi_cops/cops7")
        (ai_migrate "scifi_cops/cops7" "scifi_cops2/cop_bucket")
    )
)

(script static void scifi2_placements
    (if (= scifi2_placed false)
        (begin
            (set scifi2_placed true)
            (ai_place "scifi2_bots")
        )
    )
)

(script continuous switch_bsp_2_3_script
    (begin
        (sleep_until (and (volume_test_objects "switch_bsp_2_3" (players_current)) (= (structure_bsp_index) 2)) 1)
        (print "switch_bsp_2_3")
        (volume_teleport_players_not_inside "switch_bsp_2_3" "switch_bsp_flag_2_3")
        (switch_bsp 3)
        (scifi2_placements)
        (game_save_pmc)
    )
)

(script continuous switch_bsp_3_2_script
    (begin
        (sleep_until (and
                (volume_test_objects "switch_bsp_3_2" (players_current))
                (= (structure_bsp_index) 3)
                (= allow_3_2_bsp_switch true)
            ) 1
        )
        (print "switch_bsp_3_2")
        (volume_teleport_players_not_inside "switch_bsp_3_2" "switch_bsp_flag_3_2")
        (switch_bsp 2)
        (game_save_pmc)
    )
)

(script startup game_won_trig_script
    (begin
        (sleep_until (and (volume_test_objects "game_won_trig" (players_current)) (= (ai_living_count "scifi_cops2/gift_shop") 0)))
        (game_save_cancel)
        (cutscenes_on)
        (fade_out 0 0 0 30)
        (sleep 30)
        (ai_erase_all)
        (objects_delete_by_definition "characters\beat_cop\beat_cop")
        (objects_delete_by_definition "characters\beat_cop_zombie\beat_cop_zombie")
        (object_teleport (player0) "scifi_end_flag")
        (object_teleport (player1) "scifi_end_flag2")
        (if (cinematic_skip_start)
            (a30_50)
        )
        (cinematic_skip_stop)
        (print "thanks for playing!")
        (game_won)
    )
)

(script continuous flip_sodo_music_flag
    (begin
        (sleep_until (or
                (vehicle_test_seat_list "sodomobile" "je-driver" (players_current))
                (vehicle_test_seat_list "cop_sodomobile1" "je-driver" (players_current))
                (vehicle_test_seat_list "cop_sodomobile2" "je-driver" (players_current))
                (vehicle_test_seat_list "cop_sodomobile3" "je-driver" (players_current))
                (vehicle_test_seat_list "cop_sodomobile4" "je-driver" (players_current))
            )
        )
        (set sodomobile_music true)
        (sleep_until (and
                (not (vehicle_test_seat_list "sodomobile" "je-driver" (players_current)))
                (not (vehicle_test_seat_list "cop_sodomobile1" "je-driver" (players_current)))
                (not (vehicle_test_seat_list "cop_sodomobile2" "je-driver" (players_current)))
                (not (vehicle_test_seat_list "cop_sodomobile3" "je-driver" (players_current)))
                (not (vehicle_test_seat_list "cop_sodomobile4" "je-driver" (players_current)))
            )
        )
        (set sodomobile_music false)
    )
)

(script continuous sodomobile_music_script
    (begin
        (sleep_until (and (= sodomobile_music true) (not (cutscene_in_progress))) 1)
        (print "sodomobile_music: on")
        (sound_looping_start "sound\music\a30\battle_sodo\battle_sodo" "none" 0.7)
        (sleep_until (or (= sodomobile_music false) (cutscene_in_progress)) 1)
        (print "sodomobile_music: off")
        (sound_looping_stop "sound\music\a30\battle_sodo\battle_sodo")
    )
)

(script continuous sodomobile_in_control_door
    (begin
        (sleep_until (volume_test_objects "in_control_door" (players_current)))
        (if (and (volume_test_objects "in_control_door" (player_origin0)) (or
                    (= (vehicle_test_seat_list "sodomobile" "je-driver" (player_origin0)) true)
                    (= (vehicle_test_seat_list "cop_sodomobile1" "je-driver" (player_origin0)) true)
                    (= (vehicle_test_seat_list "cop_sodomobile2" "je-driver" (player_origin0)) true)
                    (= (vehicle_test_seat_list "cop_sodomobile3" "je-driver" (player_origin0)) true)
                    (= (vehicle_test_seat_list "cop_sodomobile4" "je-driver" (player_origin0)) true)
                )
            )
            (device_set_position "control_door" 1)
        )
        (if (and (volume_test_objects "in_control_door" (player_origin1)) (or
                    (= (vehicle_test_seat_list "sodomobile" "je-driver" (player_origin1)) true)
                    (= (vehicle_test_seat_list "cop_sodomobile1" "je-driver" (player_origin1)) true)
                    (= (vehicle_test_seat_list "cop_sodomobile2" "je-driver" (player_origin1)) true)
                    (= (vehicle_test_seat_list "cop_sodomobile3" "je-driver" (player_origin1)) true)
                    (= (vehicle_test_seat_list "cop_sodomobile4" "je-driver" (player_origin1)) true)
                )
            )
            (device_set_position "control_door" 1)
        )
    )
)

(script continuous sodomobile_in_scifi_door
    (begin
        (sleep_until (and (volume_test_objects "in_scifi_door" (players_current)) (= control_room_switch true)))
        (if (and (volume_test_objects "in_scifi_door" (player_origin0)) (or
                    (= (vehicle_test_seat_list "sodomobile" "je-driver" (player_origin0)) true)
                    (= (vehicle_test_seat_list "cop_sodomobile1" "je-driver" (player_origin0)) true)
                    (= (vehicle_test_seat_list "cop_sodomobile2" "je-driver" (player_origin0)) true)
                    (= (vehicle_test_seat_list "cop_sodomobile3" "je-driver" (player_origin0)) true)
                    (= (vehicle_test_seat_list "cop_sodomobile4" "je-driver" (player_origin0)) true)
                )
            )
            (device_set_position "scifi_door" 1)
        )
        (if (and (volume_test_objects "in_scifi_door" (player_origin1)) (or
                    (= (vehicle_test_seat_list "sodomobile" "je-driver" (player_origin1)) true)
                    (= (vehicle_test_seat_list "cop_sodomobile1" "je-driver" (player_origin1)) true)
                    (= (vehicle_test_seat_list "cop_sodomobile2" "je-driver" (player_origin1)) true)
                    (= (vehicle_test_seat_list "cop_sodomobile3" "je-driver" (player_origin1)) true)
                    (= (vehicle_test_seat_list "cop_sodomobile4" "je-driver" (player_origin1)) true)
                )
            )
            (device_set_position "scifi_door" 1)
        )
    )
)

(script dormant 10_monorail_run
    (begin
        (object_create "10_monorail_1")
        (device_set_position_immediate "10_monorail_1" 0.7)
        (object_teleport "10_monorail_1" "10_monorail_1")
        (device_set_position "10_monorail_1" 1)
    )
)

(script static void a30_10_run
    (begin
        (fade_out 0 0 0 0)
        (sound_looping_predict "sound\cinematics\a30\10_foley_1")
        (sound_class_set_gain "vehicle_engine" 0 0)
        (start_cutscene)
        (switch_bsp 0)
        (object_activation_add_camera "10_01")
        (sleep 30)
        (wake 10_foley)
        (print "a30_10:  introduction")
        (camera_set "10_01" 0)
        (fade_in 0 0 0 30)
        (sound_impulse_start "sound\dialog\a30\10_monorail_1" "none" 1)
        (camera_set "10_02" 120)
        (sleep 15)
        (wake 10_monorail_run)
        (sleep 45)
        (object_create "10_stubbs_1")
        (object_beautify "10_stubbs_1" true)
        (recording_play "10_stubbs_1" "10_stubbs_1")
        (object_create "10_zombie_5")
        (recording_play "10_zombie_5" "10_zombie_2")
        (object_create "10_zombie_6")
        (recording_play "10_zombie_6" "10_zombie_3")
        (sleep 60)
        (object_create "10_stubbs_2")
        (object_beautify "10_stubbs_1" true)
        (object_create "10_zombie_1")
        (recording_play "10_zombie_1" "10_zombie_1")
        (object_create "10_zombie_2")
        (recording_play "10_zombie_2" "10_zombie_2")
        (object_create "10_zombie_3")
        (recording_play "10_zombie_3" "10_zombie_3")
        (object_create "10_zombie_4")
        (recording_play "10_zombie_4" "10_zombie_4")
        (sleep 20)
        (custom_animation "10_stubbs_2" "cinematics\animations\stubbs\a30\a30" "a30_10_stubbs_1" false)
        (camera_set "10_03" 0)
        (object_destroy "10_stubbs_1")
        (sound_impulse_start "sound\dialog\a30\10_billboard_1" "none" 1)
        (sleep 60)
        (camera_set "10_04" 0)
        (camera_set "10_04b" 180)
        (sleep 120)
        (effect_new_on_object "effects\hearts" "10_stubbs_2")
        (camera_set "10_05" 0)
        (sleep 150)
        (fade_out 0 0 0 0)
        (stop_cutscene)
        (object_activation_clear)
        (object_destroy_containing "10_")
        (sound_class_set_gain "vehicle_engine" 1 0)
    )
)

(script dormant 20_dialog
    (begin
        (sleep 49)
        (sound_impulse_start "sound\dialog\a30\20_skegness_comp" "20_skegness_1" 1)
        (sound_impulse_start "sound\dialog\a30\20_maggie_comp" "20_maggie_1" 1)
        (sleep 76)
        (sleep 36)
        (sleep 62)
        (sleep 117)
        (sleep 61)
        (camera_set "20_03c" 0)
        (camera_set "20_03c2" 210)
        (sleep 181)
        (camera_set "20_03d" 0)
        (camera_set "20_03e" 410)
        (sleep 230)
        (sleep -1)
        (sound_impulse_start "sound\dialog\a30\20_skegness_5" "20_skegness_1" 1)
        (sleep (sound_impulse_time "sound\dialog\a30\20_skegness_5"))
        (sound_impulse_start "sound\dialog\a30\20_maggie_7" "20_maggie_1" 1)
    )
)

(script dormant 20_braineat
    (begin
        (object_create "20_stubbs_1")
        (object_beautify "20_stubbs_1" true)
        (object_create_anew "20_cop_1")
        (object_beautify "20_cop_1" true)
        (unit_custom_animation_at_frame "20_cop_1" "cinematics\animations\scientist\a30\a30" "a30_20_scientist_1" false 30)
        (unit_custom_animation_at_frame "20_stubbs_1" "cinematics\animations\stubbs\a30\a30" "a30_20_stubbs_2" false 30)
        (sound_impulse_start "sound\dialog\beat_cop\finishing_move" "20_cop_1" 1)
        (sleep 60)
        (effect_new_on_object "effects\braineating" "20_cop_1")
    )
)

(script dormant 20_sodomobile
    (begin
        (sleep 60)
        (sleep -1)
        (sleep 100)
        (object_create "20_cop_1")
        (object_beautify "20_cop_1" true)
        (object_create "20_sodomobile_1")
        (vehicle_load_magic "20_sodomobile_1" "driver" "20_cop_1")
        (recording_play "20_sodomobile_1" "20_sodomobile_1")
    )
)

(script dormant 20_barbershop
    (begin
        (custom_animation "20_security_1" "cinematics\animations\skegness\c40\c40" "c40_se_security_1" false)
        (custom_animation "20_security_2" "cinematics\animations\skegness\c40\c40" "c40_se_security_1" false)
        (custom_animation "20_security_3" "cinematics\animations\skegness\c40\c40" "c40_se_security_1" false)
    )
)

(script static void a30_20_run
    (begin
        (fade_out 0 0 0 0)
        (sound_class_set_gain "ambient_nature" 0 0)
        (sound_class_set_gain "ambient_machine" 0 0)
        (sound_class_set_gain "vehicle_engine" 0 0)
        (sound_looping_predict "sound\cinematics\a30\20_foley_1")
        (start_cutscene)
        (switch_bsp 1)
        (object_teleport (player_origin0) "20_hide_player")
        (object_teleport (player_origin1) "20_hide_player")
        (object_activation_add_camera "20_01")
        (object_create "20_skegness_1")
        (object_beautify "20_skegness_1" true)
        (object_create "20_security_1")
        (object_beautify "20_security_1" true)
        (object_create "20_security_2")
        (object_beautify "20_security_2" true)
        (object_create "20_security_3")
        (object_beautify "20_security_3" true)
        (unit_set_weapon "20_skegness_1" "none")
        (unit_set_weapon "20_security_1" "none")
        (unit_set_weapon "20_security_2" "none")
        (unit_set_weapon "20_security_3" "none")
        (unit_set_seat "20_skegness_1" "alert")
        (unit_set_seat "20_security_1" "alert")
        (unit_set_seat "20_security_2" "alert")
        (unit_set_seat "20_security_3" "alert")
        (object_create "20_maggie_1")
        (object_beautify "20_maggie_1" true)
        (object_create "20_podium_1")
        (object_create "20_microphone_1")
        (wake 20_sodomobile)
        (sleep 30)
        (wake 20_foley)
        (print "a30_20:  leggo my sod-o-mobile")
        (fade_in 0 0 0 0)
        (wake 20_barbershop)
        (camera_set "20_01" 0)
        (camera_set "20_02" 120)
        (sleep 15)
        (custom_animation "20_skegness_1" "cinematics\animations\skegness\a30\a30" "a30_20_skegness_2" false)
        (custom_animation "20_maggie_1" "cinematics\animations\maggie\a30\a30" "a30_20_maggie_2" false)
        (wake 20_dialog)
        (sleep 45)
        (camera_set "20_03" 90)
        (sleep 120)
        (wake 20_sodomobile)
        (camera_set "20_03b" 120)
        (sleep (- (unit_get_custom_animation_time "20_maggie_1") 100))
        (wake 20_braineat)
        (sleep 30)
        (camera_set "20_04" 20)
        (sleep 21)
        (camera_set "20_04b" 180)
        (sleep (- (unit_get_custom_animation_time "20_stubbs_1") 45))
        (unit_kill_silent "20_cop_1")
        (custom_animation "20_skegness_1" "cinematics\animations\skegness\a30\a30" "a30_20_skegness_3" false)
        (custom_animation "20_maggie_1" "cinematics\animations\maggie\a30\a30" "a30_20_maggie_3" false)
        (wake 20_dialog)
        (camera_set "20_05" 0)
        (object_destroy "20_sodomobile_1")
        (object_create "20_sodomobile_3")
        (sleep 180)
        (camera_set "20_06" 0)
        (sleep (unit_get_custom_animation_time "20_maggie_1"))
        (object_destroy "20_skegness_1")
        (object_destroy "20_maggie_1")
        (object_teleport "20_stubbs_1" "20_stubbs_1")
        (custom_animation "20_stubbs_1" "cinematics\animations\stubbs\a30\a30" "a30_20_stubbs_3" false)
        (camera_set "20_07" 0)
        (camera_set "20_07b" 180)
        (sleep 135)
        (object_create "20_cop_2")
        (object_create "20_cop_3")
        (recording_play "20_cop_2" "20_cop_1")
        (sleep 5)
        (recording_play "20_cop_3" "20_cop_1")
        (sleep 5)
        (camera_set "20_08" 20)
        (sleep 60)
        (camera_set "20_09" 20)
        (sleep 20)
        (camera_set "20_10" 30)
        (sleep 60)
        (fade_out 0 0 0 0)
        (stop_cutscene)
        (object_teleport (player_origin0) "20_player0_start")
        (object_teleport (player_origin1) "20_player1_start")
        (object_activation_clear)
        (object_destroy_containing "20_")
        (sound_class_set_gain "ambient_nature" 1 0)
        (sound_class_set_gain "ambient_machine" 1 0)
        (sound_class_set_gain "vehicle_engine" 1 0)
    )
)

(script static void a30_30_run
    (begin
        (fade_out 0 0 0 0)
        (sound_looping_predict "sound\cinematics\a30\30_foley_1")
        (start_cutscene)
        (switch_bsp 2)
        (object_activation_add_camera "30_01")
        (object_create "30_stubbs_1")
        (object_beautify "30_stubbs_1" true)
        (cinematic_set_near_clip_distance 0.01)
        (object_create "30_skegness_1")
        (object_create "30_security_1")
        (object_create "30_security_2")
        (object_create "30_security_3")
        (object_create "30_maggie_1")
        (recording_play "30_stubbs_1" "30_stubbs_2")
        (sleep 30)
        (wake 30_foley)
        (print "a30_30:  i can see you")
        (camera_set "30_01" 0)
        (fade_in 0 0 0 0)
        (sleep 25)
        (recording_play "30_skegness_1" "30_skegness_1")
        (recording_play "30_maggie_1" "30_skegness_1")
        (sleep 5)
        (recording_play "30_security_1" "30_skegness_1")
        (recording_play "30_security_2" "30_skegness_1")
        (sleep 5)
        (recording_play "30_security_3" "30_skegness_1")
        (sleep 5)
        (camera_set "30_02" 30)
        (sleep 31)
        (camera_set "30_03" 90)
        (sleep 75)
        (camera_set "30_04" 0)
        (sleep 60)
        (fade_out 0 0 0 0)
        (stop_cutscene)
        (object_activation_clear)
        (object_destroy_containing "30_")
    )
)

(script dormant 40_skegness
    (custom_animation "40_skegness_1" "cinematics\animations\civ_male_biz\common\common" "alert unarmed threaten" false)
)

(script static void a30_40_run
    (begin
        (fade_out 0 0 0 0)
        (sound_class_set_gain "ambient_nature" 0 0)
        (sound_class_set_gain "ambient_machine" 0 0)
        (sound_looping_predict "sound\cinematics\a30\40_foley_1")
        (start_cutscene)
        (switch_bsp 3)
        (object_activation_add_camera "40_01")
        (object_create "40_stubbs_1")
        (object_beautify "40_stubbs_1" true)
        (object_create "40_skegness_1")
        (object_beautify "40_skegness_1" true)
        (object_create "40_security_1")
        (object_beautify "40_security_1" true)
        (object_create "40_security_2")
        (object_beautify "40_security_2" true)
        (object_create "40_security_3")
        (object_beautify "40_security_3" true)
        (object_create "40_maggie_1")
        (object_beautify "40_maggie_1" true)
        (sleep 20)
        (wake 40_skegness)
        (recording_play "40_maggie_1" "40_maggie_1")
        (sleep 10)
        (recording_play "40_security_1" "40_security_1")
        (sleep 5)
        (recording_play "40_security_3" "40_security_3")
        (sleep 10)
        (recording_play "40_security_2" "40_security_2")
        (wake 40_foley)
        (print "a30_40:  hands off my woman!")
        (camera_set "40_01" 0)
        (camera_set "40_01b" 120)
        (fade_in 0 0 0 0)
        (sleep 30)
        (recording_play "40_stubbs_1" "40_stubbs_1")
        (sleep 30)
        (camera_set "40_02" 0)
        (unit_stop_custom_animation "40_skegness_1")
        (object_teleport "40_skegness_1" "40_skegness_1")
        (recording_play "40_skegness_1" "40_skegness_1")
        (sleep 60)
        (camera_set "40_03" 0)
        (sound_impulse_start "sound\dialog\a30\40_skegness_1" "40_skegness_1" 1)
        (object_destroy "40_stubbs_1")
        (sleep 130)
        (fade_out 0 0 0 0)
        (stop_cutscene)
        (object_activation_clear)
        (object_destroy_containing "40_")
        (sound_class_set_gain "ambient_nature" 1 0)
        (sound_class_set_gain "ambient_machine" 1 0)
    )
)

(script dormant 50_snoglobe
    (begin
        (scenery_animation_start "50_snoglobe_1" "scenery\a30_greenhouse\snoglobe\snoglobe" "a30_40_globe_idle")
        (sleep 198)
        (object_create_anew "50_snoglobe_1")
        (objects_attach "50_stubbs_1" "melee" "50_snoglobe_1" "attachment")
        (sleep 192)
        (objects_detach "50_stubbs_1" "50_snoglobe_1")
        (scenery_animation_start "50_snoglobe_1" "scenery\a30_greenhouse\snoglobe\snoglobe" "a30_40_globe_throw")
    )
)

(script dormant 50_otis
    (begin
        (sleep 46)
        (sound_impulse_start "sound\dialog\a30\50_otis_1" "50_otis_1" 1)
    )
)

(script static void a30_50_run
    (begin
        (fade_out 0 0 0 0)
        (sound_looping_predict "sound\cinematics\a30\50_foley_1")
        (sound_class_set_gain "ambient_nature" 0 0)
        (sound_class_set_gain "ambient_machine" 0 0)
        (start_cutscene)
        (switch_bsp 3)
        (object_activation_add_camera "50_01")
        (object_create "50_stubbs_1")
        (object_beautify "50_stubbs_1" true)
        (object_create "50_snoglobe_1")
        (sleep 30)
        (wake 50_foley)
        (print "a30_50:  the getaway")
        (custom_animation "50_stubbs_1" "cinematics\animations\stubbs\a30\a30" "a30_40_stubbs_1" false)
        (wake 50_snoglobe)
        (sleep 1)
        (camera_set "50_01" 0)
        (fade_in 0 0 0 0)
        (sleep 90)
        (camera_set "50_01b" 150)
        (sleep 90)
        (camera_set "50_01c" 150)
        (sleep 90)
        (camera_set "50_01d" 150)
        (sleep 90)
        (camera_set "50_01e" 150)
        (sleep (unit_get_custom_animation_time "50_stubbs_1"))
        (object_create "50_otis_1")
        (object_beautify "50_otis_1" true)
        (custom_animation "50_otis_1" "cinematics\animations\otis\a30\a30" "a30_40_otis_1" false)
        (wake 50_otis)
        (camera_set "50_03" 0)
        (camera_set "50_04" 240)
        (sleep 60)
        (camera_set "50_04" 90)
        (sleep 60)
        (camera_set "50_04b" 300)
        (sleep (- (sound_impulse_time "sound\dialog\a30\50_otis_1") 120))
        (sleep 90)
        (fade_out 0 0 0 0)
        (stop_cutscene)
        (object_activation_clear)
        (object_destroy_containing "50_")
        (sound_class_set_gain "ambient_nature" 1 0)
        (sound_class_set_gain "ambient_machine" 1 0)
    )
)

(script static void cutscenes_off
    (set show_cutscenes false)
)

(script startup test
    (begin
        (if (> test 0)
            (cutscenes_on)
        )
        (if (= test 10)
            (a30_10)
        )
        (if (= test 20)
            (a30_20)
        )
        (if (= test 30)
            (a30_30)
        )
        (if (= test 40)
            (a30_40)
        )
        (if (= test 50)
            (a30_50)
        )
    )
)

(script static void preview
    (begin
        (cutscenes_on)
        (a30_10)
        (a30_20)
        (a30_30)
        (a30_40)
        (a30_50)
    )
)

(script static void next_cutscene
    (map_name "levels\a40_police_station\a40_police_station_cutscene")
)

(script static void unlockable_pickup
    (begin
        (damage_object "equipment\hippo\hippo_pickup" (player_current0))
        (if (game_is_cooperative)
            (damage_object "equipment\hippo\hippo_pickup" (player_current1))
        )
    )
)

(script static void stop_commentary
    (begin
        (sound_looping_stop "sound\commentary\a30_greenhouse\a30_greenhouse_01")
        (sound_looping_stop "sound\commentary\a30_greenhouse\a30_greenhouse_02")
        (sound_looping_stop "sound\commentary\a30_greenhouse\a30_greenhouse_03")
        (sound_looping_stop "sound\commentary\a30_greenhouse\a30_greenhouse_04")
        (sound_looping_stop "sound\commentary\a30_greenhouse\a30_greenhouse_05")
        (sound_looping_stop "sound\commentary\a30_greenhouse\a30_greenhouse_06")
    )
)

(script dormant unlock_comment_1
    (begin
        (sleep_until (< (object_get_health "unlockable_hippo_comment_1") 0) 7)
        (unlockable_pickup)
        (sleep 90)
        (cinematic_set_title "unlockable_comment")
        (stop_commentary)
        (sound_looping_start "sound\commentary\a30_greenhouse\a30_greenhouse_01" "none" 1)
        (sleep (* 30 15))
        (sleep 60)
    )
)

(script dormant unlock_comment_2
    (begin
        (sleep_until (< (object_get_health "unlockable_hippo_comment_2") 0) 7)
        (unlockable_pickup)
        (sleep 90)
        (cinematic_set_title "unlockable_comment")
        (stop_commentary)
        (sound_looping_start "sound\commentary\a30_greenhouse\a30_greenhouse_02" "none" 1)
        (sleep (* 30 15))
        (sleep 60)
    )
)

(script dormant unlock_comment_3
    (begin
        (sleep_until (< (object_get_health "unlockable_hippo_comment_3") 0) 7)
        (unlockable_pickup)
        (sleep 90)
        (cinematic_set_title "unlockable_comment")
        (stop_commentary)
        (sound_looping_start "sound\commentary\a30_greenhouse\a30_greenhouse_03" "none" 1)
        (sleep (* 30 15))
        (sleep 60)
    )
)

(script dormant unlock_comment_4
    (begin
        (sleep_until (< (object_get_health "unlockable_hippo_comment_4") 0) 7)
        (unlockable_pickup)
        (sleep 90)
        (cinematic_set_title "unlockable_comment")
        (stop_commentary)
        (sound_looping_start "sound\commentary\a30_greenhouse\a30_greenhouse_04" "none" 1)
        (sleep (* 30 15))
        (sleep 60)
    )
)

(script dormant unlock_comment_5
    (begin
        (sleep_until (< (object_get_health "unlockable_hippo_comment_5") 0) 7)
        (unlockable_pickup)
        (sleep 90)
        (cinematic_set_title "unlockable_comment")
        (stop_commentary)
        (sound_looping_start "sound\commentary\a30_greenhouse\a30_greenhouse_05" "none" 1)
        (sleep (* 30 15))
        (sleep 60)
    )
)

(script dormant unlock_comment_6
    (begin
        (sleep_until (< (object_get_health "unlockable_hippo_comment_6") 0) 7)
        (unlockable_pickup)
        (sleep 90)
        (cinematic_set_title "unlockable_comment")
        (stop_commentary)
        (sound_looping_start "sound\commentary\a30_greenhouse\a30_greenhouse_06" "none" 1)
        (sleep (* 30 15))
        (sleep 60)
    )
)

(script startup drop_hippos
    (if (map_completed "normal")
        (begin
            (object_create_containing "unlockable_hippo")
            (sleep 10)
            (wake unlock_comment_1)
            (wake unlock_comment_2)
            (wake unlock_comment_3)
            (wake unlock_comment_4)
            (wake unlock_comment_5)
            (wake unlock_comment_6)
        )
    )
)

