popup_sprite = spr_toppingstationpopup;

// GUI center
ui_x = display_get_gui_width() / 2;
ui_y = display_get_gui_height() / 2;

// Popup size
popup_w = sprite_get_width(popup_sprite);
popup_h = sprite_get_height(popup_sprite);

// If popup origin is top-left, draw from top-left
popup_x = ui_x - popup_w / 2;
popup_y = ui_y - popup_h / 2;

// Slot hitbox sizes
slot_w = 120;
slot_h = 120;

// Slot centers relative to popup top-left
// Adjust these after testing if the click boxes are off
bacon_slot_x = 125;
bacon_slot_y = 210;

bun_slot_x = 335;
bun_slot_y = 210;

// Drop target / meal preview position
meal_x = ui_x;
meal_y = ui_y + 125;
meal_drop_radius = 170;

// Topping sprites
bacon_name = "bacon";
bacon_sprite = spr_bacon;

bun_name = "bun";
bun_sprite = spr_bun;

// Dragging state
is_dragging_topping = false;
drag_topping_name = "none";
drag_topping_sprite = noone;

// Message feedback
message = "";
message_timer = 0;