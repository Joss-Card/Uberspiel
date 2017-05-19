///on create event

//create the slot for the resulting items
result_slot = inv_slot_create(240,0,id,array_length_1d(slots)-1);

//create slot instances for the ingredients
var num_ingredients = 4;
for(var i=0; i < num_ingredients; i++) {
    crafting_slots[i] = inv_slot_create(48*(i mod num_ingredients),0,id,i);
}

