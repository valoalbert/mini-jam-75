extends Control

onready var label = $Points

var current_points : int

func _ready():
	var _diss
	_update_text_label(0)
	_diss = Events.connect("score_updated", self, "_update_text_label")
	current_points = 0


func _update_text_label(points):
	var text : String

	current_points = current_points + points
	text = "Souls Weight: " + str(current_points)
	label.text = text