if (distance_to_object(obj_player) < 80 && keyboard_check_pressed(ord("E"))) {
    if (obj_player.holding_item != "none") {
        obj_player.holding_item = "none"
        obj_player.holding_sprite = noone
        show_debug_message("Item trashed.")
    }
}
