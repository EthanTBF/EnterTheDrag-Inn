// Dim background
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_ui);

// Title
draw_text(ui_x, ui_y - 150, "TOPPING STATION");

// Bacon button
var bacon_col = has_bacon ? c_lime : c_dkgray;
draw_set_color(bacon_col);
draw_circle(ui_x - 100, ui_y, 60, false);
draw_set_color(c_white);
draw_sprite(spr_bacon, 0, ui_x - 100, ui_y);
draw_text(ui_x - 100, ui_y + 80, "BACON");

// Bun button
var bun_col = has_bun ? c_lime : c_dkgray;
draw_set_color(bun_col);
draw_circle(ui_x + 100, ui_y, 60, false);
draw_set_color(c_white);
draw_sprite(spr_bun, 0, ui_x + 100, ui_y);
draw_text(ui_x + 100, ui_y + 80, "BUN");

// Current meal preview text
var preview = "Plain Burger";
if (has_bacon && has_bun) preview = "Burger + Bacon + Bun";
else if (has_bacon) preview = "Burger + Bacon";
else if (has_bun) preview = "Burger + Bun";
draw_text(ui_x, ui_y + 160, preview);

draw_text(ui_x, ui_y + 200, "[E] Done");

// Reset draw state
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);
draw_set_color(c_white);
draw_set_alpha(1);