// Frost settings
frost_alpha = 0          // Current frost level (0 to 1)
fade_speed_in = 0.005    // How fast it freezes (Lower = slower)
fade_speed_out = 0.01    // How fast it thaws (Usually faster than freezing)

// Shader Uniforms
u_intensity = shader_get_uniform(shd_frost, "intensity")
u_time = shader_get_uniform(shd_frost, "time")