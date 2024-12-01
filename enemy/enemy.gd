extends PathFollow3D

@onready var bank = get_tree().get_first_node_in_group("bank")

@export var reward: float = 50
@export var speed: float = 10
@export var health: float = 1:
  set(health_in):
    if health_in < health:
      animation_player.play("TakeDamage")

    health = health_in

    if health < 1:
      queue_free()
      bank.gold += reward

@onready var base = get_tree().get_first_node_in_group("base")
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _process(delta: float) -> void:
  progress += delta * speed

  if progress_ratio == 1:
    base.take_damage()
    queue_free()
