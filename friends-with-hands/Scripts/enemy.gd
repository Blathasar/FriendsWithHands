extends RigidBody2D
signal mob_die
# Jun: Particle Varible
@onready var particle_manager= $ParticleManger 
@onready var sprite_node:Sprite2D = $AnimatedSprite2D

var player_position: Vector2
var velocity: Vector2
var finger_positions: Array[bool]
var texture

func setup(player_pos:Vector2):
	player_position = player_pos
	var path = "res://Sprites/HandsHandsHands/" + HandLogic.convert_finger_positions_to_string(finger_positions) + ".png"
	texture = load(path)
	if (texture != null):
		sprite_node.texture = texture

# Called when the node enters the scene tree for the first time.
func _ready():
	var direction = global_position.direction_to(player_position)
	velocity = direction * 100.0
	rotation = direction.angle()
	
func _process(delta):
	global_position += velocity * delta
	
	
# Dies when out of screen	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()	

# Emits particles after death
func _on_tree_exiting() -> void:
	mob_die.emit()
