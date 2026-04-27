// Petting dragon bar
if (obj_dragon.pet_hold_timer > 0) {
    var px = obj_player.x
    var py = obj_player.y - 100 // Position above head
    
    var pc = (obj_dragon.pet_hold_timer / obj_dragon.pet_hold_max) * 100
    draw_healthbar(px - 30, py, px + 30, py + 10, pc, c_black, c_white, c_lime, 0, true, true)
}

var bar_width = 200;
var bar_height = 20;
var bar_spacing = 30;
var start_x = 30;
var start_y = 100;

// Dragon Happiness Bar
draw_text(start_x, start_y - 25, "DRAGON HAPPINESS");
draw_healthbar(start_x, 
				start_y, 
				start_x + bar_width, 
				start_y + bar_height,
				obj_dragon.drg_happiness,
				c_black, 
				c_maroon, 
				c_lime, 
				0, 
				true,
				true);

// Dragon Boredom Bar
draw_text(start_x, start_y + bar_spacing - 25, "DRAGON BOREDOM");
draw_healthbar(start_x,
				start_y + bar_spacing,
				start_x + bar_width,
				start_y + bar_height + bar_spacing,
				obj_dragon.drg_boredom,
				c_black,
				c_maroon,
				c_lime,
				0,
				true,
				true);

// Dragon Hunger Bar
draw_text(start_x, start_y + (2 * bar_spacing) - 25, "DRAGON HUNGER");
draw_healthbar(start_x,
				start_y + 2 * bar_spacing,
				start_x + bar_width,
				start_y + bar_height + 2 * bar_spacing,
				obj_dragon.drg_hunger,
				c_black,
				c_maroon,
				c_lime,
				0,
				true,
				true);

// Dragon Tiredess Bar
draw_text(start_x, start_y + (3 * bar_spacing) - 25, "DRAGON TIREDESS");
draw_healthbar(start_x,
start_y + 3 * bar_spacing,
				start_x + bar_width,
				start_y + bar_height + 3 * bar_spacing,
				obj_dragon.drg_tiredness,
				c_black,
				c_maroon,
				c_lime,
				0,
				true,
				true)

// Draw "X" strikes AFTER health bars
draw_set_font(fnt_ui);
draw_set_halign(fa_left);

var strike_x_start = 30;
var strike_y = 10; 
var scale = 2;

for (var i = 0; i < max_strikes; i++) {
    // Determine color based on current strikes
    var col = (i < current_strikes) ? c_red : c_dkgray
	draw_text_transformed_color(strike_x_start + (i * 80), strike_y, "X", 1, 1, 0, col, col, col, col, 1)
}

// Reset Draw State
draw_set_font(-1)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

// Draw score
draw_text(x, y, "Score: " + string(global.total_score));