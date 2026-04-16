// Player Movement
if (can_move) {
	var _hmove = keyboard_check(ord("D")) - keyboard_check(ord("A"))
	var _vmove = keyboard_check(ord("S")) - keyboard_check(ord("W"))

	var _accel = 0.35 // Higher number = faster starting
	var _decel = 0.15 // Higher number = faster stopping

	var player_hspeed = _hmove * move_speed
	var player_vspeed = _vmove * move_speed

	if (_hmove != 0) {
		hspeed = lerp(hspeed, player_hspeed, _accel)
	} else {
		hspeed = lerp(hspeed, 0, _decel)
	}

	if (_vmove != 0) {
		vspeed = lerp(vspeed, player_vspeed, _accel)
	} else {
		vspeed = lerp(vspeed, 0, _decel)
	}

	if (speed > move_speed) {
		speed = lerp(speed, move_speed, _accel)
	}

	if (abs(speed) < 0.1) {
		speed = 0
	}
}