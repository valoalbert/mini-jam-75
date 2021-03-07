extends Node2D

export (String, FILE, "*.tscn") var scene

onready var start_button = $StartControls/StartButton


func _ready():
	GameManager.fade_out()
	start_button.connect("pressed", self, "_on_start_button_pressed")
	var _diss




func _on_start_button_pressed():
	$AnimationPlayer.play("start_game")
	yield($AnimationPlayer, "animation_finished")
	GameManager.fade_in()
	yield(GameManager.transition_fade.get_node("AnimationPlayer"), "animation_finished")
	var _diss = get_tree().change_scene(scene)

 