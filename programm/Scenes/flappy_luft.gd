extends KinematicBody2D

const SPEED = 40
const JUMP_POWER = 300
const UP_VECTOR = Vector2(0, -1)

var movement = Vector2(SPEED, 0)
var is_alive = true
var t = Timer.new()


func _ready():
	$AnimatedSprite.play("dead")
	if is_alive == false:
		t.set_wait_time(5)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		is_alive = true
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
	$AnimatedSprite.play("die")
	
func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "die":
		is_alive = false
	if is_alive == false:
		_ready()
		
