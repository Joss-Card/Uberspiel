{
	///load bag inventory from file
var path = get_open_filename("inventory files|*","");
if(path != "") {
    //destroy the current panel and its inventory first
    with(bag_panel) {instance_destroy();}
    ex_inv_destroy(bag_inv);
    //read the data from the file
    var f = file_text_open_read(path);
    bag_inv = ex_inv_read(file_text_read_string(f));
    file_text_close(f);
    //create the new panel
    bag_panel = inv_panel_create(bag_inv,obj_inv_bag,96,96);
}
}
