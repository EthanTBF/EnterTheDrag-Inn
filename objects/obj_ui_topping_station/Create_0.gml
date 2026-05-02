popup_sprite = spr_toppingstationpopup;

bacon_sprite = spr_bacon;
bun_sprite = spr_bun;

popup_w = sprite_get_width(popup_sprite);
popup_h = sprite_get_height(popup_sprite);

popup_x = display_get_gui_width() / 2;
popup_y = display_get_gui_height() / 2;

ui_x = popup_x;
ui_y = popup_y;

// Slot positions relative to popup center
bacon_slot_x = -170;
bacon_slot_y = -55;

bun_slot_x = 170;
bun_slot_y = -55;

slot_w = 180;
slot_h = 180;

// Meal drop target
meal_x = popup_x;
meal_y = popup_y + 115;
meal_drop_radius = 120;

// Drag state
is_dragging_topping = false;
drag_topping_name = "none";
drag_topping_sprite = noone;

// Message state
message = "";
message_timer = 0;

// Prevent same E press from opening and instantly closing UI
close_delay = 10;