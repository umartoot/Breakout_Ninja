extends Label

func _ready():
	get_parent().get_node("Score").text= "Total Score:\n"+str(TotalScore.totalScore)
