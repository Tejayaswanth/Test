mining_timer = 0; // Keeps track of how long we hold the pickaxe!
my_score = 0;
hsp = 0;      
vsp = 0;      
grv = 0.3;    
walksp = 4;   

// This grabs your exact Tile Layer! 
// (Make sure your layer is actually named "Tiles_1")
tilemap = layer_tilemap_get_id("Tiles_1");
max_health = 7; 
my_health = max_health;

// Grace period so you don't die instantly
can_take_damage = true;