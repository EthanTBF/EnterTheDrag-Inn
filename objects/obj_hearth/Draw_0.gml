draw_self()

if (is_active) {
    draw_set_alpha(0.2)
    draw_circle_color(x, y + 80, 40, c_yellow, c_maroon, false)
    draw_set_alpha(1)
} else {
    draw_set_font(-1)
    draw_set_halign(fa_center)
    draw_set_color(c_white)
    
    draw_text(x, y + 100, "OUT OF HEAT")
    
    draw_set_halign(fa_left)
}