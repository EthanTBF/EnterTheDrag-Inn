if not global.game_paused{
	
	// Logic to switch which bar is draining
	change_target_timer -= 1
	if (change_target_timer <= 0) {
	    target_stat = irandom(2) // Pick 0, 1, or 2
	    change_target_timer = change_target_max
	}

	if (target_stat == 0) drg_boredom -= decay_value
	if (target_stat == 1) drg_hunger -= decay_value
	if (target_stat == 2) drg_tiredness -= decay_value

	drg_boredom = clamp(drg_boredom, 0, 100)
	drg_hunger = clamp(drg_hunger, 0, 100)
	drg_tiredness = clamp(drg_tiredness, 0, 100)

	drg_happiness = (drg_boredom + drg_hunger + drg_tiredness) / 3

	// Feed dragon
	if (distance_to_object(obj_player) < 80 && keyboard_check_pressed(ord("E"))) {
	    if (obj_player.holding_item == "meat") {
	        drg_hunger = 100
	        obj_player.holding_item = "none"
	    }
	}

	// Pet dragon
	if (distance_to_object(obj_player) < 80) {
	    if (keyboard_check(ord("E")) && obj_player.holding_item == "none") {
	        pet_hold_timer += 1
	        // Stop player movement while petting
	        obj_player.speed = 0
        
	        // If held for a full second, trigger the reset
	        if (pet_hold_timer >= pet_hold_max) {
	            drg_boredom = 100
	            pet_hold_timer = 0; // Reset timer after success
	            show_debug_message("Dragon Entertained!")
	        }
	    } else {
	        // Reset the timer if they let go or move away
	        pet_hold_timer = 0
	    }
	}

	//Dragon Nap
	if (distance_to_object(obj_player) < 80 && keyboard_check_pressed(ord("E"))) {
	    if (obj_player.holding_item == "blanket") {
	        is_napping = true
	        nap_timer = 180 // 3 seconds
	        obj_player.holding_item = "none"
	    }
	}

	if (is_napping) {
	    nap_timer -= 1
    
	    // Wake up logic
	    if (nap_timer <= 0) {
	        is_napping = false
	        drg_tiredness = 100 // Instant replenishment
	    }
	}

	// Update the hearth
	var hearth = instance_find(obj_hearth, 0)
	if (hearth != noone) {
	    // Priority 1: If napping, hearth is ALWAYS off
	    if (is_napping) {
	        hearth.is_active = false
	    } 
	    // Priority 2: If happiness is too low, the dragon becomes "disturbed"
	    else if (drg_happiness < 30) {
	        hearth.is_active = false
	    } 
	    // Otherwise, hearth is active
	    else {
	        hearth.is_active = true
	    }
	}

	// Lose Condition: Tantrum 
	if (drg_happiness == 0) {
	    show_message("The Dragon threw a tantrum! Shift Failed.")
	    room_restart()
	}
}