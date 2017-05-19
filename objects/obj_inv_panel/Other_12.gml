{
	///slot left pressed event
/*
    By default, when a panel slot is left clicked, the item
    is switched with the one on the mouse, or if the mouse
    is holding the same item, amounts are merged.
    Complex inventories like crafting benches or equipment should
    override this event.
*/
//get the affected slots
var slot = other.id;
var mouse_slot = obj_inv_mouse.slots[0];
if(keyboard_check(vk_control)) {
    ex_inv_add(inv,slot.item,1);
}
//make items unique
else if(keyboard_check(vk_shift)) {
    if(slot.item >= 0) {
        //ask the user for a new name for the unique item
        var new_name = get_string("Name your unique item","unique " + slot.item[? "name"]);
        if(new_name == "") {new_name = "unique " + slot.item[? "name"];}
        /* 
            if we sicceed at setting it unique, update the name accordingly.
            Note that in this demo the only attribute changing is the name, you'll have to assign a new key 
            differently in your game depending on how you want unique items to stack (see docs for more info).
        */
        if(ex_inv_item_set_unique(inv,slot.index,slot.item[? "base_key"]+"_"+md5_string_unicode(new_name))) {
            slot.item[? "name"] = new_name; 
        }
    }
}
//mouse items and clicked slot item are different, switch
else if(slot.key != mouse_slot.key) {
    ex_inv_switch(inv,slot.index,mouse_slot.inv,mouse_slot.index);
}
//mouse item and clicked slot item are the same, try adding
else {
    var amount = ex_inv_add_slot(inv,mouse_slot.item,mouse_slot.amount,slot.index);
    ex_inv_remove_slot(obj_inv_mouse.inv,amount,0);
}
/* */
/*  */
/**/
}
