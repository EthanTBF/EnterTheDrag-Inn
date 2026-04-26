//Draw the menu background
draw_sprite_ext(sprite_index, image_index, x, y, (width / sprite_width), (height / sprite_height), 0, c_white, 1);


// Dynamically get width and height of menu
var new_w = 1;
for (var i = 0; i < op_length; i++) {
	var _op_w = string_width(option[menu_level, i]);
	new_w = max(new_w, _op_w);
}
if (menu_level == 2) {
		if not global.unlocked_level_1 or not global.unlocked_level_2 {
			new_w = new_w + string_width("(LOCKED) ");
		}
	}
	

width = new_w + op_border*2;
height = op_border*2 + string_height(option[0,0]) + (op_length-1)*op_space;

// Center Menu
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2;

// Draw the options
draw_set_font(fnt_ui);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
for (var i = 0; i < op_length; i++) {
	var _c = c_white;	
	if pos == i {_c = c_yellow};
	
	var text = option[menu_level, i];
	
	if (menu_level == 2 and i == 1) {
		if not global.unlocked_level_1 {
			text = "(LOCKED) " + text;
		}
	}
	if (menu_level == 2 and i == 2) {
		if not global.unlocked_level_2 {
			text = "(LOCKED) " + text;
		}
	}
	
	
	draw_text_color(x+op_border, y+op_border + (op_space * i), text, _c, _c, _c, _c, 1);	
}

