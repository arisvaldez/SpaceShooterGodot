extends "res://enemy/Enemy.gd"

func _ready():
	velocity = Vector2(0 , rand_range(250, 1000))
