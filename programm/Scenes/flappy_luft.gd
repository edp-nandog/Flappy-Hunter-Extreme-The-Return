extends KinematicBody2D

const SPEED = 40
const JUMP_POWER = 300
const UP_VECTOR = Vector2(0, -1)

var movement = Vector2(SPEED, 0)
var is_alive = true


func _ready():
	$AnimatedSprite.play("fly")
	pass
	
func _physics_process(delta):
	if is_alive == false:
		return
	
	
	
	move_and_slide_with_snap(movement, Vector2(0, 1), UP_VECTOR)
	
	if is_on_wall():
		
		movement.x *= -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		

func dead():
	$AnimatedSprite.play("dead")
	is_alive = false
	
func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "dead":
		queue_free()
		
