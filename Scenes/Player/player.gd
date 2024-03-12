extends CharacterBody2D


var speed: float = 500


func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = speed * direction
	move_and_slide()
	
	look_at(get_global_mouse_position())
