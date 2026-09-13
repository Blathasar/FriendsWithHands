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
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()
	
	# Choose random finger_positions
	mob.finger_positions = HandLogic.generate_random_finger_positions()
	
	# Choose a random location on Path2D.
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's position to the random location.
	mob.position = mob_spawn_location.position

	# Spawn the mob by adding it to the Main scene.
	mob.setup(global_position)
	add_child(mob)
	
	# Jun: connect mod_die signal to cameranode
	mob.mob_die.connect(camera_node._on_mob_dying)
	
