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

// Draw steak/meat cooking on stove
if (linked_stove.has_steak) {

    var steak_progress = linked_stove.cook_progress;
    var steak_sprite = spr_steak_raw;

    // Default steak cooking stages
    if (steak_progress >= 150) {
        steak_sprite = spr_steak_burnt;
    } else if (steak_progress >= 100) {
        steak_sprite = spr_steak_cooked;
    } else if (steak_progress >= 50) {
        steak_sprite = spr_steak_partial;
    }

    // If a custom meat sprite exists, use it while raw/early cooking
    if (variable_instance_exists(linked_stove, "cooking_sprite")) {
        if (linked_stove.cooking_sprite != noone && steak_progress < 50) {
            steak_sprite = linked_stove.cooking_sprite;
        }
    }

    draw_sprite_ext(steak_sprite, 0, ui_x, ui_y + 100, 2, 2, 0, c_white, 1);

    // Progress Bar
    var bar_pc = (steak_progress / 150) * 100;

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
    obj_player.holding_item == "meat" ||
    obj_player.holding_item == "steak" ||
    obj_player.holding_item == "chicken" ||
    obj_player.holding_item == "patty"
);

// Draw raw meat source on the right side if player is holding meat
if (player_has_raw_meat) {

    var source_sprite = spr_steak_raw;

    if (obj_player.holding_sprite != noone) {
        source_sprite = obj_player.holding_sprite;
    }

    // Show the meat next to the stove UI before dragging
    if (!is_dragging_steak) {
        draw_sprite_ext(source_sprite, 0, ui_x + 500, ui_y, 1.2, 1.2, 0, c_white, 1);
    }

    // Draw dragging meat
    if (is_dragging_steak) {
        var mx = device_mouse_x_to_gui(0);
        var my = device_mouse_y_to_gui(0);

        if (drag_sprite != noone) {
            draw_sprite_ext(drag_sprite, 0, mx, my, 1.2, 1.2, 0, c_white, 0.7);
        } else {
            draw_sprite_ext(source_sprite, 0, mx, my, 1.2, 1.2, 0, c_white, 0.7);
        }
    }
} else {

    // No meat message
    draw_set_font(-1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);

    draw_text(ui_x + 500, ui_y, "Go to Cooler");

    // Reset draw state
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}