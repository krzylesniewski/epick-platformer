extends CharacterBody2D

const SPEED = 120.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var jump_sfx = $JumpSFX


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sfx.play()

	var direction = Input.get_axis("left", "right")
	
	
	# Filp sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	
	# Play animation
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("fly")
	
	
	# Aplay movment
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_hurtbox_body_entered(body: Node2D):
	if body.is_in_group('enemy'):
		HealthManager.decreace_health(body.damage_amount or 1)


func _on_hurtbox_area_entered(area):
	if area.is_in_group('traps'):
		HealthManager.decreace_health(area.damage_amount or 1)
