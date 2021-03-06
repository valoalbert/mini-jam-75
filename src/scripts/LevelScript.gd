extends Node2D

var skull_scene = load("res://src/actors/skull/Skull.tscn")

func _ready():
	var _diss
	_diss = Events.connect("soul_grabbed", self, "_spawn_skull")
	Events.emit_signal("soul_delivered")

func _spawn_skull(soul_type):
	print(soul_type)
	var skull = skull_scene.instance()
	if soul_type == 1:
		skull.animation = "green_skull"
	if soul_type == 0:
		skull.animation = "red_skull"

	$Player/SoulCarry.add_child(skull)


func _input(event):
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()
	