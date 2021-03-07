extends Node2D

onready var dialog_box = $CharacterDialogWindow

var good_soul_ammount
var bad_soul_ammount

func _ready():
	get_tree().paused = false
	good_soul_ammount = PlayerData.get_good_soul()
	bad_soul_ammount = PlayerData.get_bad_soul()

	GameManager.fade_out()
	yield(GameManager.transition_fade.get_node("AnimationPlayer"), "animation_finished")

	_on_trigger_conclusion()
	dialog_box.connect("dialog_box_closed", self, "_on_restart_game")
# gather player data soul ammount

func _on_trigger_conclusion():
	dialog_box.dialog_dictionary = "ingame"

	dialog_box.create_dialog_box()

func _on_restart_game():
	GameManager.fade_in()
	yield(GameManager.transition_fade.get_node("AnimationPlayer"), "animation_finished")
	var _diss = get_tree().change_scene("res://src/scenes/MainMenu.tscn")
	pass
