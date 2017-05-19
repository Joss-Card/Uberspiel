{
	///create inventories
//get all the items keys to generate some random items later
var db_keys = ex_db_keys();
//items held with the mouse are kept in an inventory with a single slot
mouse_inv = ex_inv_create(1);
inv_panel_create(mouse_inv,obj_inv_mouse,mouse_x,mouse_y);
//inventory representing player bag, initialized with random items
bag_inv = ex_inv_create(18); // (#) how many item slots, ((row width in obj_inv_bag))
for(var i=0; i<18; i++) {
    var item = choose("",db_keys[| irandom(ds_list_size(db_keys)-1)]);
    ex_inv_add_slot(bag_inv,item,irandom(64),i);
}
bag_panel = inv_panel_create(bag_inv,obj_inv_bag,96,96);
//inventory representing player toolbar, initialized with random items
toolbar_inv = ex_inv_create(10);
for(var i=0; i<10; i++) {
    var item = choose("",db_keys[| irandom(ds_list_size(db_keys)-1)]);
    ex_inv_add_slot(toolbar_inv,item,irandom(64),i);
}
toolbar_panel = inv_panel_create(toolbar_inv,obj_inv_toolbar,264,504);
//create a crafting table inventory
//crafting_inv = ex_inv_create(5);
//crafting_panel = inv_panel_create(crafting_inv,obj_inv_crafting,384,96);
//create a crafting table inventory
equipment_inv = ex_inv_create(5);
equipment_panel = inv_panel_create(equipment_inv,obj_inv_equipment,720,96);
}
