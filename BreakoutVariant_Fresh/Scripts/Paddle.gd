extends KinematicBody2D

export (int) var speed = 9
var velocity = Vector2()
var player_health = 10
const ball_scene = preload("res://MiniScene/Ball.tscn")

func _ready():
	set_physics_process(true)
	set_process_input(true)

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		$Sprite.flip_h = false
		$Sprite.play = "run"
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		$Sprite.flip_h = true
		$Sprite.play = "run"
	else:
		$Sprite.play = "still"
	velocity = velocity.normalized() * speed

func _input(event):
	if Input.is_action_pressed("ui_up") && get_node("/root/World").ball_instance == 0:
		var ball = ball_scene.instance()
		get_node("/root/World").ball_instance += 1
		get_node("/root/World/Instruction").hide()
		ball.set_position(get_position()-Vector2(0,16))
		get_tree().get_root().add_child(ball)

func _physics_process(_delta):
	get_input()
	velocity = move_and_collide(velocity)

