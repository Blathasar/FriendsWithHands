extends Sprite2D

var health = 3

func _ready() -> void:
	loadTextureBasedOnHealth(health)

func loadTextureBasedOnHealth(HP:int):
	match HP:
		0:
			texture = load("res://Sprites/HandsHandsHands/00000.png")
		1:
			texture = load("res://Sprites/HandsHandsHands/00010.png")
		2:
			texture = load("res://Sprites/HandsHandsHands/00110.png")
		3:
			texture = load("res://Sprites/HandsHandsHands/01110.png")
		4:
			texture = load("res://Sprites/HandsHandsHands/11110.png")
		5:
			texture = load("res://Sprites/HandsHandsHands/11111.png")	
