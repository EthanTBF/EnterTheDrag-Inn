pause_key = keyboard_check_pressed(vk_escape);
if pause_key {
	if global.game_paused {
		global.game_paused = false;
		obj_player.can_move = true;
		
		
		visible = false;
	}
	else {
		// Pause	
		global.game_paused = true;
		obj_player.can_move = false;
		visible = true;
		obj_player.vspeed = 0;
		obj_player.hspeed = 0;
	}
}

if global.game_paused {
	up_key = keyboard_check_pressed(vk_up);
	down_key = keyboard_check_pressed(vk_down);
	accept_key = keyboard_check_pressed(vk_enter);

	
	// Store number of options in current menu
	op_length = array_length(option[menu_level])

	if up_key {
		audio_play_sound(Blip25, 1, false);
	}

	if down_key {
		audio_play_sound(Blip24, 1, false);
	}

	pos += down_key - up_key;

	if pos >= op_length {pos = 0}
	if pos < 0 {pos = op_length-1}

	// Using the options
	if accept_key{
		var play_default_sound = true;
		var _sml = menu_level;
	
		switch(menu_level) {
			// Pause Menu
			case 0:
				switch(pos) {
					// Continue
					case 0: 
						// Unpause
						global.game_paused = false;
						obj_player.can_move = true
						visible = false;
						break;
					// Options
					case 1: menu_level = 1; break;
					// Main Menu
					case 2: room_goto(rm_main_menu); break;
				}
				break;
			// Options Menu
			case 1:
				switch(pos) {
					// Fullscreen
					case 0: 
						if window_get_fullscreen()
						{
						    window_set_fullscreen(false);
						}
						else
						{
						    window_set_fullscreen(true);
						}
					break;
					// Volume Mute
					case 1: 
						global.muted = !global.muted;
						var target_vol = global.muted ? 0 : 0.5;
						audio_group_set_gain(audiogroup_default, target_vol, 0);
					break;
					// Back
					case 2: 
						menu_level = 0; 
						break;
				
				}
				break;
			}
	
		if play_default_sound {
			var rnd = random_range(0, array_length(default_ui_sounds)-1);
			audio_play_sound(default_ui_sounds[rnd], 1, false);
		
		}
	
	
		if _sml != menu_level {pos = 0}
	
		// Correct option length
		op_length = array_length(option[menu_level])

	}
}