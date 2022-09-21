extends Node


class_name Item
	
enum item_type { APPLE = 0, MEAT = 1, GOLD = 2, RED_DIAMOND = 3,BLUE_DIAMOND = 4, YELLOW_DIAMOND = 5, SWORD = 6, BATON = 7};
enum item_family_type { FOOD = 0, LOOT = 1, WEAPON = 3 };

var item_type_names = ["APPLE", "MEAT", "GOLD", "RED_DIAMOND", "BLUE_DIAMOND", "YELLOW_DIAMOND", "SWORD", "BATON"];
var item_name: String;
var description: String;
var price: int;
var health_benefits: int;
var damage:int;
var type: int;
var family_type: int;
var nb:int;
var max_nb: int;
var article: String;


func _init(the_new_type) -> void:
	match(the_new_type):
		item_type.APPLE:
			name="APPLE";
			price=50;
			health_benefits=10;
			damage=0;
			nb=1;
			max_nb=5;
			description="A juicy apple";
			family_type=item_family_type.FOOD;
			article="an";
		item_type.MEAT:
			name="Meat";
			price=50;
			health_benefits=30;
			damage=0;
			nb=1;
			max_nb=2;
			description="A nice piece of cooked meat to nurture your muscles";
			family_type=item_family_type.FOOD;
			article="some";
