extends Position2D

var light_soul_scene = load("res://src/actors/souls/SoulLight.tscn")
var heavy_soul_scene = load("res://src/actors/souls/SoulHeavy.tscn")

var spawned : bool

var _rng

func _ready():
	_rng = RandomNumberGenerator.new()
	var _diss
	_diss = Events.connect("soul_delivered", self, "_spawn_new_soul")
	

func _spawn_new_soul():
	if get_child_count() == 0:
		_rng.randomize()
		var soul_sprite
		var soul_type = _rng.randi_range(0,1)
		var soul_child

		match soul_type:
			0:
				soul_sprite = _rng.randi_range(0,1)
				soul_child = light_soul_scene.instance()
				soul_child.get_node("Sprite").frame = soul_sprite	
			1:
				soul_sprite = _rng.randi_range(2,3)
				soul_child = heavy_soul_scene.instance()
				soul_child.get_node("Sprite").frame = soul_sprite

		call_deferred("add_child", soul_child)
	pass
