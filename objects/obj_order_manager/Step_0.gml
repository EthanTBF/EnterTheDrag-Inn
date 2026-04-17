spawn_timer -= 1

if (spawn_timer <= 0 && ds_list_size(order_list) < max_orders) {
    // Just add a generic steak order, can add different types as we come up with them
    ds_list_add(order_list, 1)
    
    // Reset timer, little bit of variance with irandom
    spawn_timer = irandom_range(450, 900) // Between 7.5 ~ 15 seconds
}