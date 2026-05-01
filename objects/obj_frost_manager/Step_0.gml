var _hearth = instance_find(obj_hearth, 0)

if (_hearth != noone) {
    if (_hearth.is_active) {
        // Hearth is lit: Thaw out
        frost_alpha = max(0, frost_alpha - fade_speed_out)
    } else {
        // Hearth is out: Freeze up
        frost_alpha = min(1, frost_alpha + fade_speed_in)
    }
}