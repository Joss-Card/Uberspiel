///ex_inv_add(inv,item,amount)

/*
    Description:    inserts an item into an inventory
    Arguments:      inv: the inventory id to add the item to
                    item: either the item or its key
                    amount: quantity of the specified item to insert
    Returns:        The amount of items actually inserted (same as the amount 
                    argument if there's enough space in the inventory, less otherwise)
*/

var inv,amount,key,item,inv_items,affected_slots,stack_size;

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

//check if item is empty or amount 0, in which case, there's nothing to do
if(amount < 1 || item < 0) {return 0;}

//init variables
inv_items = inv[? "items"];
affected_slots = ds_list_create();
stack_size = item[? "stack_size"];

//if item is stackable, try adding the amount to the existing stacks
if(stack_size > 1 && ds_grid_value_exists(inv_items,1,0,1,ds_grid_height(inv_items)-1,key)) {
    for(var i=0;i<ds_grid_height(inv_items);i++) {
        var inv_item = ex_inv_get_item(inv,i);
        if(inv_item < 0) {continue;}
        var inv_amount = ex_inv_get_amount(inv,i);
        if(inv_item[? "key"] == key && inv_amount < stack_size) {
            var q = min(stack_size-inv_amount,amount);
            ds_list_add(affected_slots,i);
            inv_items[# 2,i] += q;
            amount -= q;
            if(amount < 1) {break;}
        }
    }
}

//add the remaining items to the inventory, in multiple stacks when needed
while(amount > 0) {
    if(inv[? "size"] == inv[? "max_size"]) {break;}
    var s = ds_grid_value_y(inv_items,1,0,1,ds_grid_height(inv_items)-1,"");
    var q = min(stack_size,amount);
    ds_list_add(affected_slots,s);
    inv_items[# 1,s] = key;
    inv_items[# 2,s] = q;
    inv_items[# 3,s] = item[? "base_key"];
    if(item[? "unique"]) {
        inv_items[# 4,s] = ds_map_dup(item);
    }
    else {
        inv_items[# 4,s] = item;
    }
    inv[? "size"] += 1;
    amount -= q;
}

if(argument2 != amount) { //inventory updated callback on success
    ex_inv_updated(inv,affected_slots);
}
ds_list_destroy(affected_slots);

return argument2 - amount;

