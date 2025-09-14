extends Control

@export var game_scene: String = "res://scenes/game.tscn" 

func _ready():
	$play.pressed.connect(_on_play_pressed)

func _on_play_pressed():
	get_tree().change_scene_to_file(game_scene)
