extends RigidBody2D

const ball_scene = preload("res://MiniScene/BallPowerUp.tscn")

func _ready():
	set_physics_process(true)
	
# warning-ignore:unused_argument
func _physics_process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.get_name() == "Paddle":
			self.queue_free()
			var ball = ball_scene.instance()
			#get_node("/root/World/Instruction").hide()
			ball.set_position(get_position()-Vector2(0,16))
			get_tree().get_root().add_child(ball)
		if body.get_name() == "Paddle2":
			self.queue_free()
			var ball = ball_scene.instance()
			get_node("/root/World/Instruction").hide()
			ball.set_position(get_position()-Vector2(0,16))
			get_tree().get_root().add_child(ball)
