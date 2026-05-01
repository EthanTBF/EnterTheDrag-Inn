if (global.game_paused) exit;

// Only count down if a goblin isn't already in the room
if (!instance_exists(obj_goblin)) {
    spawn_timer--;
    
    if (spawn_timer <= 0) {
        // Spawn the goblin at the start of the path
        var _spawn_x = path_get_x(pth_goblin_spawn, 0);
        var _spawn_y = path_get_y(pth_goblin_spawn, 0);
        
        instance_create_depth(_spawn_x, _spawn_y, 0, obj_goblin);
        
        // Reset timer for the NEXT one after this one is gone
        spawn_timer = irandom_range(600, 1200); 
    }
}