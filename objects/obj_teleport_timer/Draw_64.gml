draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var mid_x = display_get_gui_width() / 2;
var mid_y = display_get_gui_height() / 2;

draw_text(mid_x, mid_y, "TELEPORTING...");

// DEBUG: This shows the timer on screen so you can see if it's counting!
draw_text(mid_x, mid_y + 40, "Seconds left: " + string(ceil(alarm[0] / 60)));

draw_set_halign(fa_left); // Reset