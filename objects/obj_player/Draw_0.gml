draw_self()

if (holding_item == "meat") {
    draw_sprite_ext(spr_steak_raw, 0, x + 12, y + 8, 0.8, 0.8, 0, c_white, 1)
} else if (holding_item == "plate") {
	draw_sprite_ext(spr_plate, 0, x + 12, y + 8, 0.5, 0.5, 0, c_white, 1)
} else if (holding_item == "meal") {
	draw_sprite(spr_meal, 0, x + 12, y + 8)
} else if (holding_item == "burnt_meal") {
	draw_sprite(spr_meal_burnt, 0, x + 12, y + 8)
} else if (holding_item == "blanket") {
	draw_sprite(spr_blanket, 0, x + 8, y + 70)
}