extends Node2D

const SPEED = 50

var direction = 1

@onready var ray_cast_2d_left = $RayCast2DLeft
@onready var ray_cast_2d_right = $RayCast2DRight
@onready var animated_sprite_2d = $AnimatedSprite2D

func _process(delta):
	if ray_cast_2d_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_2d_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	
	
	position.x += direction * SPEED * delta
