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
