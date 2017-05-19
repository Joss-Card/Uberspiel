{
	draw_self();
//draw armor rating
draw_set_font(fnt_ex);
draw_set_color(text_color);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_text(x-16,y+240,string_hash_to_newline("Armor: "+string(armor_rating)));
}
