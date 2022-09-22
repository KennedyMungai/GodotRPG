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
		item_type.RED_DIAMOND:
			name="Red diamond";
			price=250;
			health_benefits=0;
			damage=0;
			nb=1;
			max_nb=10;
			description="A valuable diamond crafted by the best jewellers woth some known magic properties";
			family_type=item_family_type.LOOT;
			article="a";
		item_type.YELLOW_DIAMOND:
			name="Yellow Diamond";
			price=200;
			health_benefits=0;
			damage=0;
			nb=1;
			max_nb=10;
			description="A valuable diamond crafted by the best jewellers with some known magic properties";
			family_type=item_family_type.LOOT;
			article="a";
		item_type.BLUE_DIAMOND:
			name="Blue Diamond";
			price=100;
			health_benefits=0;
			damage=0;
			nb=1;
			max_nb=10;
			description="A valuable diamond crafted by the best jewellers with some known magic properties";
			family_type=item_family_type.LOOT;
			article="a";
		item_type.GOLD:
			name="Gold";
			price=100;
			health_benefits=0;
			damage=0;
			nb=10;
			max_nb=10;
			description="Gold Coins";
			family_type=item_family_type.LOOT;
			article="some";
		item_type.SWORD:
			name="Sword";
			price=100;
			health_benefits=0;
			damage=10;
			nb=1;
			max_nb=1;
			description="A powerful sword that defeats most opponents";
			family_type=item_family_type.WEAPON;
			article="a";
		item_type.BATON:
			name="Baton";
			price=50;
			health_benefits=0;
			damage=50;
			nb=1;
			max_nb=1;
			description="A simple wooden stick that you can handle easily";
			family_type=item_family_type.WEAPON;
			article="a";
	
	type=the_new_type;
			

func get_texture_path():
	var tx="";
	
	if(family_type == item_family_type.WEAPON):
		return "res://item_images/"+name.replace("", "_")+	".png";
	elif(family_type == item_family_type.FOOD):
		return "res://item_images/"+name.replace("", "_")+".png";
	elif(family_type == item_family_type.LOOT):
		return "res://item_images/"+name.replace("", "_")+".png";
	else:
		return "";


func item_info() -> String:	
	var info = "name: "+str(name)+", health benefits: "+str(health_benefits)+", damage: "+str(damage)+", nb: "+str(nb) + ", max Nb: "+str(max_nb)+", type:"+ str(item_type_names[type]);
	return info;
