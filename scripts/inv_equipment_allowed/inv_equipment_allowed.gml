///inv_equipment_allowed(slot)

/*
    Description:    Checks if the equipment we are trying to put into
                    a slot of obj_inv_equipment is allowed
    Arguments:      
    Returns:        true if valid, false otherwise
*/

var item, item_type, slot;

item = obj_inv_mouse.slots[0].item;
if(item >= 0) {
    item_type = string_copy(item[? "key"],1,string_pos("_",item[? "key"])-1);
}
slot = argument0;

switch(slot) {
    case helmet_slot:
        if(item < 0 || (item_type == "armor" && item[? "category"] == "helmet")) {
            return true;
        }
        break;
    case body_slot:
        if(item < 0 || (item_type == "armor" && item[? "category"] == "cuirass")) {
            return true
        }
        break;
    case feet_slot:
        if(item < 0 || (item_type == "armor" && item[? "category"] == "boots")) {
            return true;
        }
        break;
    case left_hand_slot:
        if(item < 0) {return true;}
        else {
            var valid_armor = item_type == "armor" && item[? "category"] == "shield";
            var valid_weapon = item_type == "weapon";
            if(valid_armor || valid_weapon) {
                return true;
            }
        }
        break;
    case right_hand_slot:
        if(item < 0) {return true;}
        else {
            var valid_armor = item_type == "armor" && item[? "category"] == "shield";
            var valid_weapon = item_type == "weapon";
            if(valid_armor || valid_weapon) {
                return true;
            }
        }
        break;
}
