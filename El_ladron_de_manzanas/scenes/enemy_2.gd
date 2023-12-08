extends CharacterBody2D

var speed = 30.0
const gravity = 500
var facing_right = true

func _ready():
	$AnimatedSprite2D.play("walk")

func _physics_process(delta):
	var objeto_colision = $RayCast2D2.get_collider()
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if !$RayCast2D.is_colliding() || $RayCast2D2.is_colliding():
		if is_on_floor():
			flip()
		
	velocity.x = speed
	move_and_slide()

func flip():
	facing_right = !facing_right
	
	scale.x = abs(scale.x) * -1
	if facing_right:
		speed = abs(speed)
	else:
		speed = abs(speed) * -1
