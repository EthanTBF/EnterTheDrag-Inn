draw_self()

// Show prompt if the player is holding a meal and is nearby
if (distance_to_object(obj_player) < 40) {
    draw_set_halign(fa_center)
    draw_set_font(-1) // Reset to default small font
    
    var prompt_text = ""
    if (obj_player.holding_item == "meal") {
        prompt_text = "E: Deliver Order"
    } else {
        prompt_text = "Counter"
    }
    
    draw_text(x, y - 60, prompt_text)
    
    // Reset alignment for other objects
    draw_set_halign(fa_left)
}