extends Area2D

@export var speed: float = 500.0

var direction: Vector2

func _process(delta: float) -> void:
	global_position += direction * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
