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
			TotalScore.totalScore += 100
			get_node("/root/World").score+= 100
		if body.get_name() == "Paddle2":
			self.queue_free()
			TotalScore.totalScore += 100
			get_node("/root/World").score+= 100
