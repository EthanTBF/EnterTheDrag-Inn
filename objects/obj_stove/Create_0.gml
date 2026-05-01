is_active = true;

has_steak = false; //this var references all meat types but when I change it to "has_meat" a lot of previous code breaks, 
//for now when referencing all meat types use has_steak.
is_stolen = false;

cook_progress = 0;
cooking_speed = 0.1;
max_cook = 200;

cooking_item = "none";      // "chicken", "patty", "steak"
cooking_sprite = noone;

stove_smoke = part_system_create(ps_smoke);
stove_fire = part_system_create(ps_fire);

part_system_position(stove_smoke, x, y - 90);
part_system_position(stove_fire, x, y - 90);

part_system_automatic_draw(stove_smoke, false);
part_system_automatic_draw(stove_fire, false);