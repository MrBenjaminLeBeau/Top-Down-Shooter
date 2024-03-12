extends Area2D

class_name Laser

var direction: Vector2

@export var laser_speed = 500


func _process(delta):
	position += direction * laser_speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
