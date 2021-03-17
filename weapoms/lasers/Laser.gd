extends Area2D

export var velocity = Vector2()

const scene_flare = preload("res://effects/flare/Flare.tscn")

func _ready():
	create_flare()


func _process(delta):
	translate(velocity * delta)


func create_flare():
	var flare = scene_flare.instance()
	flare.position = position
	Utils.main_node.add_child(flare)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
