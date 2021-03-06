extends Node2D

export (String, FILE, "*.tscn") var scene

onready var start_button = $StartControls/StartButton
onready var character_dialog = $CharacterDialogWindow
onready var volume = $StartControls/HSlider

func _ready():
	volume.value = GameManager.volume
	PlayerData.set_bad_soul(0)
	PlayerData.set_good_soul(0)
	GameManager.fade_out()
	yield(GameManager.transition_fade.get_node("AnimationPlayer"), "animation_finished")
	Events.emit_signal("main_menu_music")
	start_button.connect("pressed", self, "_on_start_button_pressed")
	character_dialog.connect("dialog_box_closed", self, "_on_transition_to_game")
	volume.connect("value_changed", GameManager, "_change_volume")

func _on_start_button_pressed():
	$AnimationPlayer.play("start_game")
	yield($AnimationPlayer, "animation_finished")
	character_dialog.create_dialog_box()

func _on_transition_to_game():
	GameManager.fade_in()
	yield(GameManager.transition_fade.get_node("AnimationPlayer"), "animation_finished")
	var _diss = get_tree().change_scene("res://src/scenes/MainLevel.tscn")
