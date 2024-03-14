extends Node2D

var laser_scene: PackedScene = preload("res://Scenes/Projectiles/laser.tscn")

var can_shoot_laser: bool = true

@onready var laser_cooldown_timer = $LaserCooldownTimer

func _process(delta):
	if Input.is_action_just_pressed("laser") and can_shoot_laser:
		$"../GPUParticles2D".emitting = true
		var laser = laser_scene.instantiate() as Laser
		get_tree().root.add_child(laser)
		
		var shot_direction = (get_global_mouse_position() - $"..".position).normalized()
		laser.rotation_degrees = rad_to_deg(shot_direction.angle()) + 90
		
		laser.position = global_position
		laser.direction = shot_direction
		
		can_shoot_laser = false
		laser_cooldown_timer.start()


func _on_laser_cooldown_timer_timeout():
	can_shoot_laser = true
