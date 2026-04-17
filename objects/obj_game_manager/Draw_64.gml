// Strikes
draw_set_alpha(1)
draw_set_font(fnt_ui)
var strike_x_start = 30
var strike_y = 80 // Lowered to make room for happiness bar above

for (var i = 0; i < max_strikes; i++) {
    // Determine color based on current strikes
    var col = (i < current_strikes) ? c_red : c_dkgray
	draw_text_transformed_color(strike_x_start + (i * 80), strike_y, "X", 1, 1, 0, col, col, col, col, 1)
}

// Petting dragon bar
if (obj_dragon.pet_hold_timer > 0) {
    var px = obj_player.x
    var py = obj_player.y - 100 // Position above head
    
    var pc = (obj_dragon.pet_hold_timer / obj_dragon.pet_hold_max) * 100
    draw_healthbar(px - 30, py, px + 30, py + 10, pc, c_black, c_white, c_lime, 0, true, true)
}

// Draw Overall Happiness Bar
var bw = 300
var bh = 25
var bx = 30
var by = 40

// Change color based on happiness level
var col = c_lime
if (obj_dragon.drg_happiness < 60) col = c_yellow
if (obj_dragon.drg_happiness < 30) col = c_red

draw_set_halign(fa_left) // Changed to left for corner alignment
draw_text(bx, by - 25, "DRAGON HAPPINESS")
draw_healthbar(bx, by, bx + bw, by + bh, obj_dragon.drg_happiness, c_black, c_maroon, col, 0, true, true)

// RESET DRAW STATE
draw_set_font(-1)
draw_set_halign(fa_left)
draw_set_valign(fa_top)