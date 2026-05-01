// Background dim
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);
draw_set_color(c_white);

// Draw stove UI
draw_sprite(spr_ui_stove, 0, ui_x, ui_y);

// Safety check
if (linked_stove == noone) {
    exit;
}

// Draw meat cooking on stove
if (linked_stove.has_steak) {

    var p = linked_stove.cook_progress;
    var meat_sprite = spr_steak_raw;

    // Chicken cooking stages
    if (linked_stove.cooking_item == "chicken") {
        if (p >= 150) {
            meat_sprite = spr_chicken_leg_burned;
        }
        else if (p >= 100) {
            meat_sprite = spr_chicken_leg_cooked;
        }
        else if (p >= 50) {
            meat_sprite = spr_checken_leg_partial;
        }
        else {
            meat_sprite = spr_chicken_leg_raw;
        }
    }

    // Patty cooking stages
    else if (linked_stove.cooking_item == "patty") {
        if (p >= 150) {
            meat_sprite = spr_patty_burned;
        }
        else if (p >= 100) {
            meat_sprite = spr_patty_cooked;
        }
        else if (p >= 50) {
            meat_sprite = spr_patty_partial;
        }
        else {
            meat_sprite = spr_patty_raw;
        }
    }

    // Steak cooking stages
    else if (linked_stove.cooking_item == "steak" || linked_stove.cooking_item == "meat") {
        if (p >= 150) {
            meat_sprite = spr_steak_burnt;
        }
        else if (p >= 100) {
            meat_sprite = spr_steak_cooked;
        }
        else if (p >= 50) {
            meat_sprite = spr_steak_partial;
        }
        else {
            meat_sprite = spr_steak_raw;
        }
    }

    draw_sprite_ext(meat_sprite, 0, ui_x, ui_y + 100, 2, 2, 0, c_white, 1);

    // Progress bar
    var bar_pc = (p / 150) * 100;

    draw_set_alpha(0.25);

    if (bar_pc > 0) {
        draw_healthbar(
            ui_x - 260,
            ui_y - 270,
            ui_x + 270,
            ui_y - 130,
            bar_pc,
            c_black,
            c_lime,
            c_red,
            0,
            false,
            true
        );
    }

    draw_set_alpha(1);
}

// Check whether player is holding raw meat
var player_has_raw_meat = (
    obj_player.holding_item == "chicken" ||
    obj_player.holding_item == "patty" ||
    obj_player.holding_item == "steak" ||
    obj_player.holding_item == "meat"
);

// Draw raw meat source on the right side if player is holding meat
if (player_has_raw_meat) {

    var source_sprite = spr_steak_raw;

    if (obj_player.holding_sprite != noone) {
        source_sprite = obj_player.holding_sprite;
    }

    if (!is_dragging_steak) {
        draw_sprite_ext(source_sprite, 0, ui_x + 500, ui_y, 1.2, 1.2, 0, c_white, 1);
    }

    if (is_dragging_steak) {
        var mx = device_mouse_x_to_gui(0);
        var my = device_mouse_y_to_gui(0);

        if (drag_sprite != noone) {
            draw_sprite_ext(drag_sprite, 0, mx, my, 1.2, 1.2, 0, c_white, 0.7);
        } else {
            draw_sprite_ext(source_sprite, 0, mx, my, 1.2, 1.2, 0, c_white, 0.7);
        }
    }
}
else {
    draw_set_font(-1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);

    draw_text(ui_x + 500, ui_y, "Go to Cooler");

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}