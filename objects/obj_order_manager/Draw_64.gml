var ticket_x_start = display_get_gui_width() - 150 // Position of the oldest ticket
var ticket_y = 150
var spacing = 150 // Horizontal distance between tickets

// Loop through the list to draw them side-by-side
for (var i = 0; i < ds_list_size(obj_order_manager.order_list); i++) {
    
    // Calculate X so that index 0 is on the right, index 1 is to its left, etc.
    var tx = ticket_x_start - (i * spacing)

	var order = order_list[| i];

	var spr;

	switch (order) {
		 case order_type.CHICKEN:
			  spr = spr_order_ticket_chicken_leg;
			  break;
        
		 case order_type.BURGER:
			  spr = spr_order_ticket_burger_bacon;
			  break;
}

draw_sprite(spr, 0, tx, ticket_y);
	
    // Draw the text
    draw_set_halign(fa_center)
    
    // Highlight the oldest ticket (index 0) so the player knows it's the priority
    var text_col = (i == 0) ? c_yellow : c_white
    draw_text_transformed_color(tx, ticket_y + 150, "ORDER: MEAL", 1, 1, 0, text_col, text_col, text_col, text_col, 1)
}

// RESET DRAW STATE
draw_set_halign(fa_left)
draw_set_font(-1)