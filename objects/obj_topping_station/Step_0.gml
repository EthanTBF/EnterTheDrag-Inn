// Do not open topping station while another UI is already open
if (global.is_interacting) {
    exit;
}

// Check if there is currently a burger order active
var burger_order_active = false;

if (instance_exists(obj_order_manager)) {

    var om = instance_find(obj_order_manager, 0);

    for (var i = 0; i < ds_list_size(om.order_list); i++) {
        if (om.order_list[| i] == order_type.BURGER) {
            burger_order_active = true;
            break;
        }
    }
}

// Player interaction
if (distance_to_object(obj_player) < 40) {

    if (keyboard_check_pressed(ord("E"))) {

        // Station is locked unless a burger order exists
        if (!burger_order_active) {
            show_debug_message("Topping station locked: no burger order active.");
            audio_play_sound(Failure, 130, false);
            exit;
        }

        // Open topping UI
        if (!instance_exists(obj_ui_topping_station)) {

            global.is_interacting = true;
            global.game_paused = true;

            obj_player.can_move = false;
            obj_player.speed = 0;
            obj_player.hspeed = 0;
            obj_player.vspeed = 0;

            instance_create_depth(0, 0, -10000, obj_ui_topping_station);

            show_debug_message("Opened topping station UI.");
            audio_play_sound(Blip6, 130, false);
        }
    }
}