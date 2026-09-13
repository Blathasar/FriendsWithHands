extends Node2D

@export var floating_text_scene:PackedScene
@export var tutorial_text_array:Array[String]
@export var hate_text_array:Array[String]

@onready var root_node = $"/root/MainScene"

var tutorial_index = 0
var is_tutorial = true

func _ready() -> void:
	print(root_node.name)
	
func spawn_text(text_input:String):
	var speech_instance = floating_text_scene.instantiate()
	speech_instance.text = text_input
	speech_instance.position = position
	add_child(speech_instance)

func spawn_turorial_text():
	if tutorial_index == 8:
		end_tutorial()
	else:
		var temp_array:Array[bool]
		match tutorial_index:
			4:
				temp_array= [false,false,false,true,false]
				root_node.spawn_specific_mob(temp_array)
			5:
				temp_array= [true,true,false,true,false]
				root_node.spawn_specific_mob(temp_array)
			6:
				temp_array= [false,false,true,true,false]
				root_node.spawn_specific_mob(temp_array)
			7:
				temp_array= [true,true,true,true,true]
				root_node.spawn_specific_mob(temp_array)
				temp_array= [false,false,false,false,false]
				root_node.spawn_specific_mob(temp_array)
		spawn_text(tutorial_text_array[tutorial_index])
		tutorial_index += 1
		
func spawn_hate_text ():
	spawn_text(hate_text_array.pick_random())
	
func end_tutorial():
	is_tutorial = false
	$"/root/MainScene/StartTimer".start()
	$NewTextTimer.wait_time = 15.0
	
func _on_new_text_timer_timeout() -> void:
	if is_tutorial:
		spawn_turorial_text()
		$NewTextTimer.start()
	else:
		spawn_hate_text()
		$NewTextTimer.start()
