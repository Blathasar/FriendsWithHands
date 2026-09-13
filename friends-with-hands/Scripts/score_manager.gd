extends Node

@export var score_counter: PackedScene
var current_score_counter
var texture

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Score.score = 0


func _on_mob_dying():
	Score.score += 1
	if Score.score > Score.highscore:
		Score.highscore = Score.score
	print(Score.score)
	_visualize_score()

func _visualize_score():
	if Score.score % 5 == 1:
		print("New hand")
		current_score_counter = score_counter.instantiate()
		$"../Background/ScoreMarker/HBoxContainer".add_child(current_score_counter)
	loadTextureBasedOnHealth(Score.score % 5)
	
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
	current_score_counter.texture = texture
