// Get mouse position relative to the GUI layer
var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)

// Check if the mouse is hovering over the button
var mouse_hover = position_meeting(mx, my, id)

if (mouse_hover && mouse_check_button_pressed(mb_left)) {
    // Toggle the variable
    obj_order_manager.show_tickets = !obj_order_manager.show_tickets
    
    // Swap the button sprite based on the new state
    if (obj_order_manager.show_tickets) {
        sprite_index = spr_hide_orders
    } else {
        sprite_index = spr_view_orders
    }
    
    audio_play_sound(Hit8, 10, false)
}