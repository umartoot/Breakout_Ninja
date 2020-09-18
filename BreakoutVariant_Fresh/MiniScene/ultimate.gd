extends RigidBody2D

const ball_scene = preload("res://MiniScene/BallCircle.tscn")

func _ready():
	set_physics_process(true)

# warning-ignore:unused_argument
func _physics_process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.get_name() == "Paddle":
			self.queue_free()
			var count = 10
			var radius = Vector2(175, 0)
			var center = Vector2(get_node("/root/World/Paddle").get_position().x,get_node("/root/World/Paddle").get_position().y)
			var step = 2 * PI / count

			for i in range(count):
				var spawn_pos = center + radius.rotated(step * i)
				var node = ball_scene.instance()
				node.set_pos(spawn_pos)
				get_tree().get_root.add_child(node)

		if body.get_name() == "Paddle2":
			self.queue_free()
			var count = 10
			var radius = Vector2(175, 0)
			var center = Vector2(get_node("/root/World/Paddle2").get_position().x,get_node("/root/World/Paddle2").get_position().y)
			
			var step = 2 * PI / count

			for i in range(count):
				var spawn_pos = center + radius.rotated(step * i)
			
				var node = ball_scene.instance()
				node.set_position(spawn_pos)
				get_tree().get_root().add_child(node)
				if node.get_position().x == 0:
					node.queue_free()
				if node.get_position().x == 0:
					node.queue_free()
