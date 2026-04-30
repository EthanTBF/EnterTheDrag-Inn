if (!global.game_paused) {
    spawn_timer -= 1;

    if (spawn_timer <= 0 && ds_list_size(order_list) < max_orders) {

        // Determine available meats based on level
        var available = [];
        array_push(available, order_type.CHICKEN);

        if (global.current_level >= 2) {
            array_push(available, order_type.BURGER);
        }

        // Pick random order
        var order = available[irandom(array_length(available) - 1)];

        ds_list_add(order_list, order);

        // Reset timer
        spawn_timer = irandom_range(450, 900);
    }
}