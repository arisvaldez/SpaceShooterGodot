extends "res://weapoms/lasers/Laser.gd"

func _ready():
	AudioPlayer.play("laser_player", 15)

func _on_LaserPlayer_area_entered(area):
	if area.is_in_group("enemy"):
		area.armor -= 1
		create_flare()
		Utils.main_node.shake(5, 0.1)
		queue_free()
