extends Node2D

onready var character_dialog_box = $CharacterDialogWindow


func _ready():
	GameManager.fade_out()
	yield(GameManager.transition_fade.get_node("AnimationPlayer"), "animation_finished")
	character_dialog_box.create_dialog_box()
	character_dialog_box.connect("dialog_box_closed", self, "_on_transition_to_game")


func _on_transition_to_game():
	GameManager.fade_in()
	yield(GameManager.transition_fade.get_node("AnimationPlayer"), "animation_finished")
	var _diss = get_tree().change_scene("res://src/scenes/MainLevel.tscn")
