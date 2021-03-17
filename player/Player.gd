extends Area2D

signal heart_changed

export (PackedScene) var scene_player_laser
export (int) var armor = 4 setget _set_armor
export (PackedScene) var scene_flash_screen
export (PackedScene) var scene_explosion

func setup(pos):
	position = pos


func _input(event):
	if event is InputEventScreenDrag:
		translate(event.relative)
	
	var pos = position
	
	pos.x = clamp(pos.x, 64, Utils.view_size.x - 64)
	pos.y = clamp(pos.y, 64, Utils.view_size.y - 64)
	
	position = pos


func create_laser(pos):
	var laser = scene_player_laser.instance()
	laser.position = pos
	Utils.main_node.call_deferred("add_child", laser)


func shoot():
	create_laser($Cannons/LeftCannon.global_position)
	create_laser($Cannons/RightCannon.global_position)


func _set_armor(value):
	
	if value < armor:
		AudioPlayer.play('hit_player', 15)
		Utils.main_node.add_child(scene_flash_screen.instance())
	
	armor = value
	emit_signal("heart_changed", armor)
	
	if armor <= 0:
		destroy()
	


func destroy():
	var explo = scene_explosion.instance()
	explo.position = position
	Utils.main_node.add_child(explo)
	queue_free()


func _on_ShootTimer_timeout():
	shoot()
