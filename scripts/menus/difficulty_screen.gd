extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_easy_button_pressed():
	GameManager.difficulty = "easy"
	get_tree().change_scene_to_file("res://scenes/menus/main.tscn")

func _on_medium_button_pressed():
	GameManager.difficulty = "medium"
	get_tree().change_scene_to_file("res://scenes/menus/main.tscn")

func _on_hard_button_pressed():
	GameManager.difficulty = "hard"
	get_tree().change_scene_to_file("res://scenes/menus/main.tscn")
