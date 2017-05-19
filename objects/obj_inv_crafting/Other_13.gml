///slot right pressed event

/*
    We don't want to allow taking only part of the resulting recipe, as
    we can't remove fraction of ingredients. Only perform this event on
    a crafting slot.
*/

var slot = other.id;

if(slot != result_slot) {
    event_inherited();
}

/* */
/*  */
