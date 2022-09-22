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


func _process(delta: float) -> void:
	if(is_visible):
#		Some code to be added
		pass;
	else:
		if(Input.is_action_just_pressed("inventory")):
			is_visible=true;


func check_inventory():
	for i in range(player_inventory.size()):
		print(player_inventory[i].item.info());


func display_ui(toggle: bool) -> void:
	if(toggle):
		inventory_text.show();
		inventory_panel.show();
		inventory_image.show();
		inventory_description.show();
	else:
		inventory_text.hide();
		inventory_panel.hide();
		inventory_image.hide();
		inventory_description.hide();
