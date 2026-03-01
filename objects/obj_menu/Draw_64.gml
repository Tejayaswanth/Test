// 1. Set our alignment to the exact center of the screen
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var mid_x = display_get_gui_width() / 2;
var mid_y = display_get_gui_height() / 2;

// 2. Turn on the GIANT font and draw the new title!
draw_set_font(fnt_title); 
draw_set_color(c_white);
draw_text(mid_x, mid_y - 40, "ECHOES IN THE DARK");

// 3. Switch back to the default font (-1) for the instructions
draw_set_font(-1); 
draw_set_color(c_yellow);
draw_text(mid_x, mid_y + 40, "Press ENTER to Start");

// 4. Always reset your alignment at the end!
draw_set_halign(fa_left);
draw_set_valign(fa_top);