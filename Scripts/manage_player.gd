extends KinematicBody


enum {IDLE, WALK, WALK_REVERSE, RUN};
var rotation_increment = 0.2;
var current_state=IDLE;
var speed = 1;
onready var pc_node = get_node("pc/AnimationPlayer");


func _ready() -> void:
	pc_node.get_animation("idle").loop = true;
	pc_node.get_animation("walking").loop = true;
	pc_node.get_animation("running").loop = true;


func _process(delta: float) -> void:
	match current_state:
		IDLE:
			pass
		WALK:
			pass
		WALK_REVERSE:
			pass
		RUN: 
			pass
