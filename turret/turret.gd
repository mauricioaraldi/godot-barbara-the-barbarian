extends Node3D

@export var projectile: PackedScene
@export var range: float = 10

@onready var inner_cannon: MeshInstance3D = $Base/Top/OuterCannon/InnerCannon
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var enemy_path: Path3D
var cur_enemy: PathFollow3D

func _physics_process(delta: float) -> void:
  cur_enemy = find_target()

  if cur_enemy:
    look_at(cur_enemy.global_position, Vector3.UP, true)

func _on_timer_timeout() -> void:
  if not cur_enemy:
    return

  var shot = projectile.instantiate()

  shot.global_position = inner_cannon.global_position
  shot.direction = global_transform.basis.z

  add_child(shot)

  animation_player.play("Fire")


func find_target() -> PathFollow3D:
  var enemies = enemy_path.get_children()

  for enemy in enemies:
    if enemy is not PathFollow3D:
      continue

    if global_position.distance_to(enemy.global_position) <= range:
      return enemy

  return null
