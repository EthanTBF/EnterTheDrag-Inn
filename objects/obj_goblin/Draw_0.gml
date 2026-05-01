draw_self()

if (show_area) {
	draw_set_alpha(0.3) // Make it semi-transparent
	draw_set_color(c_red) // Red circle for "danger zone"

	// Draw the circle around the goblin based on its detection_range
	draw_circle(x, y, detection_range, true)

	// Fill the circle slightly so it's easier to see
	draw_set_alpha(0.1)
	draw_circle(x, y, detection_range, false)

	// Reset drawing settings so other things don't look weird
	draw_set_alpha(1)
	draw_set_color(c_white)
}

// If the goblin is carrying meat, draw it above his head
if (has_stolen_meat && stolen_sprite != noone) {
    // image_xscale ensures the meat flips when the goblin turns
    draw_sprite_ext(stolen_sprite, 0, x, y - 25, image_xscale, 1, 0, c_white, 1)
}