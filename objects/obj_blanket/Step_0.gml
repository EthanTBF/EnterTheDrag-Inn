if (distance_to_object(obj_player) < 40) {
    if (keyboard_check_pressed(ord("E"))) {
        // Pick up the blanket
        if (obj_player.holding_item == "none") {
            obj_player.holding_item = "blanket";
        } 
        // Put it back if needed
        else if (obj_player.holding_item == "blanket") {
            obj_player.holding_item = "none";
        }
    }
}