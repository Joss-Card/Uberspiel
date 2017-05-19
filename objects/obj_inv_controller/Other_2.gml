 {
	///initialize
/*
    Execute only once at game start
*/
randomize();
//init inventory system and load database
ex_init();
ex_db_load("inv_armor.csv","inv_food.csv","inv_potions.csv","inv_weapons.csv");
//create panel events
enum panel_events {
    init = 0,
    inventory_changed = 1,
    slot_left_pressed = 2,
    slot_right_pressed = 3,
    slot_updated = 4,
    cleanup = 15
}
//create slot events
enum slot_events {
    init = 0
}
/* */
///create crafting recipes
global.crafting_recipes = ds_list_create();
//fire sword = iron sword + fire arrow x 3
craft_add_recipe("weapon_flame_sword",1,"weapon_iron_sword","weapon_fire_arrow","weapon_fire_arrow","weapon_fire_arrow");
//health potion = cheese + bread
craft_add_recipe("potion_health",2,"food_cheese","food_bread");
//stamina potion = cheese + carrot
craft_add_recipe("potion_mana",2,"food_carrot","food_cheese");
//mana potion = bread + fish
craft_add_recipe("potion_stamina",2,"food_bread","food_fish");
/* */
/*  */
/**/
}
