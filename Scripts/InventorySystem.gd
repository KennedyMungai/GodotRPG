extends Node


var player_inventory;
var current_inventory_index=0;
var is_visible = false;
var path = ".././inventory";

onready var inventory_text=get_node(path+"inventory_text");
onready var inventory_image=get_node(path+"inventory_image");
onready var inventory_description=get_node(path+"inventory_description");
onready var inventory_panel=get_node(path+"inventory_panel");
