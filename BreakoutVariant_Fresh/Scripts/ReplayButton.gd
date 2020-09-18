extends TextureButton

func _ready():
	pass # Replace with function body.

func _on_Button_Pressed():
	get_tree().change_scene("res://Scenes/Level_One.tscn")
