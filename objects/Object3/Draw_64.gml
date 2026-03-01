// This mathematically picks the exact frame to draw based on your health!
draw_sprite(spr_health_ui, max_health - my_health, 20, 20);
draw_set_color(c_white); // Make the text white
draw_text(20, 60, "SCORE: " + string(my_score)); // Draw it below the health bar