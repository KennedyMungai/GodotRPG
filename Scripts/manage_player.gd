extends KinematicBody


enum {IDLE, WALK, WALK_REVERSE, RUN};
var rotation_increment = 0.2;
var current_state=IDLE;
var speed = 1;
var name_of_current_npc_talking: String = "";
var is_talking: bool = false;

onready var pc_node = get_node("pc/AnimationPlayer");
onready var dialogue_panel = get_node("../dialogue_panel");
onready var dialogue_box = get_node("../dialogue_panel/dialogue_box");
onready var dialogue_image = get_node("../dialogue_panel/dialogue_image");


func _ready() -> void:
	pc_node.get_animation("idle").loop = true;
	pc_node.get_animation("walking").loop = true;
	pc_node.get_animation("running").loop = true;
	dialogue_panel.hide();


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
			

func _physics_process(delta: float) -> void:
	for index in get_slide_count():
		var collision = get_slide_collision(index);
		
		if(collision.collider.is_in_group("NPC_TALK")):
			if(collision.collider.name == "Diana" && !is_talking):
				dialogue_image.texture = load("res://Images/Diana.jpg");
				collision.collider.start_dialogue();
				current_state = IDLE;
				is_talking = true;


func _input(event: InputEvent) -> void:
	if(is_talking):
		return;
	
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
