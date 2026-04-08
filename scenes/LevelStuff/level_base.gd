extends Node2D



@onready var animal_start: Marker2D = $AnimalStart


const MAIN = preload("res://scenes/UI/main.tscn")
const BIRD = preload("res://scenes/LevelStuff/bird.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Exit") == true:
		get_viewport().set_input_as_handled()
		get_tree().change_scene_to_packed(MAIN)

func _enter_tree() -> void:
	SignalHub.on_animal_died.connect(spawn_bird)

func spawn_bird() -> void:
	var bird = BIRD.instantiate()
	bird.position = animal_start.position
	add_child(bird)


func _ready() -> void:
	spawn_bird()
