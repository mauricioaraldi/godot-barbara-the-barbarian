extends PathFollow3D

@export var speed: float = 15

@onready var base = get_tree().get_first_node_in_group("base")

func _process(delta: float) -> void:
	progress += delta * speed
	
	if progress_ratio == 1:
		base.take_damage()
		queue_free()
