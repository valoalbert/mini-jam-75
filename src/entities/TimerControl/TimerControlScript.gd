extends Control

onready var label = $TimerLabel
onready var timer = $Timer


func _ready():
	timer.connect("timeout", self, "_on_timer_timeout")

func _process(_delta):
	label.text = "Time: " + str(int(timer.time_left))

func _on_timer_timeout():
	Events.emit_signal("end_game")
	pass
