// Check if player is close enough to the counter
if (distance_to_object(obj_player) < 40) {

    if (keyboard_check_pressed(ord("E"))) {

        // Make sure the player is holding a finished meal
        if (
            obj_player.holding_item == "chicken_meal" ||
            obj_player.holding_item == "patty_meal" ||
            obj_player.holding_item == "patty_meal_with_topping" ||
            obj_player.holding_item == "steak_meal" ||
            obj_player.holding_item == "meal_burnt"
        ) {

            // Make sure there is an active order
            if (instance_exists(obj_order_manager) && ds_list_size(obj_order_manager.order_list) > 0) {

                var current_order = obj_order_manager.order_list[| 0];
                var correct_meal = false;

                // Chicken order requires chicken meal
                if (current_order == order_type.CHICKEN) {
                    if (obj_player.holding_item == "chicken_meal") {
                        correct_meal = true;
                    }
                }

                // Burger order requires topped patty meal
                else if (current_order == order_type.BURGER) {
                    if (obj_player.holding_item == "patty_meal_with_topping") {
                        correct_meal = true;
                    }
                }

                // Correct delivery
                if (correct_meal) {

                    ds_list_delete(obj_order_manager.order_list, 0);

                    obj_player.holding_item = "none";
                    obj_player.holding_sprite = noone;

                    global.total_score += 100;
                    global.customers_served += 1;

                    show_debug_message("Correct meal delivered!");

                    if (asset_get_index("Success_1_") != -1) {
                        audio_play_sound(Success_1_, 130, false);
                    }
                }

                // Wrong delivery
                else {

                    show_debug_message("Wrong meal for this order!");

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
            show_debug_message("The customers only want finished meals!");
        }
    }
}