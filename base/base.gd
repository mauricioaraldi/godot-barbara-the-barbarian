extends Node3D

var threshold_health_danger: float = 5

@export var health: float = 5:
  set(health_in):
    health = health_in
    label_3d.text = str(health_in)
    label_3d.modulate = Color.RED.lerp(Color.WHITE, health / threshold_health_danger)

    if health_in < 1:
      get_tree().reload_current_scene()

@onready var label_3d: Label3D = $Label3D

func _ready() -> void:
  label_3d.text = str(health)

func take_damage() -> void:
  health -= 1;
