extends "res://powerups/PowerUp.gd"

export (PackedScene) var scene_shield


func _on_PowerUpShield_area_entered(area):
	
	if area.is_in_group("player"):
		var shield = scene_shield.instance()
		area.call_deferred("add_child", shield)
		AudioPlayer.play("explosion", 15)
		shield.setup(5)
		queue_free()

