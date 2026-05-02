if (distance_to_object(obj_player) < 40) {
    if (keyboard_check_pressed(ord("E"))) {
        
        // Pick up plate
        if (obj_player.holding_item == "none") {
            obj_player.holding_item = "plate";
            obj_player.holding_sprite = spr_plate;

            show_debug_message("Picked up plate");
            audio_play_sound(Blip6, 130, false);
        } 
        
        // Put plate back
        else if (obj_player.holding_item == "plate") {
            obj_player.holding_item = "none";
            obj_player.holding_sprite = noone;

            show_debug_message("Put plate back");
            audio_play_sound(Blip6, 130, false);
        }
    }
}