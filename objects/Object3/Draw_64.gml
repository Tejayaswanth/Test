// 1. ONLY draw the survival UI if we are in the dangerous cave (Room1)
if (room == Room1)
{
    // This mathematically picks the exact frame to draw based on your health!
    draw_sprite(spr_health_ui, max_health - my_health, 20, 20);
    
    draw_set_color(c_white); // Make the text white
    draw_text(20, 60, "SCORE: " + string(my_score)); // Draw it below the health bar
}
// 2. Draw the victory text locked to the top sky (Room2)
else if (room == Room2)
{
    // Center the text horizontally
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    var mid_x = display_get_gui_width() / 2;
    
    // Draw the giant victory message near the top of the screen (Y = 80)
    draw_set_font(fnt_title); 
    draw_set_color(c_white);
    draw_text(mid_x, 80, "YOU REACHED THE SURFACE!");
    
    // Draw the subtitle right below it (Y = 140)
    draw_set_font(-1); 
    draw_set_color(c_yellow);
    draw_text(mid_x, 140, "Thanks for playing Echoes in the Dark");
    
    // Always reset alignment
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

// --- TELEPORT TEXT ---
// This will still safely draw on top of everything if the portal is active
if (alarm[1] > 0)
{
    draw_set_color(c_yellow);
    draw_set_halign(fa_center);
    
    var mid_x = display_get_gui_width() / 2;
    var mid_y = display_get_gui_height() / 2;
    
    draw_text(mid_x, mid_y, "TELEPORTING... " + string(ceil(alarm[1]/60)));
    
    // Reset alignment so it doesn't break your other text!
    draw_set_halign(fa_left);
}