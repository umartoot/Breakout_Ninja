extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var gravity = -10

var speed = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	speed.y += delta*gravity
