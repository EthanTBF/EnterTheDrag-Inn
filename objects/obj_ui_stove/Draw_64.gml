// Background dim
draw_set_alpha(0.6)
draw_set_color(c_black)
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false)
draw_set_alpha(1)

// Stove sprite
draw_sprite(spr_ui_stove, 0, ui_x, ui_y)

// Steak cooking
if (linked_stove.has_steak) {
    var steak_progress = linked_stove.cook_progress
    var steak_sprite = spr_steak_raw
    
    if (steak_progress >= 150){
		steak_sprite = spr_steak_burnt
	} else if (steak_progress >= 100) {
		steak_sprite = spr_steak_cooked
	} else if (steak_progress >= 50) {
		steak_sprite = spr_steak_partial
	}

    // Draw the specific steak sprite
    draw_sprite_ext(steak_sprite, 0, ui_x, ui_y + 100, 2, 2, 0, c_white, 1)
    
    // Progress Bar
    var bar_pc = (steak_progress / 150) * 100
	draw_set_alpha(.25)
	if (bar_pc > 0) {
	    // This draws the lime/red bar across
	    draw_healthbar(ui_x - 260, ui_y - 270, ui_x + 270, ui_y - 130, bar_pc, c_black, c_lime, c_red, 0, false, true)
	}
	draw_set_alpha(1)
}

// Raw steak logic (Only if player is holding meat)
if (obj_player.holding_item == "meat") {
    
    // Only show the source steak if we aren't already dragging it
    if (!is_dragging_steak) {
        draw_sprite(spr_steak_raw, 0, ui_x + 500, ui_y)
    }

    // Dragging visual
    if (is_dragging_steak) {
        var mx = device_mouse_x_to_gui(0)
        var my = device_mouse_y_to_gui(0)
        draw_sprite_ext(spr_steak_raw, 0, mx, my, 1.2, 1.2, 0, c_white, 0.7)
    }
} else {
    draw_set_font(-1)
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_text(ui_x + 500, ui_y, "Go to Cooler")
    
    // RESET DRAW STATE
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
}

