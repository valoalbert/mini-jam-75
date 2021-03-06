extends Area2D

func _ready():
	var _diss
	_diss = connect("body_entered", self, "_soul_delivered")

func _soul_delivered(body):
	print("soul type: ", body.soul_type)
	if body._state == 1:
		body.get_node("SoulCarry/Skull").queue_free()
		body._state = 0

	pass
