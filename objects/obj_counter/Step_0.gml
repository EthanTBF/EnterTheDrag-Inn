// Check if player is close enough to the counter
if (distance_to_object(obj_player) < 40) {

    if (keyboard_check_pressed(ord("E"))) {

        var held = obj_player.holding_item;

        // Make sure the player is holding a finished meal
        var is_finished_meal = (
            held == "chicken_meal" ||
            held == "patty_meal_with_topping" ||
            held == "steak_meal" ||
            held == "meal_burnt"
        );

        if (is_finished_meal) {

            // Make sure there is an order manager
            if (instance_exists(obj_order_manager)) {

                var om = instance_find(obj_order_manager, 0);

                // Make sure there is an active order
                if (ds_list_size(om.order_list) > 0) {

                    var matched_index = -1;

                    // Search every active ticket, not just the oldest one
                    for (var i = 0; i < ds_list_size(om.order_list); i++) {

                        var current_order = om.order_list[| i];

                        // Chicken order requires chicken meal
                        if (current_order == order_type.CHICKEN && held == "chicken_meal") {
                            matched_index = i;
                            break;
                        }

                        // Burger order requires topped patty meal
                        if (current_order == order_type.BURGER && held == "patty_meal_with_topping") {
                            matched_index = i;
                            break;
                        }

                        // Steak meal currently has no ticket type in your order_type enum,
                        // so it cannot be delivered unless you add order_type.STEAK later.
                    }

                    // Correct delivery
                    if (matched_index != -1) {

                        // Remove the matching ticket
                        ds_list_delete(om.order_list, matched_index);

                        // Clear player's hand
                        obj_player.holding_item = "none";
                        obj_player.holding_sprite = noone;

                        // Reward player
                        global.total_score += 100;
                        global.customers_served += 1;

                        show_debug_message("Correct meal delivered!");

                        if (asset_get_index("Success_1_") != -1) {
                            audio_play_sound(Success_1_, 130, false);
                        }
                    }

                    // No matching ticket found
                    else {

                        show_debug_message("Wrong meal for active orders!");

                        if (asset_get_index("Failure") != -1) {
                            audio_play_sound(Failure, 130, false);
                        }

                        if (variable_global_exists("current_strikes")) {
                            global.current_strikes += 1;
                        }
                        else if (instance_exists(obj_game_manager)) {
                            obj_game_manager.current_strikes += 1;
                        }
                    }
                }
                else {
                    show_debug_message("No one is waiting for an order right now!");
                }
            }
            else {
                show_debug_message("No order manager found!");
            }
        }
        else {
            show_debug_message("The customers only want finished meals!");
        }
    }
}