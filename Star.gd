extends Sprite


func _process(delta):
	position.y-=5

func _on_Timer_timeout():
	queue_free()
