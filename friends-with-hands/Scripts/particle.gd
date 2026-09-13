extends Node2D

@onready var death_sound_node:AudioStreamPlayer2D = $deathsound
@export var death_sound_array:Array[AudioStream] = []

func _on_finished() -> void:
	queue_free()


func play_death_sound():
	var death_sound_clip = death_sound_array.pick_random()
	death_sound_node.stream = death_sound_clip
	death_sound_node.play()
