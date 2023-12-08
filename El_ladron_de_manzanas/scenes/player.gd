extends CharacterBody2D


class_name player

@export var bullet : PackedScene

var speed = 200
var direccion = 0.0
var jump = 210
var leaved_floor: bool = false
var hadJump: bool = false
var maxJumps: int = 2
var countJumps: int = 0
var allowAnimation: bool = false
const gravity = 500

func _ready():
	Global.player = self
	frutasLabel.text = str(Global.frutas, " / 6")

@onready var anim = $AnimatedSprite2D
@onready var frutasLabel = $PlayerGUI/HBoxContainer/Label2
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
		hadJump = false
		countJumps = 0
		
	if Input.is_action_just_pressed("up") and rightToJump():
		velocity.y = -jump
		anim.play("Jump")
		$jumpSound.play()
		countJumps +=1
	
	move_and_slide()
	
	animaciones()
	
func rightToJump():
	if hadJump:
		if countJumps < maxJumps: return true
		else: return false
	if is_on_floor():
		hadJump = true
		return true
	
func animaciones():
	if is_on_floor():
		if velocity.x != 0:
			anim.play("Run")
		else:
			anim.play("Idle")

		
func actualizaInterfazFrutas():
	frutasLabel.text = str(Global.frutas, " / 6")
