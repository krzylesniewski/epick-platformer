extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	timer.start()
	print("UMIERASZ")
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()

func _on_timer_timeout():
	get_tree().reload_current_scene()
	Engine.time_scale = 1
