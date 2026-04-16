// Check if player is close enough to the counter
if (distance_to_object(obj_player) < 40) {
    if (keyboard_check_pressed(ord("E"))) {
        
        // Only accept the item if it's a finished meal
        if (obj_player.holding_item == "meal") {
            obj_player.holding_item = "none"
            
            // Success feedback
            show_debug_message("Meal Delivered!")
            
            // We can add score or gold here later
        } else {
            // Optional: If the player tries to hand over just a plate, raw meat, or incorrect meal
            show_debug_message("The customers only want finished meals!")
        }
    }
}