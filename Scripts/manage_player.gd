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
			pc_node.play("idle");
		WALK:
			speed = 1;
			pc_node.play("walking");
			var forward = global_transform.basis.z;
			move_and_slide(forward*speed, Vector3.UP);
		WALK_REVERSE:
			speed = -1;
			pc_node.play("walking")
			var forward = global_transform.basis.z;
			move_and_slide(forward*speed, Vector3.UP);
		RUN: 
			speed = 4;
			pc_node.play("running");
			var forward = global_transform.basis.z;
			move_and_slide(forward*speed, Vector3.UP);
