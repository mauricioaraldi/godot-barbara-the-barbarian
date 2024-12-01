extends MarginContainer

@onready var label: Label = $Label

@export var gold: float = 0:
  set(gold_in):
    gold = max(gold_in, 0)

    label.text = "Gold: " + str(gold)

func _ready() -> void:
  gold = 100
