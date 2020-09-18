extends RigidBody2D

export var speedinc = 4
const MaxSpeed = 300
var player = AudioStreamPlayer.new()
var player2 = AudioStreamPlayer.new()

func _ready():
	set_physics_process(true)
	self.add_child(player)
	self.add_child(player2)
	player.stream = load("res://shuriken_noise.wav")
	player2.stream = load("res://bounce.wav")
	
# warning-ignore:unused_argument
func _physics_process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("Bricks"):
			get_node("/root/World").score+= 10
			TotalScore.totalScore += 10
			#get_tree().get("res://Scenes/endGameScene.tscn").get_node("endGameScene").totalScore+= 10
			body.queue_free()
			player.play()
		elif body.get_name() == "Paddle":
			var speed = get_linear_velocity().length()
			var direction = get_position() - body.get_node("Anchor").get_global_position()
			var velocity = direction.normalized()*min(speed+speedinc, MaxSpeed)
			set_linear_velocity(velocity)
			get_node("/root/World/Paddle/Sprite").play("hit")
			player2.play()
		else:
			get_node("/root/World/Paddle/Sprite").play("still")
			player2.play()
	if get_position().y > get_viewport_rect().end.y:
		queue_free()
		get_node("/root/World").ball_instance -= 1
		print(TotalScore.totalScore)
		get_tree().change_scene("res://Scenes/endGameScene.tscn")
	if get_node("/root/World").player_health == 0:
		queue_free()
	if get_node("/root/World").score == 50:
		queue_free()
		get_tree().change_scene("res://Scenes/Level_Two.tscn")
