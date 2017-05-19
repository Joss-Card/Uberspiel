///ex_inv_get_key(inv,index)

/*
    Description:    returns the key of an item in a specific slot
    Arguments:      inv: the inventory to look into
                    index: the slot index
    Returns:        The key of the item in the inventory slot
*/

var inv,items,index;

inv = argument0;
index = argument1;
items = inv[? "items"];

return items[# 1,index];
