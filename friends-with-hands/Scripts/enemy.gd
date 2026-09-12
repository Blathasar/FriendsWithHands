extends RigidBody2D

var player_position: Vector2
var velocity: Vector2

func setup(player_pos:Vector2):
	player_position = player_pos

# Called when the node enters the scene tree for the first time.
func _ready():
	var direction = global_position.direction_to(player_position)
	velocity = direction * 100.0
	rotation = direction.angle()
	
func _process(delta):
	global_position += velocity * delta
	
	
	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
