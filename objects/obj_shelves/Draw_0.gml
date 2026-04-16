draw_self();

if (distance_to_object(obj_player) < 40) {
    draw_set_halign(fa_center);
    draw_set_font(-1);
    
    var text = "";
    if (obj_player.holding_item == "none") text = "E: Take Plate";
    if (obj_player.holding_item == "plate") text = "E: Return Plate";
    
    if (text != "") {
        draw_text(x, y - 60, text);
    }
    
    draw_set_halign(fa_left);
}