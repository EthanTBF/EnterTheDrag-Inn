up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_enter);

// Store number of options in current menu
op_length = array_length(option[menu_level])

pos += down_key - up_key;

if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length-1};


// Using the options
if accept_key{
	
	var _sml = menu_level;
	
	switch(menu_level) {
		// Main Menu
		case 0:
			switch(pos) {
				// Start
				case 0: menu_level = 2 break;
				// Options
				case 1: menu_level = 1; break;
				// Credits
				case 2: menu_level = 3; break;
				// Quit Game
				case 3: game_end(); break;
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
					var target_vol = global.muted ? 0 : 1;
					audio_group_set_gain(audiogroup_default, target_vol, 0);
				break;
				// Back
				case 2: 
					menu_level = 0; 
					break;
				
			}
			break;
		// Level Select
		case 2:
			switch(pos) {
				// Tutorial
				case 0: room_goto(rm_tutorial_level) break;
				// Level 1
				case 1: 
					if not global.unlocked_level_1 {
						// do nothing its locked
						show_debug_message("Level one is locked");
					}
					else {
						//room_goto(rm_level_1);
						show_debug_message("Go to level 1");
					}
				break;
				// Level 2
				case 2: 
					if not global.unlocked_level_2 {
						// do nothing its locked
						show_debug_message("Level two is locked");
					}
					else {
						//room_goto(rm_level_2);
						show_debug_message("Go to level 2");
					}
				break;
				// Back
				case 3: 
					menu_level = 0; 
					break;
				
			}
			break;
		// Credits
		case 3:
			switch(pos) {
				// Back
				case 6: 
					menu_level = 0; 
					break;
				
			}
			break;
	}

	if _sml != menu_level {pos = 0}
	
	// Correct option length
	op_length = array_length(option[menu_level])
}