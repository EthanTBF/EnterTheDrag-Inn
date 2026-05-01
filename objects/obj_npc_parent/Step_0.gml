// All NPCs stop moving if the game is paused
if (global.game_paused) {
    speed = 0
    path_speed = 0
    exit // Pause all AI logic while menu is open
} else {
    // If we just unpaused and were on a path, resume path speed
    if (path_index != -1 && path_speed == 0) {
        path_speed = move_speed
    }
}

depth = -y