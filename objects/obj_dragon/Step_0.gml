// Drain energy over time
if (dragon_energy > 0) {
    dragon_energy -= drain_rate
}

// Reset energy when player interacts
if (distance_to_object(obj_player) < 40) {
    if (keyboard_check_pressed(ord("E"))) {
        dragon_energy = max_energy
        show_debug_message("Dragon is happy again!")
    }
}

// Control the Hearth status
var hearth = instance_find(obj_hearth, 0)
if (hearth != noone) {
    hearth.is_active = (dragon_energy > 20) // Stops powering at 20%
}
