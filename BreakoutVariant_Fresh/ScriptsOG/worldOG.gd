extends Node2D
var score = 0 setget set_score
var ball_instance = 0

func set_score(value):
	score = value
	get_node("Score").set_text("Score: "+str(score))


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
