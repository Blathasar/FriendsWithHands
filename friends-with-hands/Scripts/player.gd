extends Area2D

@export var projectile: PackedScene

signal hit
signal gameOver
var health: int
var finger_positions: Array[bool] = [5]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	finger_positions = [false,false,false,false,false]
	show()
	health = 3
	$CollisionShape2D.disabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	finger_positions[0] = Input.is_action_pressed("pinky")
	finger_positions[1] = Input.is_action_pressed("ring")
	finger_positions[2] = Input.is_action_pressed("middle")
	finger_positions[3] = Input.is_action_pressed("pointer")
	finger_positions[4] = Input.is_action_pressed("thumb")
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()
		
		

func shoot():
	print(HandLogic.convert_finger_positions_to_handsign(finger_positions))
	var proj = projectile.instantiate()

	var direction = Vector2.RIGHT.rotated(global_rotation)

	get_tree().current_scene.add_child(proj)
	
	proj.global_position = global_position + direction * 50
	proj.global_rotation = global_rotation
	proj.direction = direction

	

func _on_body_entered(body: Node2D) -> void:
	emit_signal("hit")
	body.queue_free()
	health -= 1
	if health <= 0:
		emit_signal("gameOver")	


func _on_game_over() -> void:
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
