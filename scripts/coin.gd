extends Area2D
@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	print(body.name)
	animation_player.play("collect")
