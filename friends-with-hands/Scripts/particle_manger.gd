extends Node2D

var particle_scene
var hand_texture

func _ready() -> void:
	particle_scene = preload("res://Scenes/Prefabs/particle.tscn"
	)
	var spirte_node = $"../AnimatedSprite2D"
	hand_texture = spirte_node.texture
	

func emitParticle():
	var deathParticle = particle_scene.instantiate()
	get_tree().root.add_child(deathParticle);
	deathParticle.position = global_position
	deathParticle.emitting = true
	deathParticle.texture = hand_texture
