extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (Resource) var to_spawn

var time_accumulator  = 0
var start = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var rng = RandomNumberGenerator.new()
	var spawnInt = rng.randi_range(25, 50)
	var spawn_frequency = spawnInt
	if Input.is_action_pressed("ui_up"):
		start += 1
	if start > 0:
		time_accumulator += delta
		#get_tree().get_root()
		
		position.x = randi() % 640
		while time_accumulator >= spawn_frequency:
			time_accumulator -= spawn_frequency
			var spawned : Node2D = to_spawn.instance()
			spawned.position = self.position
			$"../".add_child(spawned)
