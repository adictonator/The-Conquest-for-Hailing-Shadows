extends Panel
class_name Slot

onready var pickableItem = preload('res://scenes/PickableItem.tscn')
var defaultTexture = preload('res://assets/UI/CloseButtonPressed.png')
var emptyTexture = preload('res://assets/UI/TickBox.png')
var item = null
var stylePanel: StyleBoxTexture = StyleBoxTexture.new()
var updatedTexture = defaultTexture

func _ready() -> void:
	if randi() % 2 == 0:
		item = pickableItem.instance()
		add_child(item)
	refreshStyle()

func refreshStyle():
	if item == null:
		stylePanel.texture = emptyTexture
	else:
		stylePanel.texture = defaultTexture

	set('custom_styles/panel', stylePanel)

func pick() -> void:
	remove_child(item)
	var inventoryNode = find_parent('Inventory')
	inventoryNode.add_child(item)
	item = null
	refreshStyle()

func place(placedItem) -> void:
	item = placedItem
	item.rect_position = Vector2(0,0)
	var inventoryNode = find_parent('Inventory')
	inventoryNode.remove_child(item)
	add_child(item)
	refreshStyle()

