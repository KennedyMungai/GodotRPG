extends KinematicBody


enum {IDLE, WALK, WALK_REVERSE, RUN};
var rotation_increment = 0.2;
var current_state=IDLE;
var speed = 1;
onready var pc_node = get_node("pc/AnimationPlayer");


func _ready() -> void:
	pass;
