extends Area2D

export var velocity = Vector2()
export var armor = 4 setget _set_armor
export (PackedScene) var Explosion

func _set_armor(value):
	if is_queued_for_deletion():
		return
	
	if value < armor:
		AudioPlayer.play('hit_enemy', 20)
	
	armor = value
	if armor <=0:
		destroy()


func destroy():
	var explo = Explosion.instance()
	explo.position = position
	Utils.main_node.get_node("GameHUD").score += 5
	Utils.main_node.add_child(explo)
	queue_free()


func _physics_process(delta):
	translate(velocity * delta)
	
	if position.y-32 >= Utils.view_size.y:
		queue_free()
		


func _on_Enemy_area_entered(area):
	
	if area.is_in_group("shield"):
		destroy()
	
	if area.is_in_group("player"):
		area.armor -= 1
		destroy()
