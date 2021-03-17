extends Node

var main_node setget , _get_main_node
var view_size setget , _get_view_size


func _get_main_node():
	var root = get_tree().get_root()
	return root.get_child( root.get_child_count()-1)


func _get_view_size():
	return get_tree().get_root().get_visible_rect().size


func choice_list(list):
	randomize()
	var random_index = randi() % list.size()
	return list[random_index]
