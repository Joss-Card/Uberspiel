///ex_inv_get_item(inv,index)

/*
    Description:    returns the item in a specific slot
    Arguments:      inv: the inventory to look into
                    index: the slot index
    Returns:        The item in the inventory slot
*/

var inv,items,index;

inv = argument0;
index = argument1;
items = inv[? "items"];

return items[# 4,index];

