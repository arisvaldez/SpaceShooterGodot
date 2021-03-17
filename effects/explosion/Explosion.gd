extends Sprite

func _ready():
	randomize()
	rotation_degrees = rand_range(0, 360)
	Utils.main_node.shake(18, 0.2)
	AudioPlayer.play("explosion", 20)
