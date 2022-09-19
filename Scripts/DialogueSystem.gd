extends Node


var name_of_character: String;
var dialogues=[];
var nb_dialogues: int;
var current_dialogue_index:int = 0;
var waiting_for_user_input: bool = false;
var dialogue_is_active
var characters: Dictionary;
var current_character:String="Diana";
onready var player = get_node("../Player_character");
onready var dialogue_panel = get_node("../dialogue_panel");
onready var dialogue_text = get_node("../dialogue_panel/dialogue_text");
onready var dialogue_image = get_node("../dialogue_panel/dialogue_image");


func read_json_file() -> void:
	var file = File.new();
	file.open("res://Dialogues/dialogues.json");
	var json_data = parse_json(file.get_as_text());
	var json = to_json(json_data);
	characters = JSON.parse(json).result;
