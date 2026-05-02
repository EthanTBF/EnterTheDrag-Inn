popup_sprite = spr_toppingstationpopup;

bacon_sprite = spr_bacon;
bun_sprite = spr_bun;

popup_w = sprite_get_width(popup_sprite);
popup_h = sprite_get_height(popup_sprite);

gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

// Top-left position of popup, centered on screen
popup_left = (gui_w - popup_w) / 2;
popup_top = (gui_h - popup_h) / 2;

// Center of popup
popup_x = popup_left + popup_w / 2;
popup_y = popup_top + popup_h / 2;

ui_x = popup_x;
ui_y = popup_y;

// Slot positions relative to popup top-left
bacon_slot_x = 205;
bacon_slot_y = 245;

bun_slot_x = 525;
bun_slot_y = 245;

slot_w = 180;
slot_h = 180;

// Meal drop target position relative to popup top-left
meal_x = popup_left + popup_w / 2;
meal_y = popup_top + 430;
meal_drop_radius = 130;

// Drag state
is_dragging_topping = false;
drag_topping_name = "none";
drag_topping_sprite = noone;

// Message state
message = "";
message_timer = 0;

// Prevent same E press from opening and instantly closing UI
close_delay = 10;