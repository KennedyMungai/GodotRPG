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


func _ready() -> void:
	read_json_file();
#	start_dialogue();
	

func _process(delta: float) -> void:
	if(dialogue_is_active):
		if(!waiting_for_user_input):
			dialogue_panel.show();
			
			if(current_dialogue_index != -1):
#				display_dialogue1_for_character(current_character);
				display_dialogue2_for_character(current_character);
			else:
				dialogue_is_active = false;
				dialogue_panel.hide();
				waiting_for_user_input = true;
				current_dialogue_index = 0;
				player.end_talking();
		else:
			if(Input.is_action_just_released("dialogue_choice_1")):
				current_dialogue_index = return_target(0);
				waiting_for_user_input = false;
			if(Input.is_action_just_released("dialogue_choice_2")):
				current_dialogue_index = return_target(1);
				waiting_for_user_input = false;


func read_json_file() -> void:
	var file = File.new();
	file.open("res://Dialogues/dialogues.json", file.READ);
	var json_data = parse_json(file.get_as_text());
	var json = to_json(json_data);
	characters = JSON.parse(json).result;
	
	for character in characters:
		var name = characters[character].name;
		print("Name: "+name);
		
#		for dialogue in characters[character].dialogues:
#			print("Message: "+dialogue.content);
#			print("-> Option A: "+dialogue.choices[0].content);
#			print("-> Option B: "+dialogue.choices[1].content);
#
#			for choice in dialogue.choices:
#				print("-> Option: "+choice.content);
				

func return_target(the_choice:int) -> int:
	var the_target=-1;
	print("Return target");
	
	for character in characters:
		var name = characters[character].name;
		
		if(name == current_character):
			the_target = int(characters[character].dialogues[current_dialogue_index].choices[the_target].target);
			
	return the_target;
	
	
func display_dialogue1_for_character(the_name:String):
	for character in characters:
		var name = characters[character].name;
		
		if(name == the_name):
			print("Message: "+characters[character].dialogues[current_dialogue_index].content);
			print("1: "+characters[character].dialogues[current_dialogue_index].choices[0].content);
			print("2: "+characters[character].dialogues[current_dialogue_index].choices[1].content);


func start_dialogue() -> void:
	waiting_for_user_input = false;
	dialogue_is_active = true;


func display_dialogue2_for_character(the_name: String) -> void:
	for character in characters:
		var name = characters[character].name;
		var text_to_display = "["+ the_name +"]\n"
		
		if(name == the_name):
			text_to_display += "Message: " + characters[character].dialogues[current_dialogue_index].content;
			text_to_display += "\n-> Option 1: " + characters[character].dialogues[current_dialogue_index].choices[0].content;
			text_to_display += "\n-> Option 2: " + characters[character].dialogues[current_dialogue_index].choices[1].content;
			
			dialogue_text.text = text_to_display;
			waiting_for_user_input = true;
