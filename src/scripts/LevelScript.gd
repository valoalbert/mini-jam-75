extends Node2D

onready var time_up_card = $TimeUpCard
onready var deliver_zone = $DeliverZone
onready var points_control = $Control/PointsControl

var skull_scene = load("res://src/actors/skull/Skull.tscn")


func _ready():
	var _diss
	_diss = Events.connect("soul_grabbed", self, "_spawn_skull")
	_diss = Events.connect("end_game", self, "_on_game_ended")
	Events.emit_signal("soul_delivered")

func _spawn_skull(soul_type):
	print(soul_type)
	var skull = skull_scene.instance()
	if soul_type == 0:
		# good souls
		skull.get_node("AnimatedSprite").animation = "green_skull"
		skull.set_points(21)
		skull.set_type(0)
	if soul_type == 1:
		# bad souls
		skull.get_node("AnimatedSprite").animation = "red_skull"
		skull.set_points(9)
		skull.set_type(1)

	$Player/SoulCarry.add_child(skull)


func _input(event):
	if event.is_action_pressed("reset"):
		var _diss = get_tree().reload_current_scene()
	
func _on_game_ended():
	get_tree().paused = true

	# Update Player Data
	PlayerData.set_good_soul(deliver_zone.good_soul_ammount)
	PlayerData.set_bad_soul(deliver_zone.bad_soul_ammount)
	PlayerData.set_total_points(points_control.current_points)

	time_up_card.get_node("AnimationPlayer").play("move-card")
	yield(time_up_card.get_node("AnimationPlayer"), "animation_finished")
	print("endgame")
	pass
