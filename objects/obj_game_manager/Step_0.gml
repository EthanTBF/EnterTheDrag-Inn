if not global.game_paused{
	if (!game_over) {
	    // Timer logic
	    if (day_time > 0) {
	        day_time -= 1/60;
	    } else {
	        day_time = 0;
	        game_over = true;
	        room_goto(rm_game_over);
	    }

	    // Room-specific logic (e.g., tutorial)
	    if (room == rm_tutorial_level) {
	        if (keyboard_check_pressed(vk_space)) {
	            room_goto(rm_lunch_rush);
	            global.customers_served = 0;
	            day_time = day_time_max;
	            show_debug_message("Moved to Lunch Rush");
	        }
	    }

	    // Level advancement logic (runs in all game rooms)
	    if (room != rm_main_menu) {
	        if (global.customers_served >= global.customers_to_advance) {
	            global.current_level += 1;
	            global.customers_served = 0;

	            switch (global.current_level) {
	                case 1:
	                    room_goto(rm_lunch_rush);
	                    show_debug_message("Moving to Lunch Rush");
	                    break;
	                case 2:
	                    room_goto(rm_dinner_rush);
	                    show_debug_message("Moving to Dinner Rush");
	                    break;
	                default:
	                    room_goto(rm_win);
	                    show_debug_message("Game is over - You win!");
	                    break;
	            }
	        }
	    }
	}
}