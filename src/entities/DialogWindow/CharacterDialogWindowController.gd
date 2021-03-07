extends Control

signal button_left_pressed
signal dialog_box_closed

export(String) var dialog_dictionary

onready var dialog_content = $DialogBox/TextContainer/RichTextLabel
onready var dialog_tween = $DialogBox/TextContainer/RichTextLabel/Tween
onready var dialog_arrow = $DialogBox/Arrow

var _is_dialog_active : bool = false
var _dialog_box_scene : PackedScene = load("res://src/entities/DialogWindow/DialogBox.tscn")

func _init():
	self.call_deferred("add_child", _dialog_box_scene.instance())
	pass

func _ready() -> void:
	dialog_tween.connect("tween_completed", self, "_text_tween_finished")
	pass

func create_dialog_box() -> void:
	
	get_node("DialogBox").visible = true
	dialog_arrow.visible = false
	var dict  = GameManager.get_node("DialogDictionaryEntity").dialog_dictionary[dialog_dictionary]
	
	for i in range(dict.size()):
		var key = "id_dialog_" + str(i+1)
		dialog_content.text = dict[key]
		dialog_tween.interpolate_property(dialog_content, "percent_visible", 0, 1, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		dialog_tween.start()
		
		_is_dialog_active = true
		
		yield(self, "button_left_pressed")

	get_node("DialogBox").visible = false
	emit_signal("dialog_box_closed")

func _input(event):
	if event is InputEventMouseButton \
		and event.button_index == BUTTON_LEFT \
		and event.pressed \
		and _is_dialog_active:
			_is_dialog_active = false
			emit_signal("button_left_pressed")

			
func _text_tween_finished(_object: Object, _key: NodePath):
	dialog_arrow.visible = true
