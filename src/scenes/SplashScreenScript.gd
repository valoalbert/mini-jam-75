extends Node2D

func _ready():
	_full_flow()


func _full_flow():
	GameManager.fade_out()
	yield(GameManager.transition_fade.get_node("AnimationPlayer"), "animation_finished")
	$Timer.start()
	yield($Timer, "timeout")
	GameManager.fade_in()
	yield(GameManager.transition_fade.get_node("AnimationPlayer"), "animation_finished")
	var _diss = get_tree().change_scene("res://src/scenes/MainMenu.tscn")