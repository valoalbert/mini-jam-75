extends Node2D

onready var transition_fade = $Transitions/TransitionsControl

func _ready():
	$DialogDictionaryEntity.load_dictionary()
	pass

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

func fade_in():
	transition_fade.get_node("AnimationPlayer").play("fade_in")
	

	
func fade_out():
	transition_fade.get_node("AnimationPlayer").play("fade_out")
	