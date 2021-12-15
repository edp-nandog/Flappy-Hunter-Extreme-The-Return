extends KinematicBody2D

const GRAVITY = 400
const SPEED = 100
const JUMP_POWER = 300
const UP_VECTOR = Vector2(0, -1)

var movement = Vector2()
var on_ground = false

func _ready():
	pass 


func _process(delta):
	movement.x = 0
	movement.y += GRAVITY * delta
	
	key_input()
				
	move_and_slide(movement, UP_VECTOR)		
	
	
	
func key_input():
	if Input.is_action_pressed("left"):
		if position.x > 15:
			movement.x = -1 * SPEED
		
	if Input.is_action_pressed("right"):
		if position.x < 630: 
			movement.x = +1 * SPEED
	
	if Input.is_action_just_pressed("jump"):
		if on_ground == true:
			movement.y = -JUMP_POWER
			on_ground = false
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
					
