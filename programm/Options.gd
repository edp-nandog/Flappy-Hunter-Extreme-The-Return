extends MarginContainer

const play = preload ("res://Scenes/game.tscn")

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_parent().add_child(play.instance())
		queue_free()
