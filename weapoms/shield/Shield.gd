extends Area2D

func setup(time_left):
	$Timer.wait_time = time_left


func _on_Timer_timeout():
	queue_free()
