extends Camera3D

@export var gridMap: GridMap
@export var turret_manager: Node3D
@export var turret_cost: float = 100

@onready var ray_cast_3d: RayCast3D = $RayCast3D
@onready var bank = get_tree().get_first_node_in_group("bank")

func _process(delta: float) -> void:
  var mouse_position: Vector2 = get_viewport().get_mouse_position()

  ray_cast_3d.target_position = project_local_ray_normal(mouse_position) * 100
  ray_cast_3d.force_raycast_update()

  if ray_cast_3d.is_colliding():
    if bank.gold < turret_cost:
      return

    var collider = ray_cast_3d.get_collider()

    Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

    if (collider is GridMap) and Input.is_action_pressed('click'):
      var collision_point = ray_cast_3d.get_collision_point()
      var cell = gridMap.local_to_map(collision_point)

      if gridMap.get_cell_item(cell) == 0:
        var tile_position = gridMap.map_to_local(cell)

        gridMap.set_cell_item(cell, 1)
        turret_manager.build_turret(tile_position)
        bank.gold -= turret_cost
  else:
    Input.set_default_cursor_shape(Input.CURSOR_ARROW)
