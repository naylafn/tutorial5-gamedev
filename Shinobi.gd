extends CharacterBody2D

@onready var hit_sound: AudioStreamPlayer2D = $HitSound
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
func _ready():
	sprite.play("idle")

func hit_by_book():
	hit_sound.play()
