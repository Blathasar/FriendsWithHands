extends Area2D

@export var speed: float = 500.0

var direction: Vector2
var finger_positions: Array[bool]

func _process(delta: float) -> void:
	global_position += direction * speed * delta

func change_texture(texture):
	$AnimatedSprite2D.texture = texture

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	var hand_sign = HandLogic.convert_finger_positions_to_handsign(finger_positions)
	if hand_sign != HandLogic.HandSign.NONE:
		print("is a hand sign")
		if !HandLogic.beats_hand(hand_sign, HandLogic.convert_finger_positions_to_handsign(body.finger_positions)):
			print("did not beat the hand")
			queue_free()
			return
	else:
		if !HandLogic.have_same_finger_positions(finger_positions, body.finger_positions):
			print("Projectile is: + ", finger_positions, "!")
			print("Enemy is: + ", body.finger_positions, "!")
			queue_free()
			return
	print("beaths them")
	body.queue_free()
	#Jun -> Trigger particle
	body.particle_manager.emitParticle()
	
