extends "res://enemy/Enemy.gd"

export (PackedScene) var scene_laser_enemy

func _ready():
	randomize()
	velocity.x = Utils.choice_list([velocity.x, -velocity.x])


func _physics_process(delta):
	if position.x <= 64:
		velocity.x = abs(velocity.x)
	if position.x >= Utils.view_size.x -64:
		velocity.x = -abs(velocity.x)

func shoot():
	var laser = scene_laser_enemy.instance()
	laser.position = $Cannon.global_position
	Utils.main_node.add_child(laser)


func _on_ShootTimer_timeout():
	shoot()
