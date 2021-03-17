extends "res://weapoms/lasers/Laser.gd"


func _ready():
	AudioPlayer.play("laser_enemy", 15)

func _on_LaserEnemy_area_entered(area):
	if area.is_in_group("player"):
		area.armor -= 1
		create_flare()
		Utils.main_node.shake(5, 0.1)
		queue_free()
