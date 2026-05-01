// Dim background
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);
draw_set_color(c_white);

// Draw popup background
draw_sprite(popup_sprite, 0, popup_x, popup_y);

// Draw meat sprites centered inside the slots
draw_sprite_ext(food1_sprite, 0, popup_x + slot1_x, popup_y + slot1_y, 0.8, 0.8, 0, c_white, 1);
draw_sprite_ext(food2_sprite, 0, popup_x + slot2_x, popup_y + slot2_y, 0.8, 0.8, 0, c_white, 1);
draw_sprite_ext(food3_sprite, 0, popup_x + slot3_x, popup_y + slot3_y, 0.8, 0.8, 0, c_white, 1);