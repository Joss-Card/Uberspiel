///ex_inv_write(inv)

/*
    Description:    returns a JSON encoded string that containing
                    all the inventory data, to be used for example to save
                    the inventory to file.
    Arguments:      inv: the inventory to write
    Returns:        a JSON string
*/

var inv,json,items_grid,items_list;

inv = argument0;
items_grid = inv[? "items"];

//prepare list of items
items_list = ds_list_create();
for(var i=0; i<ds_grid_height(items_grid); i++) {
    var item = ds_map_create();
    var inv_item = ex_inv_get_item(inv,i);
    item[? "key"] = ex_inv_get_key(inv,i);
    item[? "amount"] = ex_inv_get_amount(inv,i);
    if(inv_item >= 0 && inv_item[? "unique"]) {
        ds_map_add_map(item,"data",ds_map_dup(inv_item));
    }
    ds_list_add(items_list,item);
    ds_list_mark_as_map(items_list,i);
}

//add the list to the inventory
ds_map_delete(inv,"items");
ds_map_add_list(inv,"items",items_list);

//encode the data
json = json_encode(inv);

//revert items back
ds_list_destroy(items_list);
ds_map_delete(inv,"items");
inv[? "items"] = items_grid;

//return encoded data
return json;

