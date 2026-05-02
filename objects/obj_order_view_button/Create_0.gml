// Position it at the bottom right corner
x = display_get_gui_width() - 120
y = display_get_gui_height() - 120

// Match the sprite to the current state of the manager
if (obj_order_manager.show_tickets) {
    sprite_index = spr_hide_orders
} else {
    sprite_index = spr_view_orders
}