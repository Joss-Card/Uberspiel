{
	///save bag inventory to file
var path = get_save_filename("inventory files|*","");
if(path != "") {
    var f = file_text_open_write(path);
    file_text_write_string(f,ex_inv_write(bag_inv));
    file_text_close(f);
}
}
        