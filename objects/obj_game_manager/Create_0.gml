global.is_interacting = false;
global.total_score = 0;
global.customers_served = 0;
global.customers_to_advance = 2;
global.current_level = 1; // 1 = Tutorial, 2 = Lunch Rush, 3 = Dinner Rush
global.game_paused = false; // FIX 4: initialize so checks don't error

day_time_max = 180;
day_time = day_time_max;
max_strikes = 3;
current_strikes = 0;
game_over = false;

depth = -100