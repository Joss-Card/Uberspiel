///ex_inv_add_slot(inv,item,amount,slot)

/*
    Description:    inserts an item into a slot of the inventory if empty, or
                    adds the amount to the same item in the slot. If the items
                    differ, no action is taken.
    Arguments:      inv: the inventory id to add the item to
                    item: the item to add or its key reference
                    amount: quantity of the specified item to insert
                    slot: the slot this item should be put into.
    Returns:        The amount of items actually inserted (same as  the quantity 
                    argument if there's enough space in the inventory, less otherwise)
*/

var inv,amount,key,item,inv_items,slot,inv_item;

//get item map
inv = argument0;
if(is_real(argument1)) {
    item = argument1;
    if(argument1 >= 0) {key = item[? "key"];}
    else {key = "";}

}
else {
    key = argument1;
    if(key != "") {item = ex_db_get(key);}
    else {item = -1;}
}
amount = argument2;
slot = argument3;

//check if item is empty or amount 0, in which case, there's nothing to do
if(amount < 1 || item < 0) {return 0;}

//get the required data
inv_items = inv[? "items"];
inv_item = ex_inv_get_item(inv,slot);

//slot is empty, insert the item
if(inv_item < 0) {
    var q = min(item[? "stack_size"],amount);
    inv_items[# 1,slot] = key;
    inv_items[# 2,slot] = q;
    inv_items[# 3,slot] = item[? "base_key"];
    if(item[? "unique"]) {
        inv_items[# 4,slot] = ds_map_dup(item);
    }
    else {
        inv_items[# 4,slot] = item;
    }
    inv[? "size"] += 1;
    amount -= q;
}
//if the item to insert is of the same type of the current item, try to increase the amount
else if(inv_item[? "key"] == key) {
    var inv_amount = ex_inv_get_amount(inv,slot);
    if(inv_amount < item[? "stack_size"]) {
        var q = min(item[? "stack_size"]-inv_amount,amount);
        inv_items[# 2,slot] += q;
        amount -= q;
    }
}

if(amount != argument2) { //inventory updated, callback on success
    var affected_slots = ds_list_create();
    ds_list_add(affected_slots,slot);
    ex_inv_updated(inv,affected_slots);
    ds_list_destroy(affected_slots);
}

return argument2 - amount;
