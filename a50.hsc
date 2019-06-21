(global bool cutscene_running false)

(global bool hand_music false)

(global bool boss_music false)

(global bool give_head false)

(global short hunt 0)

(global bool head_tutorial false)

(global short modal_help_timer 300)

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

(script static void a50_10
(begin
(if
(= show_cutscenes true) a50_10)))

(script static void cutscenes_on
(begin
(set show_cutscenes true)))

(script startup void save_path
(begin
(sleep_until
(volume_test_objects save_block_a
(players_current)) 1)
(game_save)))

(script static void checkpoint1
(begin
(object_teleport checkpoint1 checkpoint_01)))

(script startup void car_lock
(begin
(unit_set_enterable_by_player pickup_01 false)
(unit_set_enterable_by_player ext_car_01 false)
(unit_set_enterable_by_player ext_car_02 false)
(unit_set_enterable_by_player ext_car_03 false)
(unit_set_enterable_by_player int_car_01 false)
(unit_set_enterable_by_player int_car_02 false)
(unit_set_enterable_by_player int_car_03 false)
(unit_set_enterable_by_player int_car_04 false)
(unit_set_enterable_by_player int_car_05 false)
(unit_set_enterable_by_player int_car_06 false)
(unit_set_enterable_by_player rampage false)
(unit_set_enterable_by_player road_rage false)
(unit_set_enterable_by_player road_rage_b false)
(unit_set_enterable_by_player ramp_car_01 false)
(unit_set_enterable_by_player ramp_car_02 false)
(unit_set_enterable_by_player ramp_car_03 false)
(unit_set_enterable_by_player civ_car_01 false)
(unit_set_enterable_by_player civ_car_02 false)
(unit_set_enterable_by_player civ_car_03 false)))

(script continuous void areyoustubbs
(begin
(sleep_until
(and
(volume_test_objects player_check_01
(players_origin))
(volume_test_objects elevator_trig
(players_origin))) -1)
(if
(game_is_cooperative)
(begin
(player_enable_input false)
(player_camera_control true)
(camera_control false 0)
(fade_out 0.00 0.00 0.00 30)
(sleep 30)
(player_force_respawn)
(switch_bsp 1)
(volume_teleport_players_not_inside garage_switch prom_start)
(player_enable_input true)
(player_camera_control true)
(camera_control false 0)
(fade_in 0.00 0.00 0.00 60))
(begin
(player_enable_input false)
(player_camera_control true)
(camera_control false 0)
(device_group_set elevator 1.00)
(sleep_until
(volume_test_objects promenade_load
(players_origin)) 1)
(player_enable_input true)
(player_camera_control true)
(camera_control false 0)))))

(script continuous void areyoustubbs_2
(begin
(sleep_until
(and
(volume_test_objects player_check_02
(players_origin))
(volume_test_objects prom_el_down
(players_origin))) -1)
(objects_cannot_take_damage
(players_origin) true)
(player_enable_input false)
(player_camera_control true)
(camera_control false 0)
(device_group_set prom_elevator 1.00)
(sleep_until
(volume_test_objects prom_bottom
(players_origin)) 1)
(player_enable_input true)
(player_camera_control true)
(camera_control false 0)
(volume_teleport_players_not_inside prom_bottom alley_drop_spawn)
(objects_cannot_take_damage
(players_origin) false)))

(script dormant void road_rage_01a
(begin
(ai_vehicle_encounter road_rage_b rage_vehicle_b)
(sleep_until
(volume_test_objects copdrop_02
(ai_actors rage_vehicle_b)) 1)
(ai_command_list rage_vehicle_b rage_ride_b)
(sleep_until
(volume_test_objects car_unload road_rage_b) 5)
(ai_set_current_state rage_vehicle_b search)
(vehicle_unload road_rage_b )
(ai_command_list b_zone_defenders/road_cop initiate_attack)))

(script dormant void road_rage_01
(begin
(wake road_rage_01a)
(ai_vehicle_encounter road_rage rage_vehicle)
(sleep_until
(volume_test_objects rage_start
(ai_actors rage_vehicle)) 1)
(ai_command_list rage_vehicle rage_ride)
(sleep_until
(volume_test_objects car_unload road_rage) 5)
(ai_set_current_state rage_vehicle search)
(vehicle_unload road_rage )
(ai_command_list b_zone_defenders/road_cop_b initiate_attack)))

(script dormant void road_rage_02
(begin
(ai_force_active g2_defenders/g2_rampager true)
(ai_force_active rampage_vehicle true)
(ai_vehicle_encounter rampage rampage_vehicle)
(sleep_until
(volume_test_objects g3_drop
(ai_actors rampage_vehicle)) 1)
(ai_command_list rampage_vehicle rage_ride_c)
(sleep_until
(volume_test_objects car_unload_02 rampage) 5)
(ai_set_current_state rampage_vehicle search)
(vehicle_unload rampage )
(unit_set_enterable_by_player rampage false)
(ai_command_list b_zone_defenders/road_cop_b initiate_attack)
(ai_magically_see_players g2_defenders/g2_rear)))

(script startup void dumbass_tip
(begin
(sleep_until
(and
(volume_test_objects garage_snipe_trigger
(players_current))
(not head_tutorial)))
(show_hud_help_text true)
(hud_set_help_text dumbpos)
(sleep
(* 30.00 10.00))
(show_hud_help_text false)))

(script dormant void sniper_camp
(begin
(sleep_until
(volume_test_objects garage_snipe_trigger
(players_current)) 1)
(sleep_until
(<=
(ai_living_count garage_lure/sniper) 1) 1)
(begin
(ai_place garage_lure/hand_killer)
(device_set_position overpass_door 1.00)
(sleep_until
(not
(volume_test_objects op_door_drop
(ai_actors garage_lure/hand_killer))) 1)
(ai_magically_see_players garage_lure/hand_killer)
(device_set_position overpass_door 0.00)
(objects_cannot_take_damage
(ai_actors garage_lure/hand_killer) true)
(objects_cannot_lose_regions
(ai_actors garage_lure/hand_killer) true)
(ai_berserk garage_lure/hand_killer true)
(objects_cannot_be_possessed
(ai_actors garage_lure/hand_killer) true))))

(script dormant void inner_garage
(begin
(begin
(unit_set_enterable_by_player int_car_01 false)
(unit_set_enterable_by_player int_car_02 false)
(unit_set_enterable_by_player int_car_03 false)
(unit_set_enterable_by_player int_car_04 false)
(unit_set_enterable_by_player int_car_05 false)
(unit_set_enterable_by_player int_car_06 false))
(sleep_until
(or
(volume_test_objects g2_drop_01
(players_current))
(volume_test_objects g2_drop_02
(players_current))) 1)
(ai_place g2_defenders/g2_front)
(ai_magically_see_players g2_defenders/g2_front)
(sleep -1 sniper_camp)
(game_save_cancel)
(game_save_no_timeout)
(sleep_until
(volume_test_objects g2_drop_03
(players_current)) 1)
(ai_place g2_defenders/g2_rampager)
(ai_force_active g2_defenders/g2_rampager true)
(wake road_rage_02)
(sleep 15)
(ai_place g2_defenders/g2_rear)
(ai_force_active g2_defenders/g2_rear true)
(sleep_until
(volume_test_objects g3_drop
(players_current)) 1)
(ai_place g3_defenders)
(game_save_cancel)
(game_save_no_timeout)
(sleep_until
(volume_test_objects op_drop
(players_current)) 1)
(game_save_cancel)
(game_save_no_timeout)))

(script dormant void back_waves_a
(begin
(sleep_until
(volume_test_objects back_wave_01
(players_current)) 1)
(game_save_cancel)
(ai_place back_wave/defense_a)
(ai_magically_see_players back_wave/defense_a)
(wake inner_garage)
(game_save_no_timeout)
(sleep_until
(volume_test_objects back_wave_02
(players_current)) 5)
(game_save_cancel)
(ai_place back_wave/defense_b)
(game_save_no_timeout)))

(script dormant void back_waves_b
(begin
(sleep_until
(volume_test_objects copdrop_02
(players_current)) 1)
(ai_place g1_defenders)
(wake inner_garage)
(sleep_until
(=
(ai_living_count g1_defenders) 0))
(game_save_no_timeout)))

(script startup void civilian_run_b
(begin
(sleep_until
(volume_test_objects run_b_trigger
(players_current)) 1)
(ai_place civilian_b)
(ai_place z_crypt/zombie_c)))

(script dormant void head_hud_tip_on
(begin
(print head_hud_tip_on)
(show_hud_help_text true)
(hud_set_help_text head)
(if
(not
(game_is_cooperative))
(begin
(sleep
(* 30.00 6.00))
(show_hud_help_text true)
(hud_set_help_text blank)
(sleep 2)
(display_scenario_help 1)
(sleep 2)
(show_hud_help_text true)
(hud_set_help_text head)))
(sleep
(* 30.00 60.00))
(show_hud_help_text false)
(sleep -1)))

(script static void head_hud_tip_off
(begin
(print head_hud_tip_off)
(sleep -1 head_hud_tip_on)
(enable_hud_help_flash false)
(show_hud_help_text false)))

(script dormant void head_hud_tip2_on
(begin
(print head_hud_tip2_on)
(show_hud_help_text true)
(hud_set_help_text head2)
(sleep
(* 30.00 10.00))
(show_hud_help_text false)
(sleep -1)))

(script static void head_hud_tip2_off
(begin
(print head_hud_tip2_off)
(sleep -1 head_hud_tip2_on)
(enable_hud_help_flash false)
(show_hud_help_text false)))

(script dormant void head_hud_tip3_on
(begin
(print head_hud_tip3_on)
(show_hud_help_text true)
(hud_set_help_text head3)
(sleep -1)))

(script static void head_hud_tip3_off
(begin
(print head_hud_tip3_off)
(sleep -1 head_hud_tip3_on)
(enable_hud_help_flash false)
(show_hud_help_text false)))

(script static void a50_head_cinema
(begin
(fade_out 0.00 0.00 0.00 0) a50_head_cinema
(switch_bsp 2)
(sound_class_set_gain ambient_nature 0.00 0)
(sound_class_set_gain device_machinery 0.00 0)
(sleep 30)
(object_activation_add_camera guidebot_closeup)
(ai_command_list bots01/guidebot guidebot_look)
(camera_set guidebot_closeup 0)
(fade_in 0.00 0.00 0.00 30)
(sleep 30)
(sound_impulse_start sound\dialog\a50\se_guidebot_head_1
(list_get
(ai_actors bots01/guidebot) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a50\se_guidebot_head_1))
(sleep 15)
(camera_set guidebot_closeup2 0)
(sleep 15)
(sound_impulse_start sound\dialog\a50\se_guidebot_head_2
(list_get
(ai_actors bots01/guidebot) 0) 1.00)
(sleep
(sound_impulse_time sound\dialog\a50\se_guidebot_head_2))
(fade_out 0.00 0.00 0.00 30)
(sleep 30) a50_head_cinema))

(script dormant void head_hud_tip2_thingy
(begin
(player_action_test_reset)
(sleep_until
(=
(player_action_test_abandon) true)) head_hud_tip2_thingy))

(script startup void enable_the_head
(begin
(sleep_until
(volume_test_objects head_trigger
(players_origin)) 1)
(game_save_cancel)
(fade_out 0.00 0.00 0.00 30)
(sleep 30)
(object_teleport enable_the_head head_tut_stubbs)
(object_teleport enable_the_head head_tut_grubbs)
(object_teleport
(unit
(list_get
(ai_actors bots01/guidebot) 0)) head_tut_guidebot)
(objects_cannot_take_damage
(players_current) true)
(ai_braindead z_crypt true)
(ai false) enable_the_head
(ai true)
(sound_class_set_gain ambient_nature 1.00 15)
(sound_class_set_gain device_machinery 1.00 15)
(object_teleport enable_the_head head_tut_stubbs2)
(fade_in 0.00 0.00 0.00 30)
(objects_cannot_take_damage
(players_current) false)
(ai_braindead z_crypt false)
(ai_place op_defenders)
(device_set_position overpass_door 1.00)
(player_set_profile enable_the_head enable_head false)
(player_set_profile enable_the_head enable_head false)
(ai_magically_see_players op_defenders)
(wake head_hud_tip_on)
(player_action_test_reset)
(sleep_until
(=
(player_action_test_head) true))
(set head_tutorial true) enable_the_head
(sleep
(* 30.00 4.00))
(wake head_hud_tip2_on)
(wake head_hud_tip2_thingy)
(sleep_until
(object_is_instance enable_the_head characters\stubbs\stubbs))
(set head_tutorial false)
(sleep
(* 30.00 3.00))
(sound_impulse_start sound\dialog\a50\se_guidebot_head_3
(list_get
(ai_actors bots01/guidebot) 0) 1.00)
(device_set_position overpass_door 0.00)
(device_operates_automatically_set overpass_door false)
(ai_command_list op_defenders initiate_attack)
(sleep
(* 30.00 5.00))
(ai_enable_communication bots01/guidebot true)
(sleep_until
(=
(ai_living_count op_defenders) 0) 1)
(game_save)
(ai_place elevator_defense)
(device_group_change_only_once_more_set garage_pass true)
(device_operates_automatically_set overpass_door true)
(device_one_sided_set overpass_door false)
(if
(not
(game_is_cooperative))
(begin
(player_action_test_reset)
(sleep_until
(=
(player_action_test_head) true))
(sleep
(* 30.00 3.00))
(wake head_hud_tip3_on)
(sleep
(* 30.00 5.00))
(sleep_until
(object_is_instance enable_the_head characters\stubbs\stubbs)) enable_the_head))))

(script startup void streetfight01
(begin streetfight01
(fade_out 0.00 0.00 0.00 0)
(if streetfight01 streetfight01) streetfight01
(device_operates_automatically_set overpass_door false)
(object_teleport streetfight01 post_cinema_start)
(object_teleport streetfight01 post_cinema_start2)
(ai_place a_zone_defenders/civ_01)
(ai_place bots01)
(objects_cannot_take_damage
(ai_actors bots01/guidebot) true)
(objects_cannot_die
(ai_actors bots01/guidebot) true)
(ai_enable_communication bots01/guidebot false)
(ai_place a_zone_defenders/defense_a)
(ai_place z_crypt/zombie_d)
(fade_in 0.00 0.00 0.00 30)
(player_enable_input true)
(player_camera_control true)
(camera_control false 0)
(sleep_until
(volume_test_objects copdrop_01
(players_current)) 1)
(unit_set_enterable_by_player ext_car_01 false)
(wake back_waves_a)
(wake back_waves_b)
(ai_place b_zone_defenders/assault_a)
(ai_place b_zone_defenders/civilian_a)
(ai_place b_zone_defenders/road_cop)
(ai_place b_zone_defenders/road_cop_b)
(ai_force_active b_zone_defenders/road_cop true)
(ai_force_active b_zone_defenders/road_cop_b true)
(ai_force_active rage_vehicle true)
(wake road_rage_01)
(game_save_cancel)
(game_save_no_timeout)
(sleep_until
(<
(ai_living_count b_zone_defenders/assault_a) 2) 1)
(ai_place garage_lure/back_lure)
(ai_place garage_lure/front_lure)
(ai_place garage_lure/sniper)
(ai_place civilian_a)
(wake sniper_camp)
(ai_magically_see_players garage_lure)))

(script startup void promenade
(begin
(sleep_until
(volume_test_objects promenade_load
(players_current)) 1)
(game_save_cancel)
(game_save_no_timeout)
(ai_set_resurrection_group z_crypt_02/zombie_a)
(ai_place b1_starters)
(ai_place b1_defenders)
(ai_place civilian_c)
(ai_place bots02)
(ai_place z_crypt_02/zombie_b)
(ai_berserk z_crypt_02 true)
(sleep_until
(volume_test_objects bank_look
(players_current)) 5)
(sleep_until
(<=
(ai_living_count b1_defenders) 6) 1)
(game_save_cancel)
(game_save_no_timeout)
(sleep_until
(game_safe_to_save))
(sleep 30)
(ai_place bank_lure/carrot)
(ai_place promenade_opening)
(ai_berserk promenade_opening true)
(device_group_set bank_door 1.00)
(sleep_until
(volume_test_objects carrot_02_drop
(players_current)) 1)
(game_save_cancel)
(ai_place bank_lure/carrot_02)
(ai_place civilian_d)
(ai_magically_see_players bank_lure/carrot_02)
(game_save_no_timeout)
(sleep_until
(volume_test_objects snipe_drop
(players_current)) 1)
(ai_defend bank_lure/carrot_02)
(ai_begin_flee bank_lure/carrot_02 false 150)
(ai_place p1_snipers)
(ai_magically_see_players p1_snipers)
(device_group_set ambush_door 1.00)))

(script startup void prom_cars_unload_02
(begin
(sleep_until
(volume_test_objects prom_car_stop_01 ramp_car_02) 1)
(vehicle_unload ramp_car_02 )))

(script startup void prom_cars_unload_03
(begin
(sleep_until
(volume_test_objects prom_car_stop_03 ramp_car_03) 1)
(vehicle_unload ramp_car_03 )))

(script startup void promenade_ramp
(begin
(sleep_until
(volume_test_objects ramp_drop
(players_current)) 5)
(game_save_cancel)
(game_save_no_timeout)
(device_group_set ramp_run 1.00)
(ai_place r1_fight/r1_start)
(ai_place r1_fight/r1_civ)
(ai_begin_flee r1_fight/r1_civ true 0)
(sleep_until
(volume_test_objects ramp_defense
(players_current)) 1)
(game_save_cancel)
(ai_place r1_fight/r1_flank_r_02)
(ai_place r1_fight/r1_flank_l_02)
(ai_force_active r1_fight true)
(ai_force_active prom_car_02 true)
(ai_force_active prom_car_03 true)
(ai_vehicle_encounter ramp_car_02 prom_car_02)
(ai_vehicle_encounter ramp_car_03 prom_car_03)
(ai_magically_see_players r1_fight/r1_flank_r_01)
(ai_magically_see_players r1_fight/r1_flank_l_02)
(vehicle_load_magic ramp_car_02 
(ai_actors r1_fight/r1_flank_r_02))
(vehicle_load_magic ramp_car_03 
(ai_actors r1_fight/r1_flank_l_02))
(game_save_no_timeout)
(sleep_until
(volume_test_objects prom_car_start_02
(ai_actors prom_car_02)) 1)
(print car 2 loaded)
(ai_force_active prom_car_02 true)
(ai_magically_see_players prom_car_02)
(ai_command_list rage_vehicle prom_car_02)
(ai_place r1_fight/r1_wall)
(sleep_until
(volume_test_objects prom_car_start_03
(ai_actors prom_car_03)) 1)
(print car 3 loaded)
(ai_force_active prom_car_03 true)
(ai_magically_see_players prom_car_03)
(ai_command_list rage_vehicle prom_car_03)
(sleep_until
(or
(volume_test_objects ramp_flank_drop
(players_current))
(<
(ai_living_count r1_fight/r1_wall) 5)) 1)
(game_save_cancel)
(game_save_no_timeout)
(ai_place r1_fight/r1_flank_l)
(ai_magically_see_players r1_fight/r1_flank_l)
(ai_end_flee r1_fight/r1_civ)
(sleep_until
(volume_test_objects snipe_drop_01
(players_current)) 1)
(ai_place p2_snipers_01/room_def)
(game_save_cancel)
(game_save_no_timeout)
(sleep_until
(volume_test_objects snipe_drop_02
(players_current)) 1)
(ai_place p2_snipers_02/room_def)
(game_save_cancel)
(game_save_no_timeout)
(sleep_until
(volume_test_objects alley_drop
(players_current)) 1)
(ai_place p2_alley_fight)
(player_force_respawn)
(game_save_cancel)
(game_save_no_timeout)))

(script startup void wall_of_lead
(begin
(sleep_until
(volume_test_objects cop_wall_drop
(players_current)) 1)
(objects_destroy
(objects_in_volume
(ai_actors z_crypt_02) zombie_killer_trigger))
(objects_destroy
(objects_in_volume
(ai_actors r1_fight) zombie_killer_trigger))
(objects_destroy
(objects_in_volume
(ai_actors b1_defenders) zombie_killer_trigger))
(objects_destroy
(objects_in_volume
(ai_actors p1_snipers) zombie_killer_trigger))
(game_save_cancel)
(game_save_no_timeout)
(ai_berserk z_crypt_02 true)
(ai_place p2_defenders/cop_wall)
(ai_place p2_snipers_01)
(ai_place p2_snipers_02)
(ai_magically_see_players p2_snipers_01/sniper)
(ai_try_to_fight_player p2_snipers_01/sniper)
(ai_magically_see_players p2_snipers_02/sniper)
(ai_try_to_fight_player p2_snipers_02/sniper)
(sleep_until
(or
(volume_test_objects cop_wall_drop_02
(players_current))
(<
(ai_living_count p2_defenders/cop_wall) 1)) 1)
(ai_place p2_defenders/cop_rearguard)))

(script startup void militia_lure
(begin
(sleep_until
(volume_test_objects run_militia
(players_current)) 1)
(ai_begin_flee p2_defenders/cop_wall false 150)))

(script startup void mainpath
(begin
(ai_set_resurrection_group z_crypt)
(ai_allegiance zombie possessed)
(sleep_until
(volume_test_objects trigger_linefight
(players_current)) 1)
(game_save_cancel)
(game_save_no_timeout)
(sleep 15)
(ai_place warehouse_def)
(ai_magically_see_players warehouse_def)
(sleep_until
(not
(volume_test_objects warehouse_zone
(ai_actors warehouse_def))) 1)
(device_set_position line_door 0.00)
(device_operates_automatically_set line_door false)
(sleep 10)
(ai_command_list warehouse_def initiate_attack)
(sleep_until
(and
(volume_test_objects trigger_linefight
(players_origin))
(game_safe_to_save)))
(fade_out 0.00 0.00 0.00 60)
(sleep 60)
(game_won)))

(script static void checkpoint2
(begin
(object_teleport checkpoint2 checkpoint_02)
(wake inner_garage)))

(script static void checkpoint3
(begin
(switch_bsp 1)
(object_teleport checkpoint3 ramp_start)
(object_teleport checkpoint3 ramp_start_02)))

(script static void checkpoint4
(begin
(switch_bsp 1)
(object_teleport checkpoint4 street_assault)
(object_teleport checkpoint4 street_assault_02)))

(script continuous void anti_cheat_01
(begin
(sleep_until
(volume_test_objects cheat_right
(players_origin)) 1)
(apply_impulse cheat_right cheat_right 0.15 0.15 effects\tubes\lift)))

(script continuous void anti_cheat_02
(begin
(sleep_until
(volume_test_objects cheat_left
(players_origin)) 1)
(apply_impulse cheat_left cheat_left 0.15 0.15 effects\tubes\lift)))

(script continuous void anti_cheat_03
(begin
(sleep_until
(volume_test_objects cheat_monday
(players_origin)) 1)
(apply_impulse cheat_monday cheat_monday 0.30 0.30 effects\tubes\lift)))

(script continuous void anti_cheat_04
(begin
(sleep_until
(volume_test_objects cheat_right_op
(players_current)) 1)
(apply_impulse cheat_right_op cheat_right_op 0.30 0.30 effects\tubes\lift)))

(script continuous void anti_cheat_05
(begin
(sleep_until
(volume_test_objects cheat_left_op
(players_current)) 1)
(apply_impulse cheat_left_op cheat_left_op 0.30 0.30 effects\tubes\lift)))

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
(sound_looping_start sound\music\hand_4\hand_4 none 1.00)
(sleep_until
(or
(= hand_music false)
(= boss_music true) hand_music) 1)
(sound_looping_stop sound\music\hand_4\hand_4)))

(script continuous void boss_music
(begin
(sleep_until
(= boss_music true) 1)
(if hand_music
(sleep 30))
(sleep_until
(or
(= boss_music false) boss_music) 1)))

(script dormant void 10_animations
(begin
(unit_custom_animation_at_frame 10_judy_1 cinematics\animations\judy\a50\a50 a50_10_judy_1 false 60)
(unit_custom_animation_at_frame 10_fred_1 cinematics\animations\ted\a50\a50 a50_10_fred_1 false 60)
(unit_custom_animation_at_frame 10_belair_1 cinematics\animations\belair\a50\a50 a50_10_belair_1 false 60)
(sleep 740)
(object_create 10_stubbs_1)
(object_beautify 10_stubbs_1 true)
(custom_animation 10_stubbs_1 cinematics\animations\stubbs\a50\a50 a50_10_stubbs_2 false)))

(script dormant void 10_dialog
(begin
(sleep 118)
(sound_impulse_start sound\dialog\a50\10_judy_1 10_judy_1 1.00)
(sleep 105)
(sound_impulse_start sound\dialog\a50\10_fred_1 10_fred_1 1.00)
(sleep 120)
(camera_set 10_04c 0)
(sound_impulse_start sound\dialog\a50\10_judy_2 10_judy_1 1.00)
(sleep 56)
(sound_impulse_start sound\dialog\a50\10_fred_2 10_fred_1 1.00)
(sleep 15)
(camera_set 10_04e 0)
(sleep 75)
(camera_set 10_04d 0)
(camera_set 10_04b 400)
(sleep 131)
(sound_impulse_start sound\dialog\a50\10_judy_3 10_judy_1 1.00)))

(script static void a50_10_run
(begin
(fade_out 0.00 0.00 0.00 0)
(sound_looping_predict sound\cinematics\a50\10_foley_1) a50_10_run
(switch_bsp 0)
(object_activation_add_camera 10_01)
(sound_class_set_gain vehicle_engine 0.00 0)
(sound_class_set_gain ambient_nature 0.00 0)
(sound_class_set_gain device_machinery 0.00 0)
(object_create 10_belair_1)
(object_beautify 10_belair_1 true)
(object_create 10_fred_1)
(object_beautify 10_fred_1 true)
(object_create 10_judy_1)
(object_beautify 10_judy_1 true)
(unit_set_weapon 10_fred_1 none)
(unit_set_weapon 10_judy_1 none)
(object_create 10_eldorado_1)
(object_create 10_driver_1)
(unit_enter_vehicle_now 10_driver_1 10_eldorado_1 cr-driver)
(recording_play 10_eldorado_1 10_eldorado_1)
(ai_place 10_panic)
(camera_set 10_01 0)
(sleep 30)
(sound_looping_start sound\cinematics\a50\10_foley_1 none 0.70)
(print a50_10:  introduction)
(camera_set 10_01 0)
(fade_in 0.00 0.00 0.00 30)
(sleep 60)
(camera_set 10_02 120)
(sleep 90)
(unit_custom_animation_at_frame 10_judy_1 cinematics\animations\judy\a50\a50 a50_10_judy_1 false 60)
(unit_custom_animation_at_frame 10_fred_1 cinematics\animations\ted\a50\a50 a50_10_fred_1 false 60)
(unit_custom_animation_at_frame 10_belair_1 cinematics\animations\belair\a50\a50 a50_10_belair_1 false 60)
(wake 10_animations)
(wake 10_dialog)
(camera_set 10_03 120)
(sleep 120)
(camera_set 10_04 0)
(camera_set 10_04b 400)
(sleep 15)
(sleep 495)
(camera_set 10_05 250)
(sleep 30)
(sleep 150)
(ai_erase 10_panic)
(camera_set 10_06 0)
(sound_impulse_start sound\dialog\a50\10_judy_4 10_judy_1 1.00)
(sound_impulse_start sound\dialog\a50\10_fred_3 10_fred_1 1.00)
(print aaaaaahhhh!!!!!)
(sleep 60)
(camera_set 10_07 0)
(sound_impulse_start sound\dialog\a50\10_stubbs_2 10_stubbs_1 0.00)
(print ooooooooohhhhhhh)
(sleep 60)
(camera_set 10_05b 0)
(sleep 44)
(object_create_anew 10_judy_1)
(recording_play 10_judy_1 10_judy_1)
(object_destroy 10_fred_1)
(unit_custom_animation_at_frame 10_belair_1 cinematics\animations\belair\a50\a50 a50_10_belair_1 false 1115)
(unit_custom_animation_at_frame 10_stubbs_1 cinematics\animations\stubbs\a50\a50 a50_10_stubbs_2 false 315)
(camera_set 10_08 0)
(sleep 30)
(sleep 60)
(unit_custom_animation_at_frame 10_belair_1 cinematics\animations\belair\a50\a50 a50_10_belair_1 false 1393)
(unit_custom_animation_at_frame 10_stubbs_1 cinematics\animations\stubbs\a50\a50 a50_10_stubbs_2 false 593)
(camera_set 10_11 0)
(sleep 60)
(camera_set 10_12 0)
(sleep 30)
(object_create 10_stubbs_3)
(object_beautify 10_stubbs_3 true)
(object_set_permutation 10_stubbs_3 head ~head_hair)
(object_create 10_hat_1)
(custom_animation 10_stubbs_3 cinematics\animations\stubbs\a50\a50 a50_10_stubbs_4 false)
(scenery_animation_start 10_hat_1 scenery\misc\hat\hat hatfall)
(sleep 60)
(sleep 40)
(camera_set 10_13 0)
(sleep 90)
(objects_attach 10_stubbs_3 melee 10_hat_1 stubbs)
(camera_set 10_14 0)
(sleep 32)
(object_set_permutation 10_stubbs_3 head ~head)
(object_destroy 10_hat_1)
(sleep 33)
(object_create 10_stubbs_4)
(object_teleport 10_stubbs_4 10_stubbs_3)
(recording_play 10_stubbs_4 10_stubbs_1)
(sleep 25)
(object_destroy 10_stubbs_3)
(camera_set 10_15b 0)
(sleep 90)
(fade_out 0.00 0.00 0.00 0) a50_10_run
(sound_class_set_gain vehicle_engine 1.00 0)
(sound_class_set_gain ambient_nature 1.00 30)
(sound_class_set_gain device_machinery 1.00 30)
(object_activation_clear)
(object_destroy_containing 10_)))

(script static void cutscenes_off
(begin
(set show_cutscenes false)))

(script startup void test
(begin
(if
(> test 0) test)
(if
(= test 10) test)))

(script static void preview
(begin preview preview))

(script static void next_cutscene
(begin
(map_name levels\a60_maulfight\a60_maulfight_cutscene)))

(script static void unlockable_pickup
(begin
(damage_object equipment\hippo\hippo_pickup unlockable_pickup)
(if
(game_is_cooperative)
(damage_object equipment\hippo\hippo_pickup unlockable_pickup))))

(script static void stop_commentary
(begin
(sound_looping_stop sound\commentary\a50_maul\a50_maul_01)
(sound_looping_stop sound\commentary\a50_maul\a50_maul_02)
(sound_looping_stop sound\commentary\a50_maul\a50_maul_03)
(sound_looping_stop sound\commentary\a50_maul\a50_maul_04)))

(script dormant void unlock_comment_1
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_1) 0.00) 7) unlock_comment_1
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_1
(sound_looping_start sound\commentary\a50_maul\a50_maul_01 none 1.00)
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
(sound_looping_start sound\commentary\a50_maul\a50_maul_02 none 1.00)
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
(sound_looping_start sound\commentary\a50_maul\a50_maul_03 none 1.00)
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
(sound_looping_start sound\commentary\a50_maul\a50_maul_04 none 1.00)
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