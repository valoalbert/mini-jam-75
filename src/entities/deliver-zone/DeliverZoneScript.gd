extends Area2D

var good_soul_ammount : int = 0
var bad_soul_ammount : int = 0

func _ready():
	var _diss
	_diss = connect("area_entered", self, "_soul_delivered")


func _soul_delivered(area):
	Events.emit_signal("soul_delivered")
	Events.emit_signal("score_updated", area.get_parent().points)
	if area.get_parent().soul_type == 0:
		good_soul_ammount += 1
	else:
		bad_soul_ammount += 1
		
	area.get_parent().queue_free()
	pass
