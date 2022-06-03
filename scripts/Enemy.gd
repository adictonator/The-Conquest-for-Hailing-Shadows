extends KinematicBody2D

var dialog
var isInteracting = false
onready var readyInputPressed = Input.is_action_pressed('interact')

func _ready() -> void:
	pass
	#const READY = Input.is_action_pressed('interact')

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed('interact') && isInteracting:
		print('checkk')
		startDialog()

func startDialog() -> void:
	dialog = Dialogic.start('first-npc')
	dialog.pause_mode = PAUSE_MODE_PROCESS
	add_child(dialog)
	dialog.connect('timeline_end', self, 'lol')
	# @todo: freeze player movements
	get_tree().paused = true

func _onInteracted(body:Node) -> void:
	print('body', body, isInteracting)
	# Start dialog when player interacts with a button press.
	isInteracting = true
	$AnimatedSprite/Control/InteractionIcon.visible = true

func lol(timeline_name):
	print('it eneded')
	isInteracting = false
	get_tree().paused = false
