draw_self()

// Draw a small energy bar above the dragon's head
var bar_w = 40
var bar_h = 6
var xx = x - (bar_w / 2)
var yy = y + 40

draw_set_alpha(0.3)
draw_rectangle_color(xx, yy, xx + bar_w, yy + bar_h, c_black, c_black, c_black, c_black, false)

draw_set_alpha(1.0)
var fill = (dragon_energy / max_energy) * bar_w
var col = (dragon_energy > 20) ? c_orange : c_red
draw_rectangle_color(xx, yy, xx + fill, yy + bar_h, col, col, col, col, false)