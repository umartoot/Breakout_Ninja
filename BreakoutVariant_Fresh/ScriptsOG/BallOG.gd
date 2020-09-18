extends RigidBody2D

export var speedinc = 4
const MaxSpeed = 300


func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("Bricks"):
			get_node("/root/World").score+= 10
			body.queue_free()
		if body.name == "Paddle":
			var speed = get_linear_velocity().length()
			var direction = get_position() - body.get_node("Anchor").get_global_position()
			var velocity = direction.normalized()*min(speed+speedinc, MaxSpeed)
			set_linear_velocity(velocity)
	if get_position().y > get_viewport_rect().end.y:
		queue_free()
		get_node("/root/World").ball_instance -= 1
