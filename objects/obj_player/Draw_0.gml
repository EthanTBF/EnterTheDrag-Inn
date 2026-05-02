// Draw the player
draw_self();


// Draw carried item
if (holding_item != "none") {

    // Plate
    if (holding_item == "plate") {
        draw_sprite_ext(spr_plate, 0, x + 12, y + 8, 0.8, 0.8, 0, c_white, 1);
    }

    // Raw chicken from cooler
    else if (holding_item == "chicken") {
        draw_sprite_ext(spr_chicken_leg_raw, 0, x + 12, y + 8, 0.8, 0.8, 0, c_white, 1);
    }

    // Raw patty from cooler
    else if (holding_item == "patty") {
        draw_sprite_ext(spr_patty_raw, 0, x + 12, y + 8, 0.8, 0.8, 0, c_white, 1);
    }

    // Raw steak from cooler
    else if (holding_item == "steak") {
        draw_sprite_ext(spr_steak_raw, 0, x + 12, y + 8, 0.8, 0.8, 0, c_white, 1);
    }

    // Chicken meal
    else if (holding_item == "chicken_meal") {
        draw_sprite_ext(spr_chicken_meal, 0, x + 12, y + 8, 0.8, 0.8, 0, c_white, 1);
    }

    // Patty meal without topping
    else if (holding_item == "patty_meal") {
        draw_sprite_ext(spr_patty_meal, 0, x + 12, y + 8, 0.8, 0.8, 0, c_white, 1);
    }

    // Patty meal with topping
    else if (holding_item == "patty_meal_with_topping") {
        draw_sprite_ext(spr_patty_meal_with_topping, 0, x + 12, y + 8, 0.8, 0.8, 0, c_white, 1);
    }

    // Steak meal
    else if (holding_item == "steak_meal") {
        draw_sprite_ext(spr_steak_meal, 0, x + 12, y + 8, 0.8, 0.8, 0, c_white, 1);
    }

    // Burnt meal
    else if (holding_item == "meal_burnt" || holding_item == "burnt_meal") {
        draw_sprite_ext(spr_meal_burnt, 0, x + 12, y + 8, 0.8, 0.8, 0, c_white, 1);
    }
	
	else if (holding_item == "blanket") {
        draw_sprite_ext(spr_blanket, 0, x + 15, y + 28, 0.8, 0.8, 0, c_white, 1);
    }

    // Fallback: if the item has a sprite, draw it anyway
    else if (holding_sprite != noone) {
        draw_sprite_ext(holding_sprite, 0, x + 12, y + 8, 0.8, 0.8, 0, c_white, 1);
    }
}