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


func _input(event: InputEvent) -> void:
	if(Input.is_action_pressed("move_fwd")):
		current_state = WALK;
	elif(Input.is_action_pressed("move_back")):
		current_state = WALK_REVERSE;
	else:
		current_state = IDLE;
		
	if(Input.is_action_pressed("turn_left")):
		rotate_y(rotation_increment);
	elif(Input.is_action_pressed("turn_right")):
		rotate_y(-rotation_increment);
	
	if(Input.is_key_pressed(KEY_SHIFT)):
		current_state = RUN;
