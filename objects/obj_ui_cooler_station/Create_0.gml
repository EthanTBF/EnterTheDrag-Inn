popup_sprite = spr_coolerstation;

// GUI center
ui_x = display_get_gui_width() / 2;
ui_y = display_get_gui_height() / 2;

// Popup sprite size
popup_w = sprite_get_width(popup_sprite);
popup_h = sprite_get_height(popup_sprite);

popup_x = ui_x - popup_w / 2;
popup_y = ui_y - popup_h / 2;

// Slot hitbox sizes
slot_w = 120;
slot_h = 120;

slot1_x = 85;
slot1_y = 135;

slot2_x = 285;
slot2_y = 135;

slot3_x = 230;
slot3_y = 390;

// Food data
food1_name = "chicken";
food1_sprite = spr_chicken_leg_raw;

food2_name = "patty";
food2_sprite = spr_patty_raw;

food3_name = "steak";
food3_sprite = spr_steak_raw;