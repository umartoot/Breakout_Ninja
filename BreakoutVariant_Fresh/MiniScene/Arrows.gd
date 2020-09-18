extends RigidBody2D

func _ready():
	set_physics_process(true)
	
# warning-ignore:unused_argument
func _physics_process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.get_name() == "Paddle" || body.get_name() == "Paddle2":
			self.queue_free()
			get_node("/root/World").player_health -= 1
			get_tree().get_root().get_node("World").get_node("hurt").play()

	if get_node("/root/World").player_health == 0:
		get_tree().change_scene("res://Scenes/endGameScene.tscn")
