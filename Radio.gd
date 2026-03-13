extends Area2D

@onready var music = $MusicPlayer

func _ready():
	music.stop()

func turn_on_radio():
	if not music.playing:
		music.play()

func _on_body_entered(body):
	if body.name == "BookProjectile":
		turn_on_radio()
		body.queue_free()
