// Stop player while UI is open
obj_player.can_move = false;
obj_player.speed = 0;

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if (mouse_check_button_pressed(mb_left)) {
    // Toggle bacon
    if (point_distance(mx, my, ui_x - 100, ui_y) < 60) {
        has_bacon = !has_bacon;
    }
    // Toggle bun
    if (point_distance(mx, my, ui_x + 100, ui_y) < 60) {
        has_bun = !has_bun;
    }
}

// Exit — apply toppings to holding_item name and close
if (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_escape)) {
    // Update the held item string to reflect toppings
    var result = "meal";
    if (has_bacon && has_bun) {
        result = "meal_bacon_bun";
    } else if (has_bacon) {
        result = "meal_bacon";
    } else if (has_bun) {
        result = "meal_bun";
    }
    obj_player.holding_item = result;

    obj_player.can_move = true;
    global.is_interacting = false;
    instance_destroy();
}