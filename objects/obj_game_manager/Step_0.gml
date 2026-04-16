if (!game_over) {
    if (day_time > 0) {
        day_time -= 1/60
    } else {
        day_time = 0
        game_over = true
    }
}