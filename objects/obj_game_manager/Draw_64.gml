var padding = 120
var centerX = display_get_gui_width() - padding
var centerY = padding
var radius = 80

draw_set_alpha(0.3)
draw_circle_color(centerX, centerY, radius, c_black, c_black, false)
draw_set_alpha(1)

var time_pc = (day_time / day_time_max) * 360
var steps = 60

draw_set_color(c_white)
draw_primitive_begin(pr_trianglefan)
draw_vertex(centerX, centerY)

for(var i = 0; i <= steps; i++) {
    // 90 is 12 o'clock in GameMaker's coordinate system
    var angle = 90 + ((i / steps) * time_pc)
    var vx = centerX + lengthdir_x(radius, angle)
    var vy = centerY + lengthdir_y(radius, angle)
    draw_vertex(vx, vy)
}
draw_primitive_end()

draw_circle_color(centerX, centerY, radius, c_white, c_white, true)

// Strikes
draw_set_alpha(1)
draw_set_font(fnt_ui)
var strike_x_start = 30
var strike_y = 10

for (var i = 0; i < max_strikes; i++) {
    // Determine color based on current strikes
    var col = (i < current_strikes) ? c_red : c_dkgray
    // Drawing at scale 4 to make them very clear
	draw_text_color(strike_x_start + (i * 80), strike_y, "X", col, col, col, col, 1)
}

// RESET DRAW STATE
draw_set_font(-1)
draw_set_halign(fa_left)
draw_set_valign(fa_top)