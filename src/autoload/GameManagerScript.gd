extends Node2D

onready var transition_fade = $Transitions/TransitionsControl

var volume = 0

func _ready():
	var _diss
	$DialogDictionaryEntity.load_dictionary()
	_diss = Events.connect("main_menu_music", self, "_on_play_main_menu")
	_diss = Events.connect("gameplay_music", self, "_on_play_gameplay")
	pass

#func _input(event):
#	if event.is_action_pressed("ui_cancel"):
#		get_tree().quit()

func _on_play_main_menu():
	$Node2D/GameplayMusic.playing = false
	$Node2D/Mainmenu.playing = true

func _on_play_gameplay():
	$Node2D/Mainmenu.playing = false
	$Node2D/GameplayMusic.playing = true

func fade_in():
	transition_fade.get_node("AnimationPlayer").play("fade_in")
	

	
func fade_out():
	transition_fade.get_node("AnimationPlayer").play("fade_out")
	
func _change_volume(volume_arg):
	volume = volume_arg
	$Node2D/GameplayMusic.volume_db = volume
	$Node2D/Mainmenu.volume_db = volume