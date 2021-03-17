extends "res://powerups/PowerUp.gd"

export (PackedScene) var scene_helpers


func _on_PowerUpHelpers_area_entered(area):
	if area.is_in_group("player"):
		var helper = scene_helpers.instance()
		area.add_child(helper)
		AudioPlayer.play("explosion", 15)
		helper.setup(5)
		helper.start()
		queue_free()
