draw_self();

// Only process bubbles if the dragon is at least partially unhappy
if (drg_happiness < 80) { 
    var spacing = 90 // Adjust based on your sprite width
    var icon_y = y - 150 + (sin(current_time / 150) * 10) // Bobbing animation

    // Identify which "Needs" are below the 50% threshold
    var active_bubbles = [];
    depth = -100
    if (drg_tiredness < 50) array_push(active_bubbles, spr_bubble_tired)
    if (drg_hunger < 50)    array_push(active_bubbles, spr_bubble_hungry)
    if (drg_boredom < 50)   array_push(active_bubbles, spr_bubble_bored)

    // Draw the bubbles if any exist
    var count = array_length(active_bubbles)
    if (count > 0) {
        // Calculate the starting X to keep the group centered over the dragon
		show_debug_message("Drawing " + string(count) + " bubbles!")
        var total_width = (count - 1) * spacing
        var start_x = x - (total_width / 2)

        for (var i = 0; i < count; i++) {
            draw_sprite(active_bubbles[i], 0, start_x + (i * spacing), icon_y)
        }
    }
}

if (is_napping) {
	draw_sprite(spr_blanket, 0, x + 25, y - 10)	
}