extends Node

func play(_name, vol):
	var player = AudioStreamPlayer.new()
	player.volume_db = -vol
	player.stream = $ResourcePreloader.get_resource(_name)
	player.connect("finished", player, "queue_free")
	player.play()
	add_child(player)


func background_music(value):
	if value:
		$AudioStreamPlayer.play()
	else:
		$AudioStreamPlayer.stop()
