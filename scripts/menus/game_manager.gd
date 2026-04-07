extends Node

var game_mode = "multiplayer"
var difficulty = "normal"
var _sfx_button: AudioStreamPlayer 

func play_sfx(stream: AudioStream):
    if _sfx_button == null:
        _sfx_button = AudioStreamPlayer.new()
        add_child(_sfx_button)
    _sfx_button.stream = stream
    _sfx_button.play()