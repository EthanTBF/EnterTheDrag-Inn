var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Close topping UI
if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("E"))) {
    global.game_paused = false;
    global.is_interacting = false;
    obj_player.can_move = true;
    instance_destroy();
    exit;
}

// Message countdown
if (message_timer > 0) {
    message_timer--;
}

// Only cooked meals can receive toppings
var can_add_toppings = (
    obj_player.holding_item == "meal" ||
    obj_player.holding_item == "meal_bacon" ||
    obj_player.holding_item == "meal_bun"
);

// Start dragging topping
if (mouse_check_button_pressed(mb_left) && !is_dragging_topping) {

    if (!can_add_toppings) {
        message = "Need cooked meat first!";
        message_timer = 90;
    }
    else {
        // Bacon slot
        if (point_in_rectangle(
            mx, my,
            popup_x + bacon_slot_x - slot_w / 2,
            popup_y + bacon_slot_y - slot_h / 2,
            popup_x + bacon_slot_x + slot_w / 2,
            popup_y + bacon_slot_y + slot_h / 2
        )) {
            if (obj_player.holding_item == "meal_bacon") {
                message = "Already has bacon!";
                message_timer = 90;
            }
            else {
                is_dragging_topping = true;
                drag_topping_name = bacon_name;
                drag_topping_sprite = bacon_sprite;
            }
        }

        // Bun slot
        if (point_in_rectangle(
            mx, my,
            popup_x + bun_slot_x - slot_w / 2,
            popup_y + bun_slot_y - slot_h / 2,
            popup_x + bun_slot_x + slot_w / 2,
            popup_y + bun_slot_y + slot_h / 2
        )) {
            if (obj_player.holding_item == "meal_bun") {
                message = "Already has bun!";
                message_timer = 90;
            }
            else {
                is_dragging_topping = true;
                drag_topping_name = bun_name;
                drag_topping_sprite = bun_sprite;
            }
        }
    }
}

// Release topping
if (mouse_check_button_released(mb_left) && is_dragging_topping) {

    if (point_distance(mx, my, meal_x, meal_y) < meal_drop_radius) {

        if (drag_topping_name == "bacon") {
            if (obj_player.holding_item == "meal") {
                obj_player.holding_item = "meal_bacon";
            }
            else if (obj_player.holding_item == "meal_bun") {
                obj_player.holding_item = "meal_bacon_bun";
            }
        }

        if (drag_topping_name == "bun") {
            if (obj_player.holding_item == "meal") {
                obj_player.holding_item = "meal_bun";
            }
            else if (obj_player.holding_item == "meal_bacon") {
                obj_player.holding_item = "meal_bacon_bun";
            }
        }

        obj_player.holding_sprite = noone;

        message = "Topping added!";
        message_timer = 60;
    }
    else {
        message = "Drop onto meal!";
        message_timer = 60;
    }

    is_dragging_topping = false;
    drag_topping_name = "none";
    drag_topping_sprite = noone;
}