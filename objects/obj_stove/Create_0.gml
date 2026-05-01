is_active = true;

has_steak = false; //this var references all meat types but when I change it to "has_meat" a lot of previous code breaks, 
//for now when referencing all meat types use has_steak.
cook_progress = 0;
cooking_speed = 0.2;
max_cook = 200;

cooking_item = "none";      // "chicken", "patty", "steak"
cooking_sprite = noone;