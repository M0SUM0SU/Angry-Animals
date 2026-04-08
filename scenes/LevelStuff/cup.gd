extends StaticBody2D

class_name Cup

static var _num_cups: int = 0

@onready var vanish: AnimationPlayer = $vanish

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_num_cups += 1


func die() -> void:
	vanish.play("Vanish")

func _on_vanish_animation_finished(_anim_name: StringName) -> void:
	_num_cups -= 1
	SignalHub.emit_on_cup_destroyed(_num_cups)
	queue_free()
