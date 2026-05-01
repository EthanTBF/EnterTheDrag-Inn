event_inherited()

switch (state) {
    case "searching":
        // Check for nearby stoves
        var _nearby_stove = instance_nearest(x, y, obj_stove)
        if (_nearby_stove != noone && point_distance(x, y, _nearby_stove.x, _nearby_stove.y) < detection_range) {
            if (_nearby_stove.has_steak && !_nearby_stove.is_stolen) {
                target_stove = _nearby_stove
                path_end();
                state = "approaching"
            }
        }

        if (path_index == pth_goblin_spawn && path_position >= 0.99) {
            path_end(); // End the current path
            
            // Manual check for nearest escape point (prevents backtracking)
            var _min_dist = 999999
            var _best_pos = 0
            for (var i = 0; i <= 1; i += 0.1) {
                var _px = path_get_x(pth_goblin_escape, i)
                var _py = path_get_y(pth_goblin_escape, i)
                var _dist = point_distance(x, y, _px, _py)
                if (_dist < _min_dist) {
                    _min_dist = _dist
                    _best_pos = i
                }
            }
            
            target_escape_x = path_get_x(pth_goblin_escape, _best_pos)
            target_escape_y = path_get_y(pth_goblin_escape, _best_pos)
            state = "moving_to_escape"
        }
    break

    case "approaching":
        if (instance_exists(target_stove)) {
            if (speed == 0) move_towards_point(target_stove.x, target_stove.y, move_speed)
            if (point_distance(x, y, target_stove.x, target_stove.y) < 10) {
                speed = 0
                state = "stealing"
            }
        } else {
            state = "moving_to_escape"
        }
    break;

    case "stealing":
        if (instance_exists(target_stove) && target_stove.has_steak) {
            stolen_sprite = target_stove.cooking_sprite
            target_stove.is_stolen = true
            has_stolen_meat = true
            
            // Set target to start of escape path
            target_escape_x = path_get_x(pth_goblin_escape, 0)
            target_escape_y = path_get_y(pth_goblin_escape, 0)
            state = "moving_to_escape"
        }
    break;

    case "moving_to_escape":
        move_towards_point(target_escape_x, target_escape_y, move_speed + 1)
        
        if (point_distance(x, y, target_escape_x, target_escape_y) < 10) {
            speed = 0; 
            state = "following_escape";
            path_start(pth_goblin_escape, move_speed + 1, path_action_stop, true)
        }
    break

    case "following_escape":
        if (path_position == 1) {
            if (instance_exists(target_stove) && has_stolen_meat) {
                target_stove.has_steak = false
                target_stove.is_stolen = false
                target_stove.cook_progress = 0
                target_stove.cooking_item = "none"
                target_stove.cooking_sprite = noone
            }
            instance_destroy()
        }
    break
}

// Interaction: "Spell Casting" (Spacebar)
if (point_distance(x, y, obj_player.x, obj_player.y) < 100 && keyboard_check_pressed(vk_space)) {
    if (has_stolen_meat && instance_exists(target_stove)) {
        target_stove.is_stolen = false
    }
    has_stolen_meat = false
    stolen_sprite = noone
    speed = 0
    path_end()
    
    // Head to the escape path start
    target_escape_x = path_get_x(pth_goblin_escape, 0)
    target_escape_y = path_get_y(pth_goblin_escape, 0)
    state = "moving_to_escape"
	
	part_particles_burst(ptcl_stun, x, y, ps_stun)
}

var dx = x - prev_x;

if (dx > 0) {
    image_xscale = 1;   // facing right
} else if (dx < 0) {
    image_xscale = -1;  // facing left
}

prev_x = x;