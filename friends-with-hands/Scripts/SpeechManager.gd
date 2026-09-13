extends Node2D

@export var floating_text_scene:PackedScene
@export var tutorial_text_array:Array[String]
@export var hate_text_array:Array[String]

func spawn_text(text_input:String):
	var speech_instance = floating_text_scene.instantiate()
	speech_instance.text = text_input
	add_child(speech_instance)

func spawn_turorial_text():
	pass

func spwan_hate_text ():
	spawn_text(hate_text_array.pick_random())
