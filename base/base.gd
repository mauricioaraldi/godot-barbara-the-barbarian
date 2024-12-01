extends Node3D

@export var max_health: float = 5
@onready var label_3d: Label3D = $Label3D

var threshold_health_danger: float = 5
var health: float = 0:
  set(health_in):
    health = health_in
    label_3d.text = str(health_in)
    label_3d.modulate = Color.RED.lerp(Color.WHITE, health / threshold_health_danger)

    if health_in < 1:
      get_tree().reload_current_scene()


func _ready() -> void:
  health = max_health

func take_damage() -> void:
  health -= 1;
