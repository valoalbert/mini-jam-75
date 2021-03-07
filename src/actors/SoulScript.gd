extends StaticBody2D

enum soulType {LIGHT, HEAVY}
export (soulType) var soul_type

onready var label = $Label

var is_grabbed : bool


func _ready():
	var _diss
	label.text = str(soul_type)


func _process(_delta):

	pass

func delete_sprite():
	yield(get_tree().create_timer(1.0), "timeout")
	queue_free()