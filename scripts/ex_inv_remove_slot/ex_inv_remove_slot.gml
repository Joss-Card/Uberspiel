{
	///ex_inv_remove_slot(inv,amount,slot)
/*
    Description:    removes a specified amount of a particular item form an inventory
    Arguments:      inv: the affected inventory
                    amount: quantity of the specified item to remove. -1 = all
                    slot: slot from where to remove
    Returns:        The amount of items actually removed
*/
//check if amount is 0 first
if(argument1 == 0) {return 0;}
//get the required data
var inv,item,amount,inv_items,slot;
inv = argument0;
inv_items = inv[? "items"];
slot = argument2;
if(argument1 < 0) {
    argument1 = inv_items[# 2,slot];
}
amount = argument1;
item = ex_inv_get_item(inv,slot);
if(item < 0) {return 0;} //slot already empty
var q = min(amount,inv_items[# 2,slot]);
inv_items[# 2,slot] -= q;
if(inv_items[# 2,slot] == 0) {
    var inv_item = inv_items[# 4,slot];
    inv_items[# 1,slot] = "";
    inv_items[# 3,slot] = "";
    if(inv_item[? "unique"]) {ds_map_destroy(inv_item);}
    inv_items[# 4,slot] = -1;
    inv[? "size"] -= 1;
}
amount -= q;
if(argument1 != amount) { //inventory updated callback on success
    var affected_slots = ds_list_create();
    ds_list_add(affected_slots,slot);
    ex_inv_updated(inv,affected_slots);
    ds_list_destroy(affected_slots);
}
return argument1 - amount;
/**/
}
