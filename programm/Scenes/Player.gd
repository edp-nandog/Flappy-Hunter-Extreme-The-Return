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
	
	
	if is_on_ceiling() or is_on_floor():
		movement.y = 0
		
	movement.y += GRAVITY * delta
	
	key_input()
	check_for_dead()
				
	move_and_slide(movement, UP_VECTOR)		
	
	set_animation()
	
	
func key_input():
	if Input.is_action_pressed("left"):
		if position.x > 15:
			movement.x = -1 * SPEED
		
	if Input.is_action_pressed("right"):
		if position.x < 630: 
			movement.x = +1 * SPEED
	
	if Input.is_action_just_pressed("jump") and is_on_floor():		
			movement.y = -JUMP_POWER
	
func set_animation():
	if movement.x < 0:
		$Sprite.flip_h = true
		$AnimationPlayer.play("walk")		
	if movement.x > 0:
		$Sprite.flip_h = false	
		$AnimationPlayer.play("walk")
		
	if movement.x == 0:
		$AnimationPlayer.play("stay")
		
	if is_on_floor() == false:
		$AnimationPlayer.play("jump")


func check_for_dead():
	for body in $HitBox.get_overlapping_bodies():
		if body.has_method("dead") and body.is_alive:
			body.dead()
