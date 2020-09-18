extends Control

var player_health = 0
var score = 0
var ball_instance = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_ButtonOG_pressed():
	get_tree().change_scene("res://ScenesOG/Original_LevelOne.tscn")


func _on_ButtonVariant_pressed():
	get_tree().change_scene("res://Scenes/Level_One.tscn")
