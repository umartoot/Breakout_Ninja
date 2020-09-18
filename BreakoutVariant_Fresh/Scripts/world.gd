extends Node2D
var score = 0 setget set_score
var ball_instance = 0
var brickCount = 0
var player_health = 10 setget set_health

func set_score(value):
	score = value
	get_node("Score").set_text("Score: "+str(score))

func set_health(value):
	player_health = value
	get_node("Health").set_text("Health: "+str(player_health))


func _on_BackToMenu_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
	get_tree().get_root().get_node("World").get_node("groan").play()
