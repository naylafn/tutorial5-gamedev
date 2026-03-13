extends CharacterBody2D

@export var walk_speed := 200.0
@export var gravity := 900.0

@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var footstep: AudioStreamPlayer2D = $FootstepSound
@onready var throw: AudioStreamPlayer2D = $ThrowSound

@export var book_scene: PackedScene

var is_attacking := false

func _physics_process(delta):

	# GRAVITY
	if not is_on_floor():
		if velocity.y < 0:
			velocity.y += gravity * delta

	# HORIZONTAL MOVEMENT
	var direction := Input.get_axis("ui_left", "ui_right")

	# FLIP SPRITE
	if direction > 0:
		sprite.flip_h = false
	elif direction < 0:
		sprite.flip_h = true

	velocity.x = direction * walk_speed
	
	# ATTACK INPUT
	if Input.is_action_just_pressed("attack") and not is_attacking:
		is_attacking = true
		sprite.play("attack")
		
	# ANIMATION
	if not is_attacking:
		if direction != 0:
			sprite.play("walk")
		else:
			footstep.stop()
			sprite.play("idle")
			 
	if is_attacking:
		velocity.x = 0

	move_and_slide()
	
func throw_book():
	var book = book_scene.instantiate()
	book.direction = -1 if sprite.flip_h else 1
	book.global_position = global_position + Vector2(40 * book.direction, -10)
	book.add_collision_exception_with(self)
	get_parent().add_child(book)

func play_footstep():
	footstep.pitch_scale = randf_range(0.95, 1.05)
	footstep.play()

func _on_animated_sprite_2d_frame_changed() -> void:
	if sprite.animation == "walk":
		if sprite.frame == 1 or sprite.frame == 7:
			play_footstep()
	if sprite.animation == "attack":
		if sprite.frame == 3:
			throw.play()
			throw_book()

func _on_animated_sprite_2d_animation_finished() -> void:
	if sprite.animation == "attack":
		is_attacking = false
