extends KinematicBody2D

const SPEED = 40
const JUMP_POWER = 300
const UP_VECTOR = Vector2(0, -1)

var movement = Vector2(SPEED, 0)

func _ready():
	$AnimatedSprite.play("walk")
	pass
	
func _physics_process(delta):

	
	
	
	move_and_slide_with_snap(movement, Vector2(0, 1), UP_VECTOR)
	
	if is_on_wall():
		movement.x *= -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
