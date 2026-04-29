// Save state
var _old_font = draw_get_font();
var _old_halign = draw_get_halign();

// NOW change draw settings
draw_set_font(fnt_cast);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

// Dynamically get width
var new_w = 0;
for (var i = 0; i < op_length; i++) {
    var _op_w = string_width(option[menu_level, i]);
    new_w = max(new_w, _op_w);
}

// Calculate dimensions
width  = new_w + op_border * 2;
height = op_border * 2 + (string_height(option[menu_level, 0]) * op_length) + ((op_length - 1) * op_space);

// Center Menu
x = round(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - width / 2);
y = round(camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2 - height / 2);

// NOW draw background with correct size
draw_sprite_ext(sprite_index, image_index, x, y, (width / sprite_width), height / sprite_height, 0, c_white, 1);// Save previous draw state

// Set your UI draw state
draw_set_font(fnt_cast);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

// Draw options
for (var i = 0; i < op_length; i++) {
    var _c = c_white;
    if (pos == i) _c = c_yellow;

    var text = option[menu_level, i];

    draw_text_color(
        x + op_border,
        y + op_border + (i * (string_height(text) + op_space)),
        text,
        _c, _c, _c, _c,
        1
    );
}


// Restore state
draw_set_font(_old_font);
draw_set_halign(_old_halign);