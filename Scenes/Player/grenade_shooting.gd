extends Marker2D

var grenade_scene: PackedScene = preload("res://Scenes/Projectiles/grenade.tscn")

var can_shoot_grenade: bool = true
var grenade_speed = 400

@onready var grenade_cooldown_timer = $GrenadeCooldownTimer

func _process(delta):
	if Input.is_action_just_pressed("grenade") and can_shoot_grenade:
		var grenade = grenade_scene.instantiate() as RigidBody2D
		get_tree().root.add_child(grenade)
		
		var shot_direction = (get_global_mouse_position() - $"..".position).normalized()
		
		grenade.position = global_position
		grenade.linear_velocity = shot_direction * grenade_speed
		
		can_shoot_grenade = false
		grenade_cooldown_timer.start()


func _on_grenade_cooldown_timer_timeout():
	can_shoot_grenade = true
