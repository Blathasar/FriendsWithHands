extends Label

@onready var timer_node = $ExistTimer

var direction:Vector2
var direction_changed_times:int = 0

@export var speed:float
@export var max_change_direction_times:int 
@export var change_direction_intervel:float

func _ready() -> void:
	timer_node.wait_time = change_direction_intervel
	timer_node.start()
	randomize_direction()
	
func _process(delta: float) -> void:
	position += speed * direction * delta


func _on_exist_timer_timeout() -> void:
	direction_changed_times += 1
	if direction_changed_times == max_change_direction_times:
		queue_free()
	else:
		randomize_direction()
	
func randomize_direction():
	direction = Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()
