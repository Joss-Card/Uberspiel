{
	///on create event
var items_per_row = 10;
//create slot instances (48 being the distance between one slot and the next)
for(var i=0; i < array_length_1d(slots); i++) {
    inv_slot_create(48*(i mod items_per_row),0,id,i);
}
}
