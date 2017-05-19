///inventory changed event

/*
    when the crafting inventory changes, check for recipe with current items
*/

//generate a ds_list of item keys from the crafting slots
var items = ds_list_create();
for(var i=0; i<array_length_1d(crafting_slots); i++) {
    var slot = slots[i];
    if(slot.item >= 0) {ds_list_add(items,slot.item[? "base_key"]);}
}

//check if there's a valid recipe for the items currently in the slots
var recipe = craft_find_recipe(items);

if(recipe != -1) {
    //recipe is found, set the resulting item into the result slot
    inv_changed_event_enabled(false);
    ex_inv_set_slot(inv,recipe[? "result_key"],recipe[? "result_amount"],result_slot.index);
    inv_changed_event_enabled(true);
}
else {
    //recipe not found, remove any items from the result slot (if any)
    inv_changed_event_enabled(false);
    ex_inv_remove_slot(inv,-1,result_slot.index);
    inv_changed_event_enabled(true);
}

//destroy the list of items used for recipe checking
ds_list_destroy(items);

/* */
/*  */
