///slot pressed event

//if a slot other than the result slot is pressed, behave normally
var slot = other.id;

if(slot != result_slot) {
    event_inherited();
}

//if the result slot has been pressed, try to take resulting item (if present)
else if(result_slot.item >= 0) {
    var mouse_slot = obj_inv_mouse.slots[0];
    //we can't allow to take only part of the resulting item, take only if there's enough space
    if(result_slot.amount + mouse_slot.amount <= result_slot.item[? "stack_size"]) {
        var amount = ex_inv_add_slot(obj_inv_mouse.inv,result_slot.item,result_slot.amount,0);
        if(amount > 0) {
            //disable recipe checking until all items of the recipe have been removed
            inv_changed_event_enabled(false);
            for(var i=0; i<array_length_1d(crafting_slots); i++) {
                ex_inv_remove_slot(inv,1,crafting_slots[i].index);
            }
            //enable recipe checking, and manually start a check after all slots have been created
            inv_changed_event_enabled(true);
            //check if there's a recipe ready after removing the current item
            event_user(panel_events.inventory_changed);
        }
    }
}

