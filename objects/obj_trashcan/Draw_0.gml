draw_self()

if (distance_to_object(obj_player) < 40 && obj_player.holding_item != "none") {
    draw_set_halign(fa_center)
    draw_set_font(-1)
    draw_text(x, y - 60, "E: Throw Away " + string(obj_player.holding_item))
    draw_set_halign(fa_left)
}