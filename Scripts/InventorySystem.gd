extends Node


var player_inventory;
var current_inventory_index=0;
var is_visible = false;
var path = ".././inventory";

onready var inventory_text=get_node(path+"inventory_text");
onready var inventory_image=get_node(path+"inventory_image");
onready var inventory_description=get_node(path+"inventory_description");
onready var inventory_panel=get_node(path+"inventory_panel");


func _ready() -> void:
	display_ui(false);
	player_inventory=[];
	var new_item = Item.new(Item.item_type.GOLD);
	player_inventory.push_back(new_item);
	new_item=Item.new(Item.item_type.MEAT);
	player_inventory.push_back(new_item);
	player_inventory[1].nb=300;


func check_inventory():
	for i in range(player_inventory.size()):
		print(player_inventory[i].item.info());
