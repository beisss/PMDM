extends CharacterBody2D


class_name player

@export var bullet : PackedScene

var speed = 120
var direccion = 0.0
var jump = 500
const gravity = 500

#func _ready():
#	Global.player = self

@onready var anim = $AnimatedSprite2D
@onready var frutasLabel = $PlayerGUI/HBoxContainer/FrutasLabel
func _physics_process(delta):
	
	velocity.y += gravity*delta
	
	if Input.is_action_pressed("right"):
		velocity.x = speed
		anim.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -speed
		anim.flip_h = true
	else:
		velocity.x = 0
	
	if is_on_floor():
		if Input.is_action_just_pressed("up"):
			velocity.y = -jump
	
	move_and_slide()
	
	animaciones()
	
func animaciones():
	if is_on_floor():
		if velocity.x != 0:
			anim.play("Run")
		else:
			anim.play("Idle")
	else:
		anim.play("Jump")
		
#func actualizaInterfazFrutas():
#	frutasLabel.text = str(Global.frutas)
