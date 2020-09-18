extends RigidBody2D

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var bodies = get_colliding_bodies()
		
	for body in bodies:
		if body.get_name() == "Paddle" || body.get_name() == "Paddle2":
			self.queue_free()
			body.speed += 3
			$Timer.start()

func _on_Timer_timeout():
	get_parent().get_node("/root/World/Paddle").speed = 9
	get_parent().get_node("/root/World/Paddle2").speed = 9
