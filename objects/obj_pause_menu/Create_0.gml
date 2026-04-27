width = 416;
height = 256;

op_border = 32; // Space from edge of background
op_space = 16; // Space between different options

pos = 0; // Variable to highlight and select options

option[0, 0] = "Continue";
option[0, 1] = "Settings";
option[0, 2] = "Main Menu";

option[1, 0] = "Fullscreen";
option[1, 1] = "Toggle Volume";
option[1, 2] = "Back";

op_length = 0; // How long list of options is

menu_level = 0;

default_ui_sounds[0] = Blip2;
default_ui_sounds[1] = Blip6;
default_ui_sounds[2] = Blip7;
default_ui_sounds[3] = Blip8;
default_ui_sounds[4] = Blip9;

audio_group_set_gain(audiogroup_default, 0.5, 0);

visible = false;