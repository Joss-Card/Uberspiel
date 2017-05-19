{
	///slot right pressed event
/*
    This event is fired when a slot of this panel is right clicked.
    By default, we take half of the items in the slot or release
    one unit of the held item.
    Complex inventories like crafting benches or equipment should
    override this event.
*/
//get the affected slots
var slot = other.id;
var mouse_slot = obj_inv_mouse.slots[0];
if(slot.key == mouse_slot.key || slot.item < 0) {
    //same item or slot empty, drop one unit of the one held by the mouse
    var amount = ex_inv_add_slot(inv,mouse_slot.item,1,slot.index);
    ex_inv_remove_slot(obj_inv_mouse.inv,amount,0);
}
else if(mouse_slot.item < 0 && slot.item >= 0) {
    //mouse has no item, get half of the item units (rounded up) of the slot
    var units = ceil(slot.amount / 2);
    var amount = ex_inv_add_slot(obj_inv_mouse.inv,slot.item,units,0);
    ex_inv_remove_slot(inv,units,slot.index);
}
/* */
/*  */
/**/
}
