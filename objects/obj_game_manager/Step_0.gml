if (room == rm_game_over) exit;

if (!global.game_paused) {
    if (!game_over) {
        // Timer logic
        if (day_time > 0) {
            day_time -= 1/60;
        } else {
            day_time = 0;
            game_over = true;
            audio_stop_all();
            room_goto(rm_game_over);
        }
        // Tutorial skip
        if (room == rm_tutorial_level) {
            if (keyboard_check(vk_control) && keyboard_check_pressed(vk_space)) {
                global.current_level = 2;
                global.customers_served = 0;
                day_time = day_time_max;
                room_goto(rm_lunch_rush);
                show_debug_message("Moved to Lunch Rush");
            }
        }
        // Testing - advance to next room
        if (keyboard_check_pressed(vk_space)) {
            if (room == rm_tutorial_level) {
                room_goto(rm_lunch_rush);
                show_debug_message("Skipped to Lunch Rush");
            } else if (room == rm_lunch_rush) {
                room_goto(rm_dinner_rush);
                show_debug_message("Skipped to Dinner Rush");
            } else if (room == rm_dinner_rush) {
                audio_stop_all();
                room_goto(rm_game_over);
                show_debug_message("Skipped to Game Over");
            }
        }
        // Level advancement logic
        if (room != rm_main_menu) {
            if (global.customers_served >= global.customers_to_advance) {
                global.current_level += 1;
                global.customers_served = 0;
                day_time = day_time_max;
                if (global.current_level == 2) {
                    room_goto(rm_lunch_rush);
                    show_debug_message("Moving to Lunch Rush");
                } else if (global.current_level == 3) {
                    room_goto(rm_dinner_rush);
                    show_debug_message("Moving to Dinner Rush");
                } else {
                    audio_stop_all();
                    room_goto(rm_game_over);
                }
            }
        }
    }
}