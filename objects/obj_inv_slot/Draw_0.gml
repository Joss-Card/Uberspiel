{
	///draw slot
if(item >= 0) {
    draw_self();
    //if amount greater than 1, draw it in the corner
    if(amount > 1) {
        draw_set_font(fnt_ex);
        draw_set_valign(fa_middle);
        draw_set_halign(fa_center);
        draw_set_color(c_black);
        draw_text(x+17,y+17,string_hash_to_newline(string(amount)));
        draw_set_color(c_white);
        draw_text(x+16,y+16,string_hash_to_newline(string(amount)));
    }
}
}
