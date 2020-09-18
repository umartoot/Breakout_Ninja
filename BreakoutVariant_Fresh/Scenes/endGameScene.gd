extends Node2D

func _on_Button_pressed():
	TotalScore.totalScore = 0
	get_tree().change_scene("res://Scenes/Level_One.tscn")
