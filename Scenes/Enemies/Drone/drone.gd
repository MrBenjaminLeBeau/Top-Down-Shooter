extends CharacterBody2D


var speed: float = 100
var direction = Vector2.RIGHT


func _process(delta):
	velocity = speed * direction
	move_and_slide()
	
