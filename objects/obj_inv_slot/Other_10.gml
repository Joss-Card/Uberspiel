{
	///on update/change event
/*
    This event refreshes the slot, and has to be called when the slot item in the
    inventory gets an update.
    e.g: The amount changes, the item is removed or switched, ...
*/
var inv_item = ex_inv_get_item(inv,index); //get item
//if inventory slot is empty, clear slot data
if(inv_item < 0) {
    if(item >= 0) {
        item = -1;
        amount = 0;
        sprite_index = spr_slot_empty;
        image_index = 0;
    }
}
//if item is empty or different from the current one, replace
else if(item != inv_item) {
    item = inv_item;
    amount = ex_inv_get_amount(inv,index); //assign amount
    sprite_index = asset_get_index(item[? "sprite"]); //get sprite
    image_index = item[? "image"];
}
//same item, different amount
else if(amount != ex_inv_get_amount(inv,index)) {
    amount = ex_inv_get_amount(inv,index);
}
//set the key for easy access
if(item < 0) {key = "";}
else {key = item[? "key"];}
//call panel slot changed event
with(panel) {
    event_user(panel_events.slot_updated);
}
/* */
/*  */
/**/
}
