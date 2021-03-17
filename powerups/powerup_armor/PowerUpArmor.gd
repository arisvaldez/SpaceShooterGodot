extends "res://powerups/PowerUp.gd"



func _on_PowerUpArmor_area_entered(area):
	if area.is_in_group("player"):
		area.armor +=1
		AudioPlayer.play("explosion", 15)
		queue_free()
