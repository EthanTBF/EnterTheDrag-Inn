var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Close menu
if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("E"))) {
    global.game_paused = false;
    global.is_interacting = false;
    obj_player.can_move = true;

    if (instance_exists(obj_drag_food)) {
        with (obj_drag_food) {
            instance_destroy();
        }
    }

    instance_destroy();
}

// Only detect clicks if not already dragging food
if (mouse_check_button_pressed(mb_left) && !instance_exists(obj_drag_food) && obj_player.holding_item == "none") { {

    // Slot 1: chicken
    if (point_in_rectangle(
        mx, my,
        popup_x + slot1_x - slot_w / 2,
        popup_y + slot1_y - slot_h / 2,
        popup_x + slot1_x + slot_w / 2,
        popup_y + slot1_y + slot_h / 2
    )) {
        var drag = instance_create_depth(0, 0, -11000, obj_drag_food);
        drag.item_name = food1_name;
        drag.item_sprite = food1_sprite;
    }

    // Slot 2: patty
    if (point_in_rectangle(
        mx, my,
        popup_x + slot2_x - slot_w / 2,
        popup_y + slot2_y - slot_h / 2,
        popup_x + slot2_x + slot_w / 2,
        popup_y + slot2_y + slot_h / 2
    )) {
        var drag = instance_create_depth(0, 0, -11000, obj_drag_food);
        drag.item_name = food2_name;
        drag.item_sprite = food2_sprite;
    }

    // Slot 3: steak
    if (point_in_rectangle(
        mx, my,
        popup_x + slot3_x - slot_w / 2,
        popup_y + slot3_y - slot_h / 2,
        popup_x + slot3_x + slot_w / 2,
        popup_y + slot3_y + slot_h / 2
    )) {
        var drag = instance_create_depth(0, 0, -11000, obj_drag_food);
        drag.item_name = food3_name;
        drag.item_sprite = food3_sprite;
    }
}
}