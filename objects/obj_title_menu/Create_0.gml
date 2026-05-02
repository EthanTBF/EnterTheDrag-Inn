width = 416;
height = 256;

op_border = 32; // Space from edge of background
op_space = 72; // Space between different options

pos = 0; // Variable to highlight and select options

option[0, 0] = "Level Select";
option[0, 1] = "Settings";
option[0, 2] = "Credits";
option[0, 3] = "Quit Game";


option[1, 0] = "Fullscreen";
option[1, 1] = "Toggle Volume";
option[1, 2] = "Back";

option[2, 0] = "Tutorial";
option[2, 1] = "Level 1";
option[2, 2] = "Level 2";
option[2, 3] = "Back";

option[3, 0] = "Credits";
option[3, 1] = "Team Dragons";
option[3, 2] = "Ethan Bradley-Foo";
option[3, 3] = "Hayes Bridges";
option[3, 4] = "Amman Kamili";
option[3, 5] = "Nathan Pereira";
option[3, 6] = "Back";

op_length = 0; // How long list of options is

menu_level = 0;

default_ui_sounds[0] = Blip2;
default_ui_sounds[1] = Blip6;
default_ui_sounds[2] = Blip7;
default_ui_sounds[3] = Blip8;
default_ui_sounds[4] = Blip9;

audio_group_set_gain(audiogroup_default, 0.5, 0);
audio_stop_all()
audio_play_sound(MainMenu, 30, true);