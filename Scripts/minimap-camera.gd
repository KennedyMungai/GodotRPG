extends Camera

onready var player = get_node("../../../Player_character");


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	transform.origin.x = player.transform.origin.x;
	transform.origin.z = player.transform.origin.z;
