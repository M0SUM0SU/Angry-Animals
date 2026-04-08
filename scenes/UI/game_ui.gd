extends Control

@onready var attempts: Label = $MarginContainer/VBoxContainer/Attempts
@onready var music: AudioStreamPlayer = $Music
@onready var timer: Timer = $Timer
@onready var level_c: Label = $VBoxContainer/levelC
@onready var press_space: Label = $VBoxContainer/PressSpace
@onready var level: Label = $MarginContainer/VBoxContainer/Level


var _attempts: int = -1



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level.text = "Level %s" % ScoreManager.level_selected
	attempt_made()


func _enter_tree() -> void:
	SignalHub.on_attempt_made.connect(attempt_made)
	SignalHub.on_cup_destroyed.connect(on_cup_destroyed)

func attempt_made() -> void:
	_attempts += 1
	attempts.text = "Attempts %s" % _attempts
	
func on_cup_destroyed(remaining_cups: int) -> void:
	if remaining_cups == 0 and music.playing == false:
		music.play()
		level_c.show()
		ScoreManager.set_score_for_level(ScoreManager.level_selected, _attempts)
		timer.start()


func _on_timer_timeout() -> void:
	press_space.show()
