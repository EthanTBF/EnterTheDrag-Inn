// Draw GUI Event
var _gui_w = display_get_gui_width()
var _gui_h = display_get_gui_height()

if (frost_alpha > 0) {
    shader_set(shd_frost)
    
    var _u_intensity = shader_get_uniform(shd_frost, "intensity")
    var _u_time = shader_get_uniform(shd_frost, "time")
    
    shader_set_uniform_f(_u_intensity, frost_alpha)
    shader_set_uniform_f(_u_time, current_time / 1000)
}

// Draw the game surface. If the shader is set, it applies to this.
draw_surface_stretched(application_surface, 0, 0, _gui_w, _gui_h)

shader_reset()