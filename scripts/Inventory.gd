extends Control

onready var wrapper = $Wrapper
var holdingItem = null

func _ready() -> void:
	for slot in wrapper.get_children():
		slot.connect('gui_input', self, '_userInput', [slot])

func _userInput(event: InputEvent, slot: Slot) -> void:
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
			if holdingItem != null:
				if !slot.item:
					slot.place(holdingItem)
					holdingItem = null
				else:
					print('here now')
					var tempItem = slot.item
					slot.pick()
					tempItem.rect_position = event.global_position
					slot.place(holdingItem)
					holdingItem = tempItem
			elif slot.item:
				holdingItem = slot.item
				slot.pick()
				holdingItem.rect_position = get_global_mouse_position()

func _input(_event: InputEvent) -> void:
	if holdingItem:
		holdingItem.rect_position = get_global_mouse_position()

