varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float intensity;
uniform float time;

void main() {
    vec4 base_col = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    
    vec2 uv = v_vTexcoord * 2.0 - 1.0;
    
    float dist = max(abs(uv.x), abs(uv.y));
    
    // Tweak these two numbers to control the "Inner" and "Outer" edge
    float vignette = smoothstep(0.1, 1.5, dist);
    
    float noise = sin(v_vTexcoord.x * 40.0 + v_vTexcoord.y * 40.0 + time) * 0.08;
    float final_mask = clamp(vignette + (noise * intensity), 0.0, 1.0) * intensity;
    
    // Frost Color (Light Blue/White)
    vec3 ice_color = vec3(0.8, 0.9, 1.0);
    
    gl_FragColor = vec4(mix(base_col.rgb, ice_color, final_mask), base_col.a);
}