extends Camera2D
#shake tuturial https://kidscancode.org/godot_recipes/4.x/2d/screen_shake/index.html

@export var decay = 0.8 #How fast the shake decays [0-1]
@export var max_offset = Vector2(75,75)
@export var max_roll = 0.1

@onready var _noise = FastNoiseLite.new()
var noise_y = 0 

var trauma = 0 # current shake force
var trauma_pwr = 3 #traume ^ pwr 

func add_trauma(amt:float):
	#function to add trauma
	trauma = min(1, trauma + amt)
	
func _ready() -> void:
	#setup the noise
	randomize()
	_noise.noise_type = FastNoiseLite.NoiseType.TYPE_SIMPLEX_SMOOTH
	_noise.seed = randi()
	_noise.fractal_octaves = 2
	_noise.frequency = 1.0 / 20.0
	
	#for testing 
	#add_trauma(0.9)

func _process(delta: float) -> void:
	if trauma:
		trauma = max(0, trauma - decay * delta)
		shake()
		
	elif offset.x != 0 or offset.y != 0 or rotation != 0:
		#goes back to the original position when truama = 0
		lerp(offset.x,0.0,1)
		lerp(offset.y,0.0,1)
		lerp(rotation,0.0,1)

func shake():
	#shake
	var amt = pow(trauma,trauma_pwr)
	noise_y += 1
	rotation = max_roll * amt * _noise.get_noise_2d(0, noise_y)
	offset.x = max_offset.x * amt * _noise.get_noise_2d(1000, noise_y)
	offset.y = max_offset.y * amt * _noise.get_noise_2d(2000, noise_y)
	
	
	
func _on_mob_dying():
	add_trauma(randf_range(0.7,0.9))

func _on_player_on_shoot() -> void:
	add_trauma(randf_range(0.15,0.2))
