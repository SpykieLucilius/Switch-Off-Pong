extends Node2D

@export var sfx_player: AudioStream

func _on_multiplayer_button_pressed():
	GameManager.play_sfx(sfx_player)
	GameManager.game_mode = "multiplayer"
	get_tree().change_scene_to_file("res://scenes/menus/main.tscn")

func _on_ai_button_pressed():
	GameManager.play_sfx(sfx_player)
	GameManager.game_mode = "ai"
	get_tree().change_scene_to_file("res://scenes/menus/difficulty_screen.tscn")

func _on_settings_button_pressed():
	GameManager.play_sfx(sfx_player)
	get_tree().change_scene_to_file("res://scenes/menus/settings_screen.tscn")

func _on_quit_button_pressed():
	GameManager.play_sfx(sfx_player)
	get_tree().quit()
