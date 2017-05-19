{
	/*
    This object should never be instantiated, you need to create specific panels
    with this object as parent, each one representing an inventory type.
    E.g: toolbar panel, chest panel, crafting panel, ...
*/
//initialize generic panel properties
inv = -1; //inventory linked to this panel
slots = -1; //array of slot instances linked to the panel
/*  this flag is used to temporarily disable recipe checking every time a slot is updated,
    for performance purposes */
inventory_changed_callback = true;
/* */
/*  */
/**/
}
