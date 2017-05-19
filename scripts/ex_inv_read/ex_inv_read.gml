///ex_inv_write(inv)

/*
    Description:    Creates and returns an inventory from a JSON encoded string
                    generated from ex_inv_write.
    Arguments:      inv: the data to read
    Returns:        an inventory reference
*/

var inv,json,items_list,items_grif;

inv = json_decode(argument0);
items_grid = ds_grid_create(5,inv[? "max_size"]);
items_list = inv[? "items"];

//load items
for(var i=0; i<ds_list_size(items_list); i++) {
    var item = items_list[| i];
    items_grid[# 0,i] = i;
    items_grid[# 1,i] = item[? "key"];
    items_grid[# 2,i] = item[? "amount"];
    if(ds_map_exists(item,"data")) {
        var data = item[? "data"];
        items_grid[# 3,i] = data[? "base_key"];
        items_grid[# 4,i] = ds_map_dup(data);    
    }
    else if(item[? "key"] != "") {
        items_grid[# 3,i] = item[? "key"];
        items_grid[# 4,i] = ex_db_get(item[? "key"]);
    }
    else {
        items_grid[# 3,i] = "";
        items_grid[# 4,i] = -1;
    }
}

//delete unneeded data
ds_list_destroy(items_list);
ds_map_delete(inv,"items");

//set items grid back
inv[? "items"] = items_grid;

return inv;
