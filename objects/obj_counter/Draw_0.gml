draw_self();

if (distance_to_object(obj_player) < 40) {

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_set_font(-1);

    var prompt_text = "Need finished meal";

    if (
        obj_player.holding_item == "chicken_meal" ||
        obj_player.holding_item == "patty_meal" ||
        obj_player.holding_item == "patty_meal_with_topping" ||
        obj_player.holding_item == "steak_meal" ||
        obj_player.holding_item == "meal_burnt"
    ) {
        prompt_text = "E: Deliver Order";
    }

    draw_text(x, y - 60, prompt_text);

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}