extends Node

const enemies = [
	preload("res://enemy/EnemyBlue.tscn"),
	preload("res://enemy/EnemyRed.tscn")
]

func _ready():
	$SpwanTimer.start()

func spawn():
	var enemy = Utils.choice_list(enemies).instance()
	var pos = Vector2()
	
	randomize()
	pos.x = rand_range(64, Utils.view_size.x)
	pos.y -64
	enemy.position = pos
	
	add_child(enemy)
	$SpwanTimer.wait_time = rand_range(0.5, 2.0)
	

func _on_SpwanTimer_timeout():
	spawn()
