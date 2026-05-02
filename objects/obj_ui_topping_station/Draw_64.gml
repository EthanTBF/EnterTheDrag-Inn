// Dim background
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);
draw_set_color(c_white);

// Draw popup
draw_sprite(popup_sprite, 0, popup_x, popup_y);

// Draw topping sprites in the boxes
draw_sprite_ext(bacon_sprite, 0, popup_x + bacon_slot_x, popup_y + bacon_slot_y, 0.8, 0.8, 0, c_white, 1);
draw_sprite_ext(bun_sprite, 0, popup_x + bun_slot_x, popup_y + bun_slot_y, 0.8, 0.8, 0, c_white, 1);

// Draw meal preview / drop target
if (obj_player.holding_item == "patty_meal") {
    draw_sprite_ext(spr_patty_meal, 0, meal_x, meal_y, 1.2, 1.2, 0, c_white, 1);
}
else if (obj_player.holding_item == "patty_meal_with_topping") {
    draw_sprite_ext(spr_patty_meal_with_topping, 0, meal_x, meal_y, 1.2, 1.2, 0, c_white, 1);
}
else {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(meal_x, meal_y, "Need cooked patty meal first");
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}

// Draw dragged topping
if (is_dragging_topping && drag_topping_sprite != noone) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    draw_sprite_ext(drag_topping_sprite, 0, mx, my, 0.9, 0.9, 0, c_white, 0.8);
}

// Feedback message
if (message_timer > 0) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);

    draw_text(ui_x, popup_y + popup_h - 55, message);

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}