extends RigidBody2D

export var speedinc = 4
const MaxSpeed = 300

func _ready():
	set_physics_process(true)
	
# warning-ignore:unused_argument
func _physics_process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("Bricks"):
			get_node("/root/World").score+= 10
			TotalScore.totalScore += 10
			#get_tree().get("res://Scenes/endGameScene.tscn").get_node("endGameScene").totalScore+= 10
			body.queue_free()
		elif body.get_name() == "Paddle":
			var speed = get_linear_velocity().length()
			var direction = get_position() - body.get_node("Anchor").get_global_position()
			var velocity = direction.normalized()*min(speed+speedinc, MaxSpeed)
			set_linear_velocity(velocity)

	if get_position().y > get_viewport_rect().end.y:
		queue_free()
	if get_position().x > get_viewport_rect().end.x - 10:
		queue_free()
	if get_position().y < 10:
		queue_free()
	if get_position().x < 10:
		queue_free()
