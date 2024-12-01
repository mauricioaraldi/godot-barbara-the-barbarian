extends Node3D

@export var turret: PackedScene
@export var enemy_path: Path3D

func build_turret(turret_position: Vector3) -> void:
  var new_turret = turret.instantiate()

  new_turret.global_position = turret_position
  new_turret.enemy_path = enemy_path

  add_child(new_turret)
