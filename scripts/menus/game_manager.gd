extends Node

var game_mode = "multiplayer"
var difficulty = "normal"
var _sfx_player: AudioStreamPlayer 
var sfx_volume = 0.1

func play_sfx(stream: AudioStream):
    if _sfx_player == null:
        _sfx_player = AudioStreamPlayer.new()
        add_child(_sfx_player)
        _sfx_player.bus = "SFX"
    _sfx_player.stream = stream
    _sfx_player.play()

func _ready():
    AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(sfx_volume))