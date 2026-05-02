if (distance_to_object(obj_player) < 40) {
    if (keyboard_check_pressed(ord("E"))) {
        
        // Pick up
        if (obj_player.holding_item == "none") {
            obj_player.holding_item = "plate";
            show_debug_message("Picked up plate");
			audio_play_sound(Blip6, 130, false);
        } 
        
        // Put back
        else if (obj_player.holding_item == "plate") {
            obj_player.holding_item = "none";
            show_debug_message("Put plate back");
			audio_play_sound(Blip6, 130, false);
        }
    }
}