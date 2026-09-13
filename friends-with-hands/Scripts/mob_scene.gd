extends Node2D

@onready var camera_node = $Camera2D

@export var mob_scene: PackedScene
var score

var player_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_position = $Player.global_position
	new_game()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func new_game():
	score = 0
	$StartTimer.start()

func game_over():
	$MobTimer.stop()
	$ScoreTimer.stop()

func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()

func _on_score_timer_timeout() -> void:
	score += 1

func _on_mob_timer_timeout() -> void:
	spawn_random_mob()

func spawn_random_mob():
	spawn_specific_mob(HandLogic.generate_random_finger_positions())

func spawn_specific_mob(finger_positions: Array[bool]):
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()
	
	# Choose random finger_positions
	mob.finger_positions = finger_positions
	
	# Choose a random location on Path2D.
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's position to the random location.
	mob.position = mob_spawn_location.position
	
	# Set the mob material based on type
	var shader_tex
	var mob_hand_sign = HandLogic.convert_finger_positions_to_handsign(finger_positions)
	match mob_hand_sign:
		HandLogic.HandSign.ROCK or HandLogic.HandSign.SCIZZOR or HandLogic.HandSign.PAPER:
			shader_tex = load("res://Sprites/ShaderTextures/Tex_orange.png")
		HandLogic.HandSign.THUMBS_UP:
			shader_tex = load("res://Sprites/ShaderTextures/Tex_green.png")
		_:
			shader_tex = load("res://Sprites/ShaderTextures/Tex_red.png")
		
	mob.sprite_node.set_instance_shader_parameter("scrollingTexture",shader_tex)
	
	# Spawn the mob by adding it to the Main scene.
	mob.setup(global_position)
	add_child(mob)
	
	# Jun: connect mod_die signal to cameranode
	mob.mob_die.connect(camera_node._on_mob_dying)
