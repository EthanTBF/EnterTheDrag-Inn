x = device_mouse_x_to_gui(0);
y = device_mouse_y_to_gui(0);

if (mouse_check_button_released(mb_left)) {

    if (obj_player.holding_item == "none") {
        obj_player.holding_item = item_name;
        obj_player.holding_sprite = item_sprite;
    }

    global.game_paused = false;
    global.is_interacting = false;
    obj_player.can_move = true;

    if (instance_exists(obj_ui_cooler_station)) {
        with (obj_ui_cooler_station) {
            instance_destroy();
        }
    }

    instance_destroy();
}