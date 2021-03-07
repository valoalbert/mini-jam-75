extends Node2D

onready var transition_fade = $Transitions/TransitionsControl/TransitionFadePanel

func _ready():

	pass

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

