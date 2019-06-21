(global bool cutscene_running false)

(global bool been_to_the_house false)

(global bool hand_music false)

(global bool southgate_hurt false)

(global bool north_bypass true)

(global bool inside_northgate false)

(global weapon silo_sniper none)

(global bool fodder_in_barn false)

(global bool barn_top_open false)

(global short shack_spawn_limiter 0)

(global bool dumb_zombies false)

(global weapon zombie_house_bang none)

(global bool show_cutscenes true)

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

(script static void return_players_to_bodies
(begin
(print return_players_to_bodies)
(if
(not
(object_is_instance return_players_to_bodies characters\stubbs\stubbs))
(begin
(print returning player 0 to body)
(unit_kill_silent return_players_to_bodies)))
(if
(and
(game_is_cooperative)
(not
(object_is_instance return_players_to_bodies characters\stubbs\stubbs)))
(begin
(print returning player 1 to body)
(unit_kill_silent return_players_to_bodies)))))

(script static void southgate_setup
(begin
(switch_bsp 0)
(object_teleport southgate_setup southgate_teleport)
(fade_in 0.00 0.00 0.00 0)))

(script static void northgate_setup
(begin
(switch_bsp 0)
(object_teleport northgate_setup northgate_teleport)
(fade_in 0.00 0.00 0.00 0)))

(script static void tractor_setup
(begin
(switch_bsp 0)
(object_teleport tractor_setup tractor_teleport)
(fade_in 0.00 0.00 0.00 0)))

(script static void haystacks_setup
(begin
(switch_bsp 0)
(object_teleport haystacks_setup haystacks_teleport)
(fade_in 0.00 0.00 0.00 0)))

(script static void garage_setup
(begin
(switch_bsp 1)
(object_teleport garage_setup garage_teleport)
(fade_in 0.00 0.00 0.00 0)))

(script static void house_setup
(begin
(switch_bsp 1)
(object_teleport house_setup house_teleport)
(fade_in 0.00 0.00 0.00 0)))

(script static void second_setup
(begin
(switch_bsp 1)
(object_teleport second_setup second_teleport)
(fade_in 0.00 0.00 0.00 0)))

(script static void checkpoint1
(begin checkpoint1))

(script static void checkpoint2
(begin checkpoint2))

(script static void checkpoint3
(begin checkpoint3))

(script static void checkpoint4
(begin checkpoint4))

(script static void checkpoint5
(begin checkpoint5))

(script static void checkpoint6
(begin checkpoint6))

(script static void checkpoint7
(begin checkpoint7))

(script static void b10_10
(begin
(if
(= show_cutscenes true) b10_10)))

(script static void b10_20
(begin
(if
(= show_cutscenes true) b10_20)))

(script static void b10_30
(begin
(if
(= show_cutscenes true) b10_30)))

(script static void cutscenes_on
(begin
(set show_cutscenes true)))

(script static void cutscenes_off
(begin
(set show_cutscenes false)))

(script startup void allegiance
(begin
(ai_set_resurrection_group zombies_start/zombie_squad)))

(script dormant void remove_otis
(begin
(sleep
(sound_impulse_time sound\dialog\b10\se_otis_1))
(object_destroy otis_yelling_01)))

(script startup void southgate
(begin
(fade_out 0.00 0.00 0.00 0)
(if southgate southgate) southgate
(object_teleport southgate player_start1)
(object_teleport southgate player_start2)
(object_create otis_truck)
(object_create smoke)
(unit_set_enterable_by_player otis_truck false)
(game_save_cancel)
(game_save_no_timeout)
(set southgate_hurt false)
(ai_place southgate/fox1)
(vehicle_load_magic browning_gun3 
(ai_actors southgate/fox1))
(ai_vehicle_encounter browning_gun3 southgate/fox1)
(ai_braindead southgate/fox1 true)
(ai_place southgate/fox2)
(ai_place southgate/shed_inside1)
(ai_place southgate/shed_outside)
(object_create otis_yelling_01)
(ai_attach otis_yelling_01 otis_enc_01)
(ai_command_list otis_enc_01 opening_otis)
(objects_cannot_be_possessed
(ai_actors otis_enc_01) true)
(objects_cannot_take_damage
(ai_actors otis_enc_01) true)
(fade_in 0.00 0.00 0.00 0)
(sleep_until
(volume_test_objects trigger_south1
(players_current)))
(ai_place southgate/runner1)
(ai_place southgate/corn1)
(ai_place southgate/corn2)
(ai_command_list southgate/runner1 runner1)
(sleep 30)
(sound_impulse_start sound\dialog\b10\se_otis_1 otis_yelling_01 0.50)
(wake remove_otis)
(ai_braindead southgate/fox1 false)
(sleep 180)
(ai_set_deaf southgate/corn1 true)
(ai_set_deaf southgate/corn2 true)
(ai_command_list southgate/corn1 corn1)
(ai_command_list southgate/corn2 corn2)
(sleep 31)
(sleep_until
(volume_test_objects trigger_south6
(players_current)))
(ai_command_list southgate/corn1 initiative)
(ai_command_list southgate/corn2 initiative)
(ai_set_deaf southgate/corn1 false)
(ai_set_deaf southgate/corn2 false)))

(script startup void trigger_south2
(begin
(sleep_until
(volume_test_objects trigger_south2
(players_current)) 10)
(ai_place southgate/shed_inside2)
(ai_set_deaf southgate false)))

(script startup void machinegun_bail3
(begin
(sleep 1)
(sleep_until
(volume_test_objects trigger_gunner_bail3
(players_current)))
(unit_exit_vehicle
(unit
(list_get
(ai_actors southgate/fox1) 0)))))

(script startup void machinegun_fodder
(begin
(sleep_until
(=
(vehicle_test_seat_list browning_gun3 gunner
(players_current)) true))
(ai_command_list southgate/corn1 shoot_corn1_2)
(ai_command_list southgate/corn2 shoot_corn1_2)))

(script startup void south_bypass
(begin
(sleep 3)
(sleep_until
(volume_test_objects trigger_south7
(players_current)))
(ai_place southgate/anti_bypass)))

(script startup void southgate_hurt_boolean
(begin
(sleep_until
(>
(ai_living_count southgate/runner1) 0) 1)
(sleep_until
(and
(<
(ai_strength southgate/fox2) 0.95)
(and
(=
(ai_living_count southgate/runner1) 0)
(<
(ai_strength southgate/corn2) 0.95))))
(set southgate_hurt true)
(print southgate_hurt true)))

(script startup void shed_out_fight
(begin
(sleep_until
(= southgate_hurt true))
(ai_magically_see_players southgate/shed_outside)
(ai_try_to_fight_player southgate/shed_outside)))

(script startup void maul_the_sneaker
(begin
(sleep_until
(volume_test_objects trigger_south2
(players_current)) 1)
(game_save_cancel)
(game_save_no_timeout)
(sleep_until
(and
(volume_test_objects trigger_south3
(players_current))
(= southgate_hurt false)))
(ai_place southgate/shotgun_maul)
(sleep 30)
(sound_impulse_start sound\dialog\militia_medium_combat\berserk none 1.00)))

(script continuous void shed_respawn
(begin
(sleep 3)
(sleep_until
(and
(and
(=
(ai_living_count southgate/shed_inside1) 0)
(volume_test_objects trigger_south_shed
(players_current)))
(=
(ai_living_count southgate/shed_inside2) 0)))
(ai_spawn_actor southgate/shed_inside2)
(set shack_spawn_limiter
(+ shack_spawn_limiter 1.00))
(inspect shack_spawn_limiter)
(ai_command_list southgate/shed_inside2 to_shed_window)
(if
(or
(volume_test_objects trigger_south8
(players_current))
(and
(> shack_spawn_limiter 3)
(= southgate_hurt true)))
(begin
(sleep_until
(not
(objects_can_see_flag
(players_current) cheat_spawn 50.00)))
(ai_place southgate/cheater_killers)
(ai_berserk southgate/cheater_killers true)
(ai_magically_see_players southgate/cheater_killers)
(objects_cannot_lose_regions
(ai_actors southgate/cheater_killers) true)
(sleep 200)
(objects_cannot_lose_regions
(ai_actors southgate/cheater_killers) false)))))

(script startup void shed_respawn_off
(begin
(sleep_until
(or
(volume_test_objects trigger_south8
(players_current))
(> shack_spawn_limiter 3)))
(sleep -1 shed_respawn)))

(script startup void roadrunners
(begin
(sleep 7)
(sleep_until
(and
(= southgate_hurt true)
(volume_test_objects trigger_south3
(players_current))))
(game_save_cancel)
(game_save_no_timeout)
(sleep 20)
(ai_place southgate/runner2)
(ai_place southgate/runner2a)
(ai_command_list southgate/runner2 runner2)
(ai_command_list southgate/runner2a runner2a)
(sound_impulse_start sound\dialog\militia_medium_combat\flee_deserting none 1.00)
(ai_braindead southgate/runner2 false)))

(script startup void rock_forward
(begin
(sleep 2)
(sleep_until
(volume_test_objects trigger_south9
(players_current)))
(ai_place northgate_road/1)
(ai_command_list northgate_road/1 rock_forward)
(ai_set_current_state southgate/shotgun_maul follow_player)
(ai_magically_see_players southgate/shotgun_maul)
(ai_berserk southgate/shotgun_maul true)))

(script startup void north_save1
(begin
(sleep_until
(and
(volume_test_objects trigger_north6
(players_current))
(=
(ai_living_count northgate_road/1) 0)))
(ai_kill southgate/fox1)
(ai_kill southgate/fox2)
(ai_kill southgate/shed_inside2)
(ai_kill southgate/shed_inside1)
(ai_kill southgate/corn2)
(ai_kill southgate/corn1)
(ai_kill southgate/runner1)
(ai_kill southgate/shed_outside)
(ai_kill southgate/road1)
(ai_kill southgate/anti_bypass)
(ai_kill southgate/runner2a)
(sleep 45)
(game_save_cancel)
(game_save_no_timeout)))

(script startup void northgate
(begin
(sleep 1)
(sleep_until
(volume_test_objects trigger_north1
(players_current)))
(sleep 30)
(ai_place northgate/road1)
(ai_place northgate/road2)
(ai_place northgate/road3)
(ai_magically_see_players northgate/road3)
(ai_try_to_fight_player northgate/road1)
(ai_braindead northgate/road2 true)
(game_save_cancel)
(game_save_no_timeout)))

(script startup void north_corn1
(begin
(sleep_until
(and
(<
(ai_strength northgate/road1) 0.95)
(volume_test_objects trigger_north2a
(players_current))))
(sleep 30)
(ai_place northgate/corn1)
(ai_magically_see_players northgate/corn1)
(game_save_cancel)
(game_save_no_timeout)
(set north_bypass false)))

(script startup void bypass_2a
(begin
(sleep_until
(and
(= north_bypass true)
(and
(volume_test_objects trigger_north2
(players_current))
(<
(ai_living_count northgate/road2) 3))))
(sleep 90)
(ai_place northgate/corn1)
(ai_migrate northgate/corn1 northgate/corn1a_blank)
(ai_magically_see_players northgate/corn1a_blank)))

(script startup void go_left
(begin
(sleep 3)
(sleep_until
(volume_test_objects trigger_north11
(players_current)))
(ai_place northgate/corn2)
(ai_magically_see_players northgate/corn2)))

(script startup void road_ambush
(begin
(sleep 5)
(sleep_until
(volume_test_objects trigger_north2
(players_current)))
(ai_braindead northgate/road2 false)
(ai_command_list northgate/road2 road_ambush)
(ai_magically_see_players northgate/road2)))

(script continuous void sheep_baa
(begin
(sleep 5)
(sleep_until
(volume_test_objects trigger_north4a
(players_current)))
(sound_impulse_start sound\dialog\b10\30_sheep_1 sheep2 0.50)
(sleep 60)
(sound_impulse_start sound\dialog\b10\30_sheep_1 sheep6 0.50)
(sleep 120)
(sound_impulse_start sound\dialog\b10\30_sheep_1 sheep1 0.50)
(sleep 30)))

(script dormant void cancel_to_gate_command_lists
(begin
(sleep_until
(volume_test_objects trigger_north3
(players_current)))
(ai_set_current_state northgate/shed1 guard)
(ai_set_current_state northgate/shed2 guard)))

(script startup void sheeplovin
(begin
(sleep 2)
(sleep_until
(volume_test_objects trigger_north4
(players_current)))
(game_save_cancel)
(game_save_no_timeout)
(recording_play sheep1 sheep_run1)
(recording_play sheep2 sheep_run2)
(recording_play sheep3 sheep_run3)
(recording_play sheep4 sheep_run4)
(recording_play sheep5 sheep_run5)
(recording_play sheep6 sheep_run6)
(recording_play sheep7 sheep_run7)
(sleep 200)
(sound_impulse_start sound\dialog\b10\se_militia_open
(list_get
(ai_actors northgate/shed2) 0) 1.00)
(ai_place northgate/shed1)
(ai_command_list northgate/shed1 to_fence)
(sleep 120)
(ai_place northgate/shed2)
(ai_command_list northgate/shed2 to_northgate)
(wake cancel_to_gate_command_lists)
(sleep_until
(volume_test_objects trigger_north3
(ai_actors northgate)) 1)
(device_set_position northgate 1.00)
(sleep 60)
(ai_place northgate/shed3)
(ai_command_list northgate/shed2 into_corn1)
(ai_command_list northgate/shed3 into_corn2)
(sleep_until
(volume_test_objects trigger_north8
(players_current)))
(ai_migrate northgate/shed3 northgate/cornhunters2)
(sleep_until
(volume_test_objects trigger_north7
(players_current)))
(ai_migrate northgate/shed2 northgate/cornhunters1)))

(script startup void northgate_will_open
(begin
(sleep 2)
(sleep_until
(volume_test_objects trigger_north4
(players_current)))
(sleep_until
(>
(ai_living_count northgate/shed2) 0))
(sleep_until
(or
(and
(=
(ai_living_count northgate/shed2) 0)
(and
(=
(device_get_position northgate) 0.00)
(= inside_northgate false)))
(volume_test_objects trigger_north_wind
(players_current))))
(device_set_position northgate 1.00)))

(script startup void northgate_shed
(begin
(sleep 4)
(sleep_until
(volume_test_objects trigger_north5
(players_current)) 3)
(ai_place northgate/shed4)
(ai_command_list northgate/shed4 shed4_out)
(ai_place northgate/tractor_chainsaw)
(ai_braindead northgate/tractor_chainsaw true)
(set inside_northgate true)
(sleep 60)
(ai_place northgate/shed5)
(object_create shy_sheep)
(object_create sheep_man)))

(script startup void on_the_road_again
(begin
(sleep 5)
(sleep_until
(and
(volume_test_objects trigger_north10
(players_current))
(=
(vehicle_test_seat_list tractor1 tr-driver
(players_current)) true)))
(ai_place northgate/hay_road1)
(ai_magically_see_players northgate/hay_road1)))

(script startup void close_northgate
(begin
(sleep 5)
(sleep_until
(or
(volume_test_objects trigger_north10
(players_current))
(=
(vehicle_test_seat_list tractor1 tr-driver
(players_origin)) true)))))

(script startup void north_chain
(begin
(sleep_until
(and
(= inside_northgate true)
(<=
(ai_living_count northgate/shed4) 2)))
(ai_braindead northgate/tractor_chainsaw false)))

(script startup void tractor_arrive
(begin
(sleep_until
(and
(= inside_northgate true)
(or
(=
(ai_living_count northgate/tractor_chainsaw) 0)
(volume_test_objects trigger_north10
(players_current)))))
(ai_place northgate/tractorguy)
(vehicle_load_magic tractor1 tr-driver
(ai_actors northgate/tractorguy))
(ai_command_list northgate/tractorguy tractor_arrive)
(sleep_until
(volume_test_objects trigger_north_tractor_bail
(ai_actors northgate/tractorguy)))
(vehicle_unload tractor1 tr-driver)
(ai_set_blind northgate/tractorguy false)))

(script startup void shed5_out
(begin
(sleep_until
(=
(vehicle_test_seat_list tractor1 tr-driver
(players_current)) true))
(ai_migrate northgate/shed5 northgate/shed5_out_blank)
(ai_try_to_fight_player northgate/shed5_out_blank)
(ai_braindead northgate/tractor_chainsaw false)))

(script startup void sheep_chase
(begin
(sleep 1)
(sleep_until
(volume_test_objects trigger_north_sheep_love
(players_current)))
(recording_play shy_sheep sheep_circle)
(recording_play sheep_man man_circle)
(ai_dialogue_triggers false)
(sound_impulse_start sound\dialog\b10\30_sheep_1 shy_sheep 1.00)
(sleep 60)
(sound_impulse_start sound\dialog\b10\se_militia_sheep sheep_man 0.50)
(ai_dialogue_triggers true)
(sleep 30)
(sound_impulse_start sound\dialog\b10\30_sheep_1 shy_sheep 2.00)
(sleep_until
(volume_test_objects trigger_north_sheep_love_off
(players_current)) 1)
(ai_command_list_by_unit sheep_man initiative)
(ai_attach sheep_man northgate/sheep_militia)
(sleep_until
(=
(ai_living_count northgate/sheep_militia) 0) 1)
(recording_kill sheep_man)
(recording_kill shy_sheep)
(sleep 90)
(sound_impulse_start sound\dialog\b10\se_sheep_1 shy_sheep 0.75)))

(script startup void biped_breakout
(begin
(sleep_until
(volume_test_objects trigger_north_sheep_love
(players_current)) 1)
(player_action_test_reset)
(sleep_until
(or
(player_action_test_hand)
(player_action_test_flatulence)) 1)
(ai_attach_free sheep_man characters\militia_thin\militia_thin)))

(script startup void coop_tract
(begin
(sleep_until
(=
(game_is_cooperative) true))
(object_create coop_tractor)))

(script startup void haystacks
(begin
(sleep 2)
(sleep_until
(volume_test_objects trigger_hay1
(players_current)))
(game_save_cancel)
(game_save_no_timeout)
(sleep 15)
(ai_place haystacks/skewer_me)
(ai_place haystacks/ground1)
(ai_place haystacks/stacks1)
(ai_vehicle_encounter browning_gun4 haystacks/foxhole1)
(sleep 3)
(sleep_until
(volume_test_objects trigger_hay2
(players_current)))
(ai_place haystacks/foxhole1)
(ai_command_list haystacks/foxhole1 man_gun_stand)
(ai_command_list haystacks/ground1 flee_to_stacks1)
(ai_place haystacks/ridge1)
(sleep 120)
(ai_place haystacks/foxhole2)
(ai_command_list haystacks/foxhole2 man_gun_stand)
(ai_try_to_fight_player haystacks/foxhole1)
(ai_magically_see_players haystacks/foxhole1)))

(script startup void got_tractor
(begin
(sleep_until
(and
(volume_test_objects trigger_hay2
(players_current))
(=
(vehicle_test_seat_list tractor1 tr-driver
(players_current)) true)))))

(script startup void flank1
(begin
(sleep_until
(and
(=
(ai_living_count haystacks/foxhole1) 0)
(volume_test_objects trigger_kill_foxhole1
(players_current))))
(sleep_until
(=
(objects_can_see_flag
(players_current) hill1_flag 50.00) false))
(ai_place haystacks/hill1)
(sleep_until
(=
(objects_can_see_flag
(players_current) hill1_flag_b 50.00) false))
(ai_place haystacks/ridge2)
(ai_command_list haystacks/ridge2 advance2)))

(script startup void flank2
(begin
(sleep_until
(<=
(ai_strength haystacks/ridge2) 0.50))
(ai_command_list haystacks/hill1 advance3)))

(script startup void hay4
(begin
(sleep 4)
(sleep_until
(volume_test_objects trigger_hay4
(players_current)))
(ai_place haystacks/foxhole2)
(ai_place haystacks/fox2_guard)
(ai_kill_silent northgate)
(ai_kill_silent southgate)
(ai_command_list haystacks/foxhole2 man_gun_stand)
(ai_vehicle_encounter browning_gun5 haystacks/foxhole2)))

(script startup void machinegun_bail4
(begin
(sleep 2)
(sleep_until
(volume_test_objects trigger_kill_foxhole1
(players_current)))
(unit_exit_vehicle
(unit
(list_get
(ai_actors haystacks/foxhole1) 0)))))

(script startup void machinegun_bail5
(begin
(sleep 3)
(sleep_until
(volume_test_objects trigger_kill_foxhole2
(players_current)) 5)
(unit_exit_vehicle
(unit
(list_get
(ai_actors haystacks/foxhole2) 0)))))

(script startup void pit_attract1
(begin
(sleep 4)
(sleep_until
(volume_test_objects trigger_hay8
(players_current)))
(ai_place haystacks/hill2)
(ai_place haystacks/hill2a)
(ai_command_list haystacks/hill2 pit_attract1)))

(script startup void pit_ambush1
(begin
(sleep 5)
(sleep_until
(and
(volume_test_objects trigger_hay9
(players_current))
(=
(objects_can_see_flag
(players_current) pit1_flag 50.00) false)))
(ai_place haystacks/hill_ambush)
(ai_try_to_fight_player haystacks/hill_ambush)
(ai_magically_see_players haystacks/hill_ambush)))

(script startup void hay6
(begin
(sleep 6)
(sleep_until
(volume_test_objects trigger_hay6
(players_current)))
(sleep_until
(=
(objects_can_see_flag
(players_current) fox3_flag 75.00) false))
(ai_place haystacks/foxhole3)))

(script startup void hay7
(begin
(sleep 7)
(sleep_until
(volume_test_objects trigger_hay7
(players_current)))
(ai_place haystacks/garage1)
(ai_place haystacks/garage2)
(sleep 60)
(ai_command_list haystacks/garage2 garage_out)))

(script startup void hay10
(begin
(sleep 5)
(sleep_until
(volume_test_objects trigger_hay10
(players_current)))
(sleep_until
(=
(objects_can_see_flag
(players_current) pit2_right_flag 50.00) false))
(ai_place haystacks/pit2_right)
(ai_command_list haystacks/pit2_right down_hill)
(ai_place haystacks/pit2_left)
(ai_place haystacks/chainsaw)
(ai_magically_see_players haystacks/chainsaw)))

(script startup void kill_0
(begin
(sleep 4)
(sleep_until
(volume_test_objects kill_bsp_0
(players_current)))
(ai_erase haystacks)
(ai_erase northgate)))

(script startup void close_bsp_0
(begin
(sleep 1)
(sleep_until
(volume_test_objects kill_possessed_garage
(players_current)))
(object_create b1)
(object_create b2)
(object_create b3)
(object_create b4)
(object_create b5)
(sleep_until
(volume_test_objects bsp 0,1
(players_origin)) 1)
(player_force_respawn)
(object_destroy b1)
(object_destroy b2)
(object_destroy b5)
(object_destroy tractor1)
(object_destroy coop_tractor)
(object_destroy big_rock_in_overlap)
(sleep 30)
(sound_impulse_start sound\sfx\devices\doors\door_slam none 1.00)
(sleep 2)
(sound_impulse_start sound\sfx\devices\doors\door_slam none 1.00)
(sleep 1)
(sound_impulse_start sound\sfx\devices\doors\diner_door_break none 1.00)
(sleep 3)
(sound_impulse_start sound\sfx\devices\doors\door_slam none 1.00)
(object_create b10)
(object_create b11)
(object_create b12)
(object_create b14)
(object_create b15)
(object_create b17)
(object_create b18)
(object_create b19)
(object_create b20)
(game_save_cancel)
(game_save_no_timeout)))

(script static void place_first_gunner
(begin
(ai_place yard/gun1)
(ai_vehicle_encounter browning_gun1 yard/gun1)
(ai_command_list yard/gun1 man_gun_run1)))

(script startup void front_yard
(begin
(sleep 3)
(sleep_until
(volume_test_objects trigger_yard1a
(players_current)))
(ai_set_resurrection_group zombies_end/zombie_squad)
(ai_allow_dormant zombies_end/zombie_squad false)
(game_save_cancel)
(game_save_no_timeout)
(sleep 60)
(ai_place yard/garage_away)
(ai_set_deaf yard/garage_away true)
(ai_place yard/garage_toward)
(ai_place yard/road_patrol)
(ai_place yard/barn_advance)
(sleep_until
(or
(volume_test_objects trigger_yard1
(players_current))
(<
(ai_strength yard/garage_away) 0.95)))
(ai_command_list yard/garage_toward garage_flee)
(ai_set_deaf yard false)
(ai_magically_see_players yard/garage_away)
(sleep 30)
(ai_magically_see_players yard/road_patrol)
(ai_try_to_fight_player yard/road_patrol)
(sleep_until
(volume_test_objects trigger_yard2
(players_current)))
(game_save_cancel)
(game_save_no_timeout)
(sleep_until
(and
(not
(volume_test_objects trigger_more_barn
(players_current)))
(=
(objects_can_see_flag
(players_current) inside_shed_spot 50.00) false)))
(ai_place yard/shed_advance)
(ai_command_list yard/shed_advance shed_run1)
(ai_command_list yard/barn_advance barn_stairs)
(ai_place yard/silo)
(ai_magically_see_players yard/silo) front_yard
(player_action_test_reset)
(set silo_sniper
(unit
(list_get
(ai_actors yard/silo) 0)))
(sleep_until
(and
(=
(ai_living_count yard/silo) 0)
(=
(player_action_test_possess) false)))
(object_teleport silo_sniper sniper_fall)
(apply_impulse trigger_blower_silo blower_silo 0.05 0.05 effects\tubes\wind)))

(script startup void barn_rear
(begin
(sleep 9)
(sleep_until
(volume_test_objects trigger_yard_barn_rear
(players_current)))
(ai_place yard/barn_rear)
(ai_maneuver yard/shed_advance)
(sleep_until
(volume_test_objects trigger_gun2
(players_current)))
(ai_place yard/gun2)
(ai_command_list yard/gun2 man_gun_run2)
(ai_vehicle_encounter browning_gun2 yard/gun2)))

(script startup void mid_yard
(begin
(sleep_until
(and
(<=
(ai_strength yard/shed_advance) 0.50)
(=
(ai_living_count yard/silo) 1)))
(ai_migrate yard/road_patrol yard/retreat1)
(ai_migrate yard/shed_advance yard/retreat1)
(ai_migrate yard/barn_advance yard/retreat1)
(ai_command_list yard/retreat1 shed_run2)
(sleep_until
(and
(not
(volume_test_objects trigger_more_barn
(players_current)))
(=
(objects_can_see_flag
(players_current) inside_shed_spot 50.00) false)))
(ai_place yard/shed_inside)))

(script startup void open_top_door
(begin
(sleep_until
(and
(=
(ai_living_count yard/barn_counterattack) 0)
(and
(=
(device_get_position barn_door) 0.00)
(and
(=
(objects_can_see_flag
(players_current) barn_door_top 45.00) false)
(= fodder_in_barn true)))))
(set barn_top_open true)
(ai_place yard/top_attract)
(ai_command_list yard/top_attract attract_top)))

(script startup void machinegun_bail1
(begin
(sleep 1)
(sleep_until
(volume_test_objects trigger_tractor_bail
(players_current)))
(unit_exit_vehicle
(unit
(list_get
(ai_actors yard/gun1) 0)))))

(script startup void barn_interior
(begin
(sleep 4)
(sleep_until
(or
(volume_test_objects trigger_barn
(players_current))
(volume_test_objects barn_hand_04
(players_current))
(volume_test_objects barn_hand_03
(players_current))
(volume_test_objects barn_hand_02
(players_current))
(volume_test_objects barn_hand_09
(players_current))
(volume_test_objects barn_hand_01
(players_current))
(= barn_top_open true)) 1)
(sleep 60)
(ai_place barn/rafters)
(ai_magically_see_players barn/rafters)
(ai_place barn/loft2)
(ai_place barn/floor)
(device_set_position barn_door 0.00)
(sleep_until
(or
(volume_test_objects trigger_loft
(players_current))
(volume_test_objects barn_hand_04
(players_current))
(volume_test_objects barn_hand_03
(players_current))
(volume_test_objects barn_hand_02
(players_current))
(volume_test_objects barn_hand_09
(players_current))
(volume_test_objects barn_hand_01
(players_current))
(<
(ai_strength barn/rafters) 0.50)) 1)
(if
(= fodder_in_barn false)
(begin
(ai_place barn/fodder)))))

(script startup void fodder_flee
(begin
(sleep 5)
(sleep_until
(volume_test_objects trigger_barn_floor
(players_current)))
(ai_kill zombies_end/zombie_runoff)
(ai_playfight barn/fodder true)
(ai_magically_see_players barn/floor)
(ai_kill barn/rafters)))

(script continuous void dumb_patton_zombies
(begin
(sleep_until
(= dumb_zombies true) 1)
(ai_braindead zombies_end true)))

(script startup void patton
(begin
(sleep 6)
(sleep_until
(and
(volume_test_objects trigger_barn_floor
(players_origin))
(=
(ai_living_count barn) 0)))
(if
(= been_to_the_house false)
(begin
(fade_out 0.00 0.00 0.00 0)
(ai_kill_silent barn)
(ai_teleport_to_starting_location zombies_end/zombie_squad)
(ai_braindead zombies_end true)
(set dumb_zombies true)
(game_save_cancel) patton
(if patton patton) patton
(set dumb_zombies false)
(object_teleport patton barn_origin0)
(object_teleport patton barn_origin1)
(object_teleport patton barn_current0)
(object_teleport patton barn_current1)
(sleep 5)
(ai_braindead zombies_end false)
(fade_in 0.00 0.00 0.00 0)))
(game_save_cancel)
(game_save_no_timeout)
(device_set_position barn_door 1.00)
(sleep_until
(and
(volume_test_objects trigger_gun2
(players_current))
(=
(ai_living_count barn/fodder) 0)))
(ai_place yard/gun2)
(ai_command_list yard/gun2 man_gun_run2)
(ai_vehicle_encounter browning_gun2 yard/gun2)
(ai_command_list zombies_end zombies_rush_gunner2)))

(script startup void machinegun_bail2
(begin
(sleep 3)
(sleep_until
(volume_test_objects trigger_gunner_bail2
(players_current)) 5)
(unit_exit_vehicle
(unit
(list_get
(ai_actors yard/gun2) 0)))))

(script startup void porch_guys
(begin
(sleep 4)
(sleep_until
(volume_test_objects trigger_porch_rush
(players_current)))
(ai_place yard/porch_rushers)
(ai_command_list yard/porch_rushers porch_rush)))

(script startup void house
(begin
(sleep 7)
(sleep_until
(volume_test_objects trigger_house_exterior
(players_current)) 5)
(volume_teleport_players_not_inside big_fucking_yard_trigger house_teleport)
(ai_kill_silent barn)
(set been_to_the_house true)
(ai_place house/windows)
(ai_set_deaf house/windows true)
(ai_place house/living2)
(sleep_until
(=
(objects_can_see_flag
(players_current) porch_attract1_flag 30.00) false))
(ai_place house/porch_attract1)
(ai_command_list house/porch_attract1 porch_attract_run)))

(script startup void delayed_placement
(begin
(sleep 6)
(sleep_until
(volume_test_objects trigger_attack_door
(players_current)))
(ai_place house/coatroom)
(ai_braindead house/coatroom true)
(ai_place house/living1)
(sound_impulse_start sound\dialog\b10\se_militia_did_you_close talking_door 1.00)
(sleep
(sound_impulse_time sound\dialog\b10\se_militia_did_you_close))
(sleep 15)
(sound_impulse_start sound\dialog\b10\se_militia_did_not_close_1 talking_door 1.00)
(sleep
(sound_impulse_time sound\dialog\b10\se_militia_did_not_close_1))))

(script startup void braindead_barn
(begin
(sleep_until
(volume_test_objects trigger_attack_door
(players_current)))
(ai_braindead barn true)
(sleep_until
(volume_test_objects trigger_barn
(players_current)))
(ai_braindead barn false)))

(script startup void window_walk
(begin
(sleep 2)
(sleep_until
(volume_test_objects trigger_window_walk
(players_current)))
(ai_place house/living_window)
(ai_command_list house/living_window window_walk)
(sleep 30)
(ai_try_to_fight_player house/living2)
(ai_try_to_fight_player house/living1)
(sleep_until
(=
(objects_can_see_flag
(players_current) see_breakthrough 30.00) true))
(ai_place house/dining)))

(script startup void porch_attract2
(begin
(sleep 1)
(sleep_until
(volume_test_objects trigger_porch_attract2
(players_current)))
(sleep_until
(=
(objects_can_see_flag
(players_current) porch_attract2_flag 30.00) false))
(ai_place house/porch_attract2)))

(script startup void otis_back_porch
(begin
(sleep 4)
(sleep_until
(volume_test_objects trigger_back_porch
(players_current)))
(sound_impulse_stop sound\dialog\b10\se_otis_10)
(sound_impulse_start sound\dialog\b10\se_otis_6 none 1.00)))

(script startup void in_house
(begin
(sleep 7)
(sleep_until
(volume_test_objects trigger_in_house
(players_current)))
(sound_impulse_stop sound\dialog\b10\se_otis_6)
(sound_impulse_start sound\dialog\b10\se_otis_10 none 1.00)
(ai_kill zombies_end/zombie_runoff)
(game_save_cancel)
(game_save_no_timeout)))

(script startup void kitchen_eat
(begin
(sleep 5)
(sleep_until
(volume_test_objects trigger_kitchen_break
(players_origin)) 5)
(volume_teleport_players_not_inside trigger_kitchen_break kitchen_break)
(ai_kill_silent yard)
(ai_kill_silent barn)
(ai_kill_silent zombies_end/zombie_runoff)
(ai_place yard_zombies/kitchen_breaker)
(ai_command_list yard_zombies/kitchen_breaker kitchen_break)
(sleep
(* 30.00 3.00))
(ai_braindead house/coatroom false)
(ai_place house/more_pantry)))

(script startup void pantry_save
(begin
(sleep_until
(and
(volume_test_objects trigger_pantry_save
(players_current))
(=
(ai_living_count house/more_pantry) 0)))
(ai_braindead house true)
(sleep 45)
(game_save_cancel)
(game_save_no_timeout)
(sleep 45)
(ai_braindead house false)))

(script startup void dining_eat
(begin
(sleep 5)
(sleep_until
(volume_test_objects trigger_dining_break
(players_current)))
(ai_place yard_zombies/dining_breaker)
(ai_command_list yard_zombies/dining_breaker dining_break)))

(script startup void rally
(begin
(sleep 3)
(sleep_until
(volume_test_objects trigger_rally
(players_current)) 5)
(sound_impulse_start sound\dialog\b10\se_otis_4 none 1.00)
(ai_place house/rally)
(ai_command_list house/rally rally)
(ai_place house/more_coatroom)))

(script startup void back_break2
(begin
(sleep_until
(or
(volume_test_objects trigger_back_break1
(players_current))
(volume_test_objects trigger_back_break2
(players_current))) 1)
(ai_place house/back_break)
(ai_place yard_zombies/back_breaker)
(ai_command_list yard_zombies/back_breaker back_break)))

(script startup void more_dining
(begin
(sleep 4)
(sleep_until
(volume_test_objects trigger_more_dining
(players_current)))
(ai_place house/more_dining)))

(script startup void more_living
(begin
(sleep 5)
(sleep_until
(volume_test_objects trigger_more_living
(players_current)))
(ai_place house/more_living)
(ai_magically_see_players house)))

(script startup void living_room
(begin
(sleep 6)
(sleep_until
(volume_test_objects trigger_run_downstairs
(players_current)))
(ai_set_return_state zombies_end/zombie_runoff follow_player)
(ai_set_current_state zombies_end/zombie_runoff follow_player)
(ai_allow_dormant zombies_end/zombie_runoff false)
(ai_set_return_state yard_zombies follow_player)
(ai_set_current_state yard_zombies follow_player)
(ai_allow_dormant yard_zombies false)))

(script startup void stair_save
(begin
(sleep_until
(volume_test_objects trigger_stair_save
(players_origin)))
(ai_set_return_state zombies_end/zombie_runoff move_random)
(ai_set_current_state zombies_end/zombie_runoff move_random)
(ai_set_return_state yard_zombies move_random)
(ai_set_current_state yard_zombies move_random)
(ai_allow_dormant zombies_end/zombie_runoff true)
(ai_allow_dormant yard_zombies true)
(ai_set_deaf house false)
(game_save_cancel)
(game_save_no_timeout)))

(script static void otis_ending
(begin otis_ending
(game_save_cancel)
(if otis_ending otis_ending) otis_ending
(game_won)))

(script startup void second
(begin
(sleep_until
(volume_test_objects trigger_second1
(players_current)) 5)
(ai_place second/run_guy)
(ai_command_list second/run_guy second_run)
(ai_place second/desk_guy)
(game_save_cancel)
(game_save_no_timeout)))

(script startup void first_floor_death
(begin
(sleep_until
(volume_test_objects trigger_second2
(players_origin)) 1)
(volume_teleport_players_not_inside trigger_second2 house_kill)
(ai_kill_silent house)
(ai_kill_silent zombies_end/zombie_runoff)))

(script startup void closets
(begin
(sleep_until
(volume_test_objects trigger_second3
(players_origin)))
(sound_impulse_start sound\sfx\devices\doors\door_slam none 1.00)
(ai_place second/closet1)
(ai_place second/decoy)
(ai_command_list second/closet1 closet_ambush1)
(ai_magically_see_players second/closet1)
(ai_try_to_fight_player second/closet1)
(sleep 15)
(sound_impulse_start sound\sfx\devices\doors\door_slam none 1.00)
(sleep_until
(volume_test_objects trigger_second4
(players_current)) 5)
(ai_place second/closet2)
(ai_command_list second/closet2 closet_ambush2)
(ai_magically_see_players second/closet2)
(ai_try_to_fight_player second/closet2)))

(script startup void chain_run
(begin
(sleep_until
(volume_test_objects trigger_second5
(players_current)))
(sleep_until
(not
(objects_can_see_flag
(players_current) chainsaw_03 30.00)))
(ai_place second/chainsaw3)
(ai_command_list second/chainsaw3 chain_run1)
(sleep_until
(volume_test_objects trigger_more_living
(ai_actors second/chainsaw3)))
(ai_erase second/chainsaw3)))

(script startup void new_chains
(begin
(sleep_until
(volume_test_objects trigger_second5
(players_current)))
(sleep_until
(not
(objects_can_see_flag
(players_current) chainsaw_01 30.00)))
(sound_impulse_start sound\dialog\b10\60_militia_1 none 1.00)
(ai_place second/chainsaw1)
(sleep_until
(not
(objects_can_see_flag
(players_current) chainsaw_02 30.00)))
(ai_place second/chainsaw2)))

(script continuous void fucking_kill_stubbs
(begin
(sleep_until
(=
(ai_living_count second/chainsaw2) 1))
(ai_magically_see_players second/chainsaw1)
(ai_magically_see_players second/chainsaw2)
(ai_prefer_target
(players_current) true)))

(script startup void otis_final_taunt
(begin
(sleep_until
(and
(=
(ai_living_count second/chainsaw1) 0)
(and
(=
(ai_living_count second/chainsaw2) 0)
(volume_test_objects trigger_second6
(players_current)))))
(sound_impulse_start sound\dialog\b10\se_otis_11 none 1.00)))

(script startup void outside_mayhem
(begin
(sleep 3)
(sleep_until
(volume_test_objects trigger_second6
(players_origin)))
(volume_teleport_players_not_inside trigger_second6 chainsaw_shunt)
(ai_kill zombies_end/zombie_runoff)
(ai_place second/yard_chainsaws)
(ai_place yard_zombies/1)
(sleep_until
(<
(ai_strength yard_zombies/1) 0.40))
(ai_command_list second/yard_chainsaws chain_to_house)
(sleep_until
(volume_test_objects trigger_house_exterior
(ai_actors second/yard_chainsaws)))
(sleep_until
(=
(objects_can_see_flag
(players_current) see_breakthrough 60.00) false))
(ai_kill second/yard_chainsaws)))

(script startup void end_it
(begin
(sleep_until
(volume_test_objects trigger_second8
(players_origin)) 1)
(print game won)
(sound_impulse_stop sound\dialog\b10\se_otis_11)
(fade_out 0.00 0.00 0.00 0)
(sleep -1 mid_yard)
(sleep -1 patton)
(sleep -1 barn_rear)
(ai_kill_silent second)
(ai_kill_silent barn)
(ai_kill_silent house)
(ai_kill_silent yard)
(ai_kill_silent yard_zombies)
(ai_kill_silent zombies_end)
(object_teleport end_it player_end1)
(object_teleport end_it player_end2) end_it))

(script startup void back_room
(begin
(sleep 3)
(sleep_until
(volume_test_objects trigger_second7
(players_current)))
(ai_place second/back_room)))

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
(= hand_music true) 1)
(sound_looping_start sound\music\hand_4\hand_4 none 0.75)
(sleep_until
(or
(= hand_music false) hand_music) 1)
(sound_looping_stop sound\music\hand_4\hand_4)))

(script dormant void 10_cigarette
(begin
(sleep 534)
(object_create 10_cigarette_1)
(objects_attach 10_stubbs_1 meleel 10_cigarette_1 leftattachment)
(sleep 77)
(object_create 10_match_1)
(objects_attach 10_stubbs_1 melee 10_match_1 rightattachment)
(sleep 25)
(effect_new_on_object cinematics\effects\b10\match_light 10_match_1)
(sleep 87)
(objects_detach 10_stubbs_1 10_match_1)
(scenery_animation_start 10_match_1 cinematics\animations\match\b10\b10 b10_10_match_3)
(sleep 13)
(objects_detach 10_stubbs_1 10_cigarette_1)
(object_destroy 10_cigarette_1)
(object_set_permutation 10_stubbs_1 head __base)))

(script dormant void 10_hat
(begin
(object_create 10_hat_1)
(scenery_animation_start 10_hat_1 scenery\misc\hat\hat hatfall2)
(sleep 219)
(object_create_anew 10_hat_1)
(objects_attach 10_stubbs_1 melee 10_hat_1 stubbs)
(sleep 32)
(object_set_permutation 10_stubbs_1 head __base)
(object_destroy 10_hat_1)))

(script dormant void 10_stubbs_dialog
(begin
(sleep 700)
(sound_impulse_start sound\cinematics\b10\10_stubbs_1 10_stubbs_1 1.00)
(sleep
(sound_impulse_time sound\cinematics\b10\10_stubbs_1))
(sound_impulse_start sound\cinematics\b10\10_stubbs_2 10_stubbs_1 1.00)
(sleep
(sound_impulse_time sound\cinematics\b10\10_stubbs_2))
(sound_impulse_start sound\cinematics\b10\10_stubbs_3 10_stubbs_1 1.00)))

(script static void b10_10_run
(begin
(fade_out 0.00 0.00 0.00 0)
(sound_looping_predict sound\cinematics\b10\10_foley_1) b10_10_run
(object_activation_add_camera 10_01)
(sound_class_set_gain vehicle_engine 0.00 0)
(object_create 10_pickup_1)
(object_create 10_otis_1)
(object_create 10_stubbs_1)
(object_set_permutation 10_stubbs_1 head ~head)
(object_beautify 10_otis_1 true)
(object_beautify 10_pickup_1 true)
(object_beautify 10_stubbs_1 true)
(unit_enter_vehicle 10_otis_1 10_pickup_1 cr-driver)
(objects_attach 10_pickup_1 stubbsdrag 10_stubbs_1 body)
(recording_play 10_pickup_1 10_pickup_1)
(game_skip_ticks 15)
(sleep 15)
(game_skip_ticks 15)
(sleep 15)
(sound_looping_start sound\cinematics\b10\10_foley_1 none 1.00)
(wake 10_stubbs_dialog)
(print b10_10:  introduction)
(camera_set 10_01 0)
(fade_in 0.00 0.00 0.00 0)
(sleep 90)
(camera_set_relative 10_02 0 10_pickup_1)
(object_create 10_pickup_2)
(object_create 10_otis_3)
(object_beautify 10_pickup_2 true)
(object_beautify 10_otis_3 true)
(unit_enter_vehicle 10_otis_3 10_pickup_2 cr-driver)
(objects_detach 10_pickup_1 10_stubbs_1)
(objects_attach 10_pickup_2 stubbsdrag 10_stubbs_1 body)
(recording_play 10_pickup_2 10_pickup_2)
(sleep 90)
(camera_set 10_03 0)
(recording_kill 10_pickup_1)
(object_destroy 10_pickup_1)
(object_create 10_sheep_1)
(object_create 10_sheep_2)
(object_create 10_sheep_3)
(object_create 10_sheep_4)
(sleep 120)
(camera_set 10_04b 0)
(sleep 15)
(recording_play 10_sheep_2 10_sheep_2)
(recording_play 10_sheep_3 10_sheep_3)
(recording_play 10_sheep_4 10_sheep_4)
(sleep 10)
(recording_play 10_sheep_1 10_sheep_1)
(sleep 105)
(camera_set 10_05 0)
(sleep 80)
(camera_set 10_06 0)
(sleep 60)
(object_teleport 10_pickup_2 10_pickup_4)
(objects_detach 10_pickup_2 10_stubbs_1)
(objects_attach 10_pickup_2 stubbsdrop 10_stubbs_1 body)
(custom_animation 10_stubbs_1 cinematics\animations\stubbs\b10\b10 b10_10_stubbs_2 false)
(camera_set 10_07b 0)
(unit_exit_vehicle 10_otis_3)
(sleep 30)
(object_destroy 10_otis_3)
(object_create 10_otis_2)
(object_beautify 10_otis_2 true)
(recording_play 10_otis_2 10_otis_2)
(sleep 30)
(custom_animation 10_stubbs_1 cinematics\animations\stubbs\b10\b10 b10_10_stubbs_2 false)
(camera_set 10_07 0)
(camera_set 10_07c 90)
(sound_impulse_start sound\dialog\b10\10_otis_1 10_otis_2 1.00)
(sleep
(unit_get_custom_animation_time 10_stubbs_1))
(camera_set 10_10b 0)
(camera_set 10_10 120)
(sleep 120)
(object_create 10_fuel_leak)
(object_create_anew 10_stubbs_1)
(object_set_permutation 10_stubbs_1 head ~head)
(custom_animation 10_stubbs_1 cinematics\animations\stubbs\b10\b10 b10_10_stubbs_3 false)
(wake 10_cigarette)
(camera_set 10_11 0)
(sleep 80)
(camera_set 10_11b 0)
(sleep 180)
(camera_set 10_11c 0)
(camera_set 10_11c2 100)
(sleep 100)
(camera_set 10_11d 0)
(camera_set 10_11e 300)
(sleep 363)
(camera_set 10_11g 0)
(sleep 90)
(print match lights ground)
(effect_new_on_object scenery\b10_farm\fuel_leak\gasburn 10_fuel_leak)
(object_destroy 10_match_1)
(sleep 15)
(unit_stop_custom_animation 10_stubbs_1)
(effect_new_on_flag weapons\bazooka\rocket_explosion 10_pickup_1)
(sleep 2)
(effect_new_on_flag weapons\bazooka\rocket_explosion 10_pickup_1)
(effect_new_on_flag weapons\bazooka\rocket_explosion 10_pickup_2)
(sleep 90)
(object_destroy 10_pickup_2)
(object_create 10_pickup_3)
(object_create 10_pickup_smoke_1)
(object_teleport 10_stubbs_1 10_stubbs_5)
(object_set_permutation 10_stubbs_1 head ~head_hair)
(camera_set 10_13 0)
(sleep 60)
(custom_animation 10_stubbs_1 cinematics\animations\stubbs\b10\b10 b10_10_stubbs_5 false)
(object_create 10_hat_1)
(scenery_animation_start 10_hat_1 scenery\misc\hat\hat hatfall2)
(sleep 219)
(object_create_anew 10_hat_1)
(objects_attach 10_stubbs_1 melee 10_hat_1 stubbs)
(sleep 32)
(object_set_permutation 10_stubbs_1 head __base)
(object_destroy 10_hat_1)
(sleep 90)
(camera_set 10_14 0)
(camera_set 10_15 150)
(sleep 120)
(fade_out 0.00 0.00 0.00 30)
(sleep 30) b10_10_run
(object_activation_clear)
(object_destroy_containing 10_)
(sound_class_set_gain vehicle_engine 1.00 0)))

(script dormant void patton_speech
(begin
(sleep 131)
(sound_impulse_start sound\dialog\b10\20_stubbs_1 20_stubbs_1 1.00)))

(script static void b10_20_run
(begin
(fade_out 0.00 0.00 0.00 0)
(sound_looping_predict sound\cinematics\b10\20_foley_1) b10_20_run
(switch_bsp 1)
(object_activation_add_camera 20_01)
(object_teleport b10_20_run 20_hide_player)
(object_teleport b10_20_run 20_hide_player)
(object_teleport b10_20_run 20_hide_player)
(object_teleport b10_20_run 20_hide_player)
(object_create 20_stubbs_1)
(object_beautify 20_stubbs_1 true)
(object_create 20_zombie_1)
(object_beautify 20_zombie_1 true)
(object_create 20_zombie_2)
(object_beautify 20_zombie_2 true)
(object_create 20_zombie_3)
(object_beautify 20_zombie_3 true)
(object_create 20_zombie_4)
(object_beautify 20_zombie_4 true)
(object_create 20_barndoor_1)
(sound_class_set_gain ambient_nature 0.00 0)
(sleep 30)
(sound_looping_start sound\cinematics\b10\20_foley_1 none 1.00)
(print b10_20:  patton speech)
(unit_custom_animation_at_frame 20_stubbs_1 cinematics\animations\stubbs\b10\b10 b10_20_stubbs_1 false 82)
(wake patton_speech)
(camera_set 20_01 0)
(fade_in 0.00 0.00 0.00 0)
(sleep 30)
(camera_set 20_01b 90)
(sleep 165)
(camera_set 20_02 0)
(sleep 265)
(unit_custom_animation_at_frame 20_zombie_1 cinematics\animations\zombie\b10\b10 b10_20_zombie1_1 false 30)
(unit_custom_animation_at_frame 20_zombie_2 cinematics\animations\zombie\b10\b10 b10_20_zombie2_1 false 30)
(unit_custom_animation_at_frame 20_zombie_3 cinematics\animations\zombie\b10\b10 b10_20_zombie3_1 false 30)
(unit_custom_animation_at_frame 20_zombie_4 cinematics\animations\zombie\b10\b10 b10_20_zombie4_1 false 30)
(camera_set 20_03 0)
(sleep 120)
(camera_set 20_02 0)
(sleep
(-
(sound_impulse_time sound\dialog\b10\20_stubbs_1) 120.00))
(custom_animation 20_zombie_1 cinematics\animations\zombie\b10\b10 b10_20_zombie1_2 false)
(custom_animation 20_zombie_2 cinematics\animations\zombie\b10\b10 b10_20_zombie2_2 false)
(custom_animation 20_zombie_3 cinematics\animations\zombie\b10\b10 b10_20_zombie3_2 false)
(custom_animation 20_zombie_4 cinematics\animations\zombie\b10\b10 b10_20_zombie4_2 false)
(camera_set 20_03 0)
(sleep
(sound_impulse_time sound\dialog\b10\20_stubbs_1))
(fade_out 0.00 0.00 0.00 0) b10_20_run
(object_activation_clear)
(object_destroy_containing 20_)
(sound_class_set_gain ambient_nature 1.00 0)))

(script dormant void 30_match
(begin
(object_create_anew 30_match_1)
(objects_attach 30_otis_1 weapon 30_match_1 otisattachment)
(effect_new_on_object cinematics\effects\b10\match_light 30_match_1)
(sleep 256)
(objects_detach 30_otis_1 30_match_1)
(objects_attach 30_stubbs_1 melee 30_match_1 rightattachment)
(sleep 74)
(object_create 30_cigarette_1)
(objects_attach 30_stubbs_1 meleel 30_cigarette_1 leftattachment)
(sleep 90)
(object_create_anew 30_match_1)
(objects_attach 30_stubbs_1 melee 30_match_1 rightattachment)
(effect_new_on_object cinematics\effects\b10\match_light 30_match_1)
(sleep -1)
(sleep 128)
(objects_detach 30_stubbs_1 30_match_1)
(scenery_animation_start 30_match_1 cinematics\animations\match\b10\b10 b10_30_match_1)))

(script static void 30_flashback
(begin
(fade_out 1.00 1.00 1.00 10)
(sleep 10)
(object_destroy 30_stubbs_1)
(object_create 30_young_stubbs_1)
(object_beautify 30_young_stubbs_1 true)
(object_teleport 30_young_stubbs_1 30_young_stubbs_1)
(image_effect_set image_effects\silent_film)
(custom_animation 30_young_stubbs_1 cinematics\animations\youngstubbs\b10\b10 b10_30_youngstubbs_1 false)
(camera_set 30_06e 0)
(camera_set 30_06f
(unit_get_custom_animation_time 30_young_stubbs_1))
(fade_in 1.00 1.00 1.00 10)
(sleep
(-
(unit_get_custom_animation_time 30_young_stubbs_1) 10.00))
(sound_impulse_start sound\sfx\weapons\shotgun\firing none 1.00)
(fade_out 1.00 1.00 1.00 10)
(sleep 10)
(object_destroy 30_young_stubbs_1)
(object_create 30_otis_1)
(unit_set_weapon 30_otis_1 none)
(object_create 30_stubbs_1)
(object_set_permutation 30_stubbs_1 head ~head)
(custom_animation 30_otis_1 cinematics\animations\otis\b10\b10 b10_30_otis_4 false)
(custom_animation 30_stubbs_1 cinematics\animations\stubbs\b10\b10 b10_30_stubbs_3 false)
(wake 30_match)
(camera_set 30_06d 0)
(image_effect_set image_effects\technicolor)
(fade_in 1.00 1.00 1.00 10)
(sleep 10)))

(script dormant void 30_photo
(begin
(object_create 30_photo_1)
(scenery_animation_start 30_photo_1 scenery\b10_farm\photo\photo b10_photo1)
(sleep 380)
(object_create_anew 30_photo_1)
(objects_attach 30_stubbs_3 melee 30_photo_1 attachment)
(sleep 142)
(object_create_anew 30_photo_1)
(scenery_animation_start 30_photo_1 scenery\b10_farm\photo\photo b10_photo2)))

(script dormant void 30_stubbs_dialog
(begin
(sleep 471)
(sound_impulse_start sound\cinematics\b10\30_stubbs_1 30_stubbs_1 1.00)
(sleep
(sound_impulse_time sound\cinematics\b10\30_stubbs_1))
(sleep 319)
(sound_impulse_start sound\cinematics\b10\30_stubbs_2 30_stubbs_1 1.00)
(sleep
(sound_impulse_time sound\cinematics\b10\30_stubbs_2))
(sound_impulse_start sound\cinematics\b10\30_stubbs_3 30_stubbs_1 1.00)
(sleep
(sound_impulse_time sound\cinematics\b10\30_stubbs_3))
(sound_impulse_start sound\cinematics\b10\30_stubbs_4 30_stubbs_3 1.00)
(sleep
(sound_impulse_time sound\cinematics\b10\30_stubbs_4))
(sound_impulse_start sound\cinematics\b10\30_stubbs_5 30_stubbs_3 1.00)
(sleep
(sound_impulse_time sound\cinematics\b10\30_stubbs_5))
(sound_impulse_start sound\cinematics\b10\30_stubbs_6 30_stubbs_3 1.00)
(sleep
(sound_impulse_time sound\cinematics\b10\30_stubbs_6))))

(script static void b10_30_run
(begin
(if
(not show_cutscenes)
(sleep -1))
(fade_out 0.00 0.00 0.00 0)
(sound_looping_predict sound\cinematics\b10\30_foley_1) b10_30_run
(switch_bsp 1)
(object_activation_add_camera 30_01)
(object_teleport b10_30_run 30_hide_player)
(object_teleport b10_30_run 30_hide_player)
(object_teleport b10_30_run 30_hide_player)
(object_teleport b10_30_run 30_hide_player)
(object_create 30_otis_1)
(object_beautify 30_otis_1 true)
(unit_set_weapon 30_otis_1 none)
(unit_set_seat 30_otis_1 alert)
(object_create 30_match_1)
(objects_attach 30_otis_1 weapon 30_match_1 otisattachment)
(object_create 30_dynamite_1)
(objects_attach 30_otis_1 meleel 30_dynamite_1 otisdynamite)
(object_create 30_stubbs_1)
(object_beautify 30_stubbs_1 true)
(object_set_permutation 30_stubbs_1 head ~head)
(sleep 30)
(print b10_30:  otis and stubbs dance)
(recording_play 30_stubbs_1 30_stubbs_1)
(sleep 10)
(sound_looping_start sound\cinematics\b10\30_foley_1 none 1.00)
(wake 30_stubbs_dialog)
(camera_set 30_01 0)
(fade_in 0.00 0.00 0.00 0)
(effect_new_on_object cinematics\effects\b10\match_light 30_match_1)
(sleep 60)
(custom_animation 30_otis_1 cinematics\animations\otis\b10\b10 b10_30_otis_1 false)
(camera_set 30_02 0)
(sound_impulse_start sound\dialog\b10\30_otis_1 30_otis_1 1.00)
(sleep 30)
(recording_kill 30_stubbs_1)
(sleep 30)
(camera_set 30_03 0)
(sleep 10)
(sound_impulse_start sound\dialog\b10\30_otis_2 30_otis_1 1.00)
(camera_set 30_03c
(sound_impulse_time sound\dialog\b10\30_otis_2))
(sleep
(sound_impulse_time sound\dialog\b10\30_otis_2))
(custom_animation 30_otis_1 cinematics\animations\otis\b10\b10 b10_30_otis_2 false)
(custom_animation 30_stubbs_1 cinematics\animations\stubbs\b10\b10 b10_30_stubbs_2 false)
(camera_set 30_04 0)
(sleep 29)
(sound_impulse_start sound\dialog\b10\30_otis_3 30_otis_1 1.00)
(sleep 60)
(effect_new_on_object cinematics\effects\b10\match_light 30_match_1)
(sleep 60)
(camera_set 30_03d 0)
(sleep
(-
(sound_impulse_time sound\dialog\b10\30_otis_3) 30.00))
(camera_set 30_05 0)
(sleep 100)
(object_destroy 30_otis_1)
(camera_set 30_06c 0)
(sleep 10)
(sound_impulse_start sound\dialog\b10\30_otis_6 30_otis_1 1.00)
(sleep
(sound_impulse_time sound\dialog\b10\30_otis_6)) b10_30_run
(sound_impulse_start sound\dialog\b10\30_otis_4 30_otis_1 1.00)
(sleep 60)
(camera_set 30_06 0)
(sleep 90)
(camera_set 30_06b 0)
(sleep 90)
(camera_set 30_07 0)
(camera_set 30_07b 390)
(sleep 235)
(effect_new_on_object cinematics\effects\b10\blow_smoke 30_stubbs_1)
(sleep
(unit_get_custom_animation_time 30_otis_1))
(custom_animation 30_otis_1 cinematics\animations\otis\b10\b10 b10_30_otis_5 false)
(custom_animation 30_stubbs_1 cinematics\animations\stubbs\b10\b10 b10_30_stubbs_4 false)
(wake 30_match)
(camera_set 30_08 0)
(print stubbs tosses the match)
(sleep 150)
(camera_set 30_09 0)
(sleep 5)
(sound_impulse_start sound\dialog\b10\30_otis_5 30_otis_1 1.00)
(sleep
(sound_impulse_time sound\dialog\b10\30_otis_5))
(object_create 30_stubbs_3)
(object_beautify 30_stubbs_3 true)
(object_create 30_sheep_1)
(camera_set 30_11 0)
(camera_set 30_12 90)
(sleep 30)
(recording_play 30_stubbs_3 30_stubbs_3)
(sleep 90)
(recording_kill 30_stubbs_3)
(custom_animation 30_stubbs_3 cinematics\animations\stubbs\b10\b10 b10_30_stubbs_5 false)
(custom_animation 30_sheep_1 cinematics\animations\sheep\b10\b10 b10_30_sheep_5 false)
(camera_set 30_13 0)
(sleep 60)
(object_create_anew 30_sheep_1)
(custom_animation 30_stubbs_3 cinematics\animations\stubbs\b10\b10 b10_30_stubbs_6 false)
(wake 30_photo)
(camera_set 30_14 0)
(sleep 30)
(damage_object cinematics\effects\b10\house_explosion b10_30_run)
(if
(game_is_cooperative)
(damage_object cinematics\effects\b10\house_explosion b10_30_run))
(effect_new_on_flag cinematics\effects\b10\debris_falling 30_debris_1)
(object_create_containing 30_window_smoke)
(object_create_containing 30_ground_smoke)
(object_create 30_debris)
(sleep 30)
(effect_new_on_flag cinematics\effects\b10\debris_falling 30_debris_1)
(sleep 30)
(effect_new_on_flag cinematics\effects\b10\debris_falling 30_debris_1)
(sleep 60)
(camera_set 30_15 0)
(sleep 60)
(camera_set 30_15a 240)
(print stubbs catches photo)
(sleep 180)
(camera_set 30_16 0)
(print close in view of photo)
(sleep 90)
(camera_set 30_16a 0)
(print stubbs tosses the photo)
(sleep 90)
(camera_set 30_20 0)
(sleep 60)
(camera_set 30_21 15)
(sound_impulse_start sound\dialog\b10\30_sheep_1 30_sheep_1 1.00)
(sleep
(sound_impulse_time sound\dialog\b10\30_sheep_1))
(unit_custom_animation_at_frame 30_stubbs_3 cinematics\animations\stubbs\b10\b10 b10_30_stubbs_6 false 630)
(camera_set 30_22 15)
(print ding!)
(sleep 90)
(fade_out 0.00 0.00 0.00 15)
(sleep 45)
(custom_animation 30_stubbs_3 cinematics\animations\stubbs\b10\b10 b10_30_stubbs_ride false)
(custom_animation 30_sheep_1 cinematics\animations\sheep\b10\b10 b10_30_sheep_ride false)
(camera_set 30_23 0)
(fade_in 0.00 0.00 0.00 15)
(sleep 15)
(camera_set 30_23a 90)
(sleep 90)
(fade_out 0.00 0.00 0.00 45)
(sleep 45)
(fade_out 0.00 0.00 0.00 0) b10_30_run
(object_activation_clear)
(object_destroy_containing 30_)))

(script static void player_effect_boom
(begin
(player_effect_set_max_translation 0.00 0.00 0.00)
(player_effect_set_max_rotation 0.00 0.00 0.00)
(player_effect_set_max_rumble 0.40 1.00)
(player_effect_start
(real_random_range 0.70 0.90) 0.10)
(sound_impulse_start sound\sfx\cinematics\impulse\giant_footsteps none 1.00)))

(script static void b10_60_run
(begin
(fade_out 0.00 0.00 0.00 0)
(sound_class_set_gain music 0.00 30)
(sound_class_set_gain weapon_ready 0.00 0)
(sound_class_set_gain weapon_fire 0.00 0)
(sound_looping_predict sound\cinematics\b10\60_foley_1) b10_60_run
(switch_bsp 1)
(object_activation_add_camera 60_01)
(object_create 60_stubbs_1)
(object_beautify 60_stubbs_1 true)
(sleep 30)
(sound_looping_start sound\cinematics\b10\60_foley_1 none 1.00)
(print b10_60:  e3 ending)
(custom_animation 60_stubbs_1 cinematics\animations\stubbs\b10\b10 60_stubbs_1 false)
(camera_set 60_01 0)
(fade_in 0.00 0.00 0.00 30)
(sleep 30)
(object_create 60_militia_1)
(object_beautify 60_militia_1 true)
(sleep 60)
(sleep 10)
(sleep 15)
(sleep 10)
(sleep 15)
(sleep 10)
(sleep 15)
(recording_play 60_militia_1 60_militia_2)
(camera_set 60_03 45)
(sleep 60)
(recording_kill 60_militia_1)
(custom_animation 60_militia_1 cinematics\animations\militia_large\b10\b10 60_militia_1 false)
(camera_set 60_04 0)
(sleep 45)
(camera_set 60_05 50)
(sleep 35)
(sound_impulse_start sound\dialog\b10\60_militia_1 60_militia_1 0.00)
(sleep 65)
(custom_animation 60_stubbs_1 cinematics\animations\stubbs\b10\b10 60_stubbs_2 false)
(camera_set 60_06 0)
(sleep 70)
(custom_animation 60_militia_1 characters\militia_large\militia_large stand chainsaw berzerk true)
(sleep 20)
(camera_set 60_07 0)
(sleep 60)
(recording_play 60_militia_1 60_militia_1)
(object_destroy 60_stubbs_1)
(object_create 60_stubbs_2)
(object_beautify 60_stubbs_2 true)
(custom_animation 60_stubbs_2 cinematics\animations\stubbs\b10\b10 60_stubbs_3 false)
(image_effect_set image_effects\maniac)
(camera_set_relative 60_08 0 60_militia_1)
(sleep 70)
(fade_out 0.00 0.00 0.00 0) b10_60_run
(object_activation_clear)
(object_destroy_containing 60_)
(sound_class_set_gain music 1.00 30)
(sound_class_set_gain weapon_ready 1.00 30)
(sound_class_set_gain weapon_fire 1.00 30)))

(script static void b10_60
(begin
(if
(= show_cutscenes true) b10_60)))

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
(= test 60) test)))

(script static void preview
(begin preview preview preview preview))

(script static void next_cutscene
(begin
(map_name levels\b30_dam\b30_dam_cutscene)))

(script static void unlockable_pickup
(begin
(damage_object equipment\hippo\hippo_pickup unlockable_pickup)
(if
(game_is_cooperative)
(damage_object equipment\hippo\hippo_pickup unlockable_pickup))))

(script static void stop_commentary
(begin
(sound_looping_stop sound\commentary\b10_farm\b10_farm_01)
(sound_looping_stop sound\commentary\b10_farm\b10_farm_02)
(sound_looping_stop sound\commentary\b10_farm\b10_farm_03)
(sound_looping_stop sound\commentary\b10_farm\b10_farm_04)
(sound_looping_stop sound\commentary\b10_farm\b10_farm_05)
(sound_looping_stop sound\commentary\b10_farm\b10_farm_06)
(sound_looping_stop sound\commentary\b10_farm\b10_farm_07)
(sound_looping_stop sound\commentary\b10_farm\b10_farm_08)
(sound_looping_stop sound\commentary\b10_farm\b10_farm_09)
(sound_looping_stop sound\commentary\b10_farm\b10_farm_10)))

(script dormant void unlock_comment_1
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_1) 0.00) 7) unlock_comment_1
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_1
(sound_looping_start sound\commentary\b10_farm\b10_farm_01 none 1.00)
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
(sound_looping_start sound\commentary\b10_farm\b10_farm_02 none 1.00)
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
(sound_looping_start sound\commentary\b10_farm\b10_farm_03 none 1.00)
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
(sound_looping_start sound\commentary\b10_farm\b10_farm_04 none 1.00)
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
(sound_looping_start sound\commentary\b10_farm\b10_farm_05 none 1.00)
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
(sound_looping_start sound\commentary\b10_farm\b10_farm_06 none 1.00)
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
(sound_looping_start sound\commentary\b10_farm\b10_farm_07 none 1.00)
(sleep
(* 30.00 15.00))
(sleep 60)))

(script dormant void unlock_comment_8
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_8) 0.00) 7) unlock_comment_8
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_8
(sound_looping_start sound\commentary\b10_farm\b10_farm_08 none 1.00)
(sleep
(* 30.00 15.00))
(sleep 60)))

(script dormant void unlock_comment_9
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_9) 0.00) 7) unlock_comment_9
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_9
(sound_looping_start sound\commentary\b10_farm\b10_farm_09 none 1.00)
(sleep
(* 30.00 15.00))
(sleep 60)))

(script dormant void unlock_comment_10
(begin
(sleep_until
(<
(object_get_health unlockable_hippo_comment_10) 0.00) 7) unlock_comment_10
(sleep 90)
(cinematic_set_title unlockable_comment) unlock_comment_10
(sound_looping_start sound\commentary\b10_farm\b10_farm_10 none 1.00)
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
(wake unlock_comment_7)
(wake unlock_comment_8)
(wake unlock_comment_9)
(wake unlock_comment_10)))))