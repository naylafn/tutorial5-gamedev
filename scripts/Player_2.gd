extends CharacterBody2D

@export var walk_speed := 200.0

# Physics
@export var gravity := 900.0

# onready vars (HARUS setelah semua var)
@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	# GRAVITY
	if not is_on_floor():
		if velocity.y < 0:
			velocity.y += gravity * delta

	# HORIZONTAL MOVEMENT
	var direction := Input.get_axis("ui_left", "ui_right")

	if is_crouching:
		velocity.x = direction * crouch_speed
	else:
		velocity.x = direction * walk_speed

	# FLIP SPRITE
	if direction > 0:
		sprite.flip_h = false
	elif direction < 0:
		sprite.flip_h = true

	# ANIMATION STATE
	if direction != 0:
		sprite.play("walk")
	else:
		sprite.play("stand")

	move_and_slide()


func update_animation(direction):
	if direction != 0:
		sprite.play("walk")
	else:
		sprite.play("stand")
