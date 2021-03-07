extends Node2D

onready var time_up_card = $TimeUpCard
onready var get_ready_card = $GetReadyCard
onready var deliver_zone = $DeliverZone
onready var points_control = $Control/PointsControl

var skull_scene = load("res://src/actors/skull/Skull.tscn")
var _good_soul_buffer

func _ready():
	var _diss
	_diss = Events.connect("soul_grabbed", self, "_spawn_skull")
	_diss = Events.connect("end_game", self, "_on_game_ended")
	_diss = Events.connect("bad_end", self, "_on_bad_end")
	_diss = Events.connect("game_started", self, "_on_game_started")
	Events.emit_signal("soul_delivered")
	Events.emit_signal("gameplay_music")
	_on_pre_game()
	$Control/TimerControl/Timer.wait_time = 60

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


#func _input(event):
#	if event.is_action_pressed("reset"):
#		var _diss = get_tree().reload_current_scene()
	
func _on_game_ended():
	GameManager.get_node_or_null("Node2D/GameplayMusic").playing = false
	get_tree().paused = true

	# Update Player Data
	PlayerData.set_good_soul(deliver_zone.good_soul_ammount)
	PlayerData.set_bad_soul(deliver_zone.bad_soul_ammount)
	PlayerData.set_total_points(points_control.current_points)

	time_up_card.get_node("AnimationPlayer").play("move-card")
	yield(time_up_card.get_node("AnimationPlayer"), "animation_finished")
	GameManager.fade_in()
	yield(GameManager.transition_fade.get_node("AnimationPlayer"), "animation_finished")
	var _diss = get_tree().change_scene("res://src/scenes/EndGame.tscn")
	pass

func _on_bad_end():
	GameManager.get_node_or_null("Node2D/GameplayMusic").playing = false
	get_tree().paused = true
	GameManager.fade_in()
	yield(GameManager.transition_fade.get_node("AnimationPlayer"), "animation_finished")
	var _diss = get_tree().change_scene("res://src/scenes/BadEnd.tscn")
	
func _on_game_started():
	$Control/TimerControl/Timer.start()

func _on_pre_game():
	GameManager.fade_out()
	yield(GameManager.transition_fade.get_node("AnimationPlayer"), "animation_finished")
	get_ready_card.get_node("AnimationPlayer").play("move-card")
	yield(get_ready_card.get_node("AnimationPlayer"), "animation_finished")
	get_ready_card.queue_free()
	Events.emit_signal("game_started")
