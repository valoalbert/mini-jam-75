extends KinematicBody2D

export (int) var speed  # speed in pixels/sec

onready var grab_area = $GrabArea
onready var action_label = $ActionLabel
onready var sprite = $Sprite

enum {NO_SOUL, SOUL_CARRY}

var _state : int = NO_SOUL
var _have_soul : bool
var _able_to_grab : bool

var soul_type : int
var velocity = Vector2.ZERO

func _ready():
	var _diss
	speed = 100
	grab_area.connect("body_entered", self, "_soul_grab_area_entered")
	_diss = Events.connect("soul_delivered", self, "_back_to_normal")
	pass

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)

	match _state:
		NO_SOUL:
			sprite.frame = 0
			speed = 100
		SOUL_CARRY:
			sprite.frame = 1

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	if Input.is_action_pressed("action") and _able_to_grab:
		Events.emit_signal("soul_grabbed", soul_type)

		var bodies = $GrabArea.get_overlapping_bodies()
		bodies[0].delete_sprite()

		_able_to_grab = false
		_state = SOUL_CARRY
		
		if soul_type == 0:
			speed = 50
	
	velocity = velocity.normalized() * speed

func _soul_grab_area_entered(_body):
	action_label.visible = true
	
	if _state != SOUL_CARRY:
		_able_to_grab = true
		soul_type = _body.soul_type
	pass

func _back_to_normal():
	_state = NO_SOUL
