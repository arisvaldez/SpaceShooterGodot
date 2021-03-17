extends Node

func _ready():
	$HUD/Control/HBox/BestScoreLabel.text = str(SaveData.bestscore)
	get_tree().paused = false

func _on_StartButton_pressed():
	get_tree().change_scene("res://stage/Stage.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()
