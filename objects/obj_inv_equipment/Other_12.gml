{
	///slot left pressed event
//check if we are trying to insert a valid item in the slot
var slot = other.id;
if(inv_equipment_allowed(slot)) {
    event_inherited();
}
}
