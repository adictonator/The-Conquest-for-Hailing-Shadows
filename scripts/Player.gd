extends KinematicBody2D

export var SPEED = 120
var velocity = Vector2.ZERO
onready var inventoryUI = preload('res://scenes/Inventory.tscn')

func _physics_process(_delta: float) -> void:
	velocity = Vector2.ZERO

	if Input.is_action_pressed('move_left'):
		velocity.x -= 1
	if Input.is_action_pressed('move_right'):
		velocity.x += 1
	if Input.is_action_pressed('move_up'):
		velocity.y -= 1
	if Input.is_action_pressed('move_down'):
		velocity.y += 1

	if Input.is_action_pressed('move_left') && Input.is_action_pressed('move_right'):
		velocity = Vector2.ZERO

	velocity = velocity.normalized() * SPEED
	velocity = move_and_slide(velocity, Vector2.UP)
	#velocity.x = lerp(velocity.x, 0, 0.2)
	#velocity.y = lerp(velocity.y, 0, 0.2)

	if Input.is_action_just_pressed('toggleInventory'):
		if get_viewport().get_node('Inventory'):
			get_viewport().remove_child(get_viewport().get_node('Inventory'))
		else:
			get_viewport().add_child(inventoryUI.instance())
