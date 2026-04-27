// Check if player is close enough to the counter
if (distance_to_object(obj_player) < 40) {
    if (keyboard_check_pressed(ord("E"))) {
        
        // Only accept the item if it's a finished meal
        if (obj_player.holding_item == "meal") {
            
            // Check if there is an active order to fulfill
            if (ds_list_size(obj_order_manager.order_list) > 0) {
                
                // 1. Remove the oldest order from the ticket queue
                ds_list_delete(obj_order_manager.order_list, 0)
                
                // 2. Reset player's hand
                obj_player.holding_item = "none"
                
                // Success feedback
                show_debug_message("Meal Delivered!")
                
                // Add to the score
                global.total_score += 100
				global.customers_served += 1;
                
            } else {
                // If the player tries to deliver a meal but no one ordered one
                show_debug_message("No one is waiting for an order right now!")
            }
            
        } else {
            // Optional: If the player tries to hand over just a plate, raw meat, or incorrect meal
            show_debug_message("The customers only want finished meals!")
        }
    }
}