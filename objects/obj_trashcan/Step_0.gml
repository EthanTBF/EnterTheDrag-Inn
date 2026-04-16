if (distance_to_object(obj_player) < 40) {
    if (keyboard_check_pressed(ord("E"))) {
        // Clear any item the player is holding
        if (obj_player.holding_item != "none") {
            obj_player.holding_item = "none";
            show_debug_message("Item trashed.");
            
            // Optional: Add a 'trash' sound effect here
        }
    }
}