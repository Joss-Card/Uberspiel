/* 
    check if any slot (except the one associated to the mouse) is hovered by mouse,
    and in which case draw the item name.
*/

with(obj_inv_slot) {
    if(inv != other.inv && item >= 0 && position_meeting(mouse_x,mouse_y,id)) {
        var name = item[? "name"];
        draw_set_font(fnt_ex);
        draw_set_valign(fa_bottom);
        draw_set_halign(fa_center);
        var w = (string_width(string_hash_to_newline(name)) + 8) div 2;
        var h = (string_height(string_hash_to_newline(name)) + 4);
        draw_set_color(c_dkgray);
        draw_rectangle(mouse_x-w,mouse_y-h,mouse_x+w,mouse_y,false);
        draw_set_color(c_white); 
        draw_text(mouse_x,mouse_y,string_hash_to_newline(name));
    }
}

/* */
/*  */
