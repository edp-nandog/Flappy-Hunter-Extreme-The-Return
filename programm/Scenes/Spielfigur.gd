extends Sprite

func _ready():
	pass
	
	
func _process(delta):
	if Input.is_action_pressed("left"):
		if position.x > 15:
			position.x = position.x-1
		
	if Input.is_action_pressed("right"):
		if position.x < 285:
			position.x = position.x+1
