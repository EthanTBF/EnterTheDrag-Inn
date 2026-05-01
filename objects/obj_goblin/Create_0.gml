event_inherited()

state = "searching"
target_stove = noone
stolen_sprite = noone
has_stolen_meat = false
move_speed = 3

target_escape_x = x
target_escape_y = y

ptcl_stun = part_system_create(ps_stun)

// Detection radius
detection_range = 400

// Start on the entrance path
path_start(pth_goblin_spawn, move_speed, path_action_stop, true)

prev_x = x

show_area = true