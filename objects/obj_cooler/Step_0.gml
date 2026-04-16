if (distance_to_object(obj_player) < 32) {
    var hearth = instance_find(obj_hearth, 0);
    
    if (hearth != noone && hearth.is_active) {
        if (keyboard_check_pressed(ord("E"))) {
            // Pick up meat
            if (obj_player.holding_item == "none") {
                obj_player.holding_item = "meat";
            } 
            // Put meat back
            else if (obj_player.holding_item == "meat") {
                obj_player.holding_item = "none";
            }
        }
    }
}