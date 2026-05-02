// Draw the button
draw_self()

// small label under the button
draw_set_halign(fa_center)
draw_set_valign(fa_top)
var label = (sprite_index == spr_hide_orders) ? "HIDE" : "VIEW"
draw_text_transformed(x, y + 35, label, 0.8, 0.8, 0)