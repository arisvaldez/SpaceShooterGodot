extends Node

var magnitude = 0
var timeleft = 0.0
var is_shaking = false


func _ready():
	$Player.setup($PlayerPosition.global_position)
	AudioPlayer.background_music(true)


func _on_Player_tree_exited():
	$GameHUD/Control/MenuButton.show()
	AudioPlayer.background_music(false)




func shake(new_magnitude, lifetime):
	print(new_magnitude)
	if magnitude > new_magnitude:
		return
	
	magnitude = new_magnitude
	timeleft = lifetime
	
	if is_shaking:
		return
		
	is_shaking = true
	
	while timeleft > 0:
		var pos = Vector2()
		pos.x = rand_range(-magnitude, magnitude)
		pos.y = rand_range(-magnitude, magnitude)
		$MainCamera.position = pos
		timeleft -= get_process_delta_time()
		yield(get_tree(),"idle_frame")
	
	magnitude = 0
	is_shaking = false
	$MainCamera.position = Vector2()


func _on_MenuButton_pressed():
	get_tree().change_scene("res://Main.tscn")
