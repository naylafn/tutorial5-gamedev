extends CharacterBody2D

@export var speed := 500
var direction := 1

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	sprite.play("flying")
	sprite.flip_h = direction < 0

func _physics_process(delta):
	velocity.x = direction * speed
	move_and_slide()

	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()

		if collider.has_method("turn_on_radio"):
			collider.turn_on_radio()
			queue_free()
			
		if collider.has_method("hit_by_book"):
			collider.hit_by_book()
			queue_free()
