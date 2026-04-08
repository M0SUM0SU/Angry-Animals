extends Area2D

@onready var splash_s: AudioStreamPlayer2D = $SplashS



func _on_body_entered(body: Node2D) -> void:
	splash_s.position = body.position
	splash_s.play()
