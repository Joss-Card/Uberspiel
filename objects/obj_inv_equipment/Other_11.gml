{
	///inventory changed event
event_inherited();
/*
    When a the inventory changes, we need to recompute the armor rating
*/
armor_rating = 0;
for(var i=0; i<array_length_1d(slots); i++) {
    var slot = slots[i];
    var item = slot.item;
    //check is slot has an item, and if the item has a defense attribute    
    if(item >= 0 && ds_map_exists(item,"defense")) {
        armor_rating += item[? "defense"];
    }    
}
/* */
/*  */
/**/
}
