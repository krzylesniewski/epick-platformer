extends Area2D
@onready var animation_player = $AnimationPlayer
@onready var step_on_detect = $StepOnDetect

@export var damage_amount: int = 1

func _on_body_entered(body):
	print(body.name)
	animation_player.play("stepOn")
	pass # Replace with function body.
