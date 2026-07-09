extends Node

var sounds := {
	"appear": preload("res://Asset/Sounds//appear.wav"),
	"click": preload("res://Asset/Sounds//click.wav"),
	"collect": preload("res://Asset/Sounds//collect.wav"),
	"disappear": preload("res://Asset/Sounds//disappear.wav"),
	"game_over": preload("res://Asset/Sounds//game_over.wav"),
	"hit": preload("res://Asset/Sounds//hit.wav"),
	"pause": preload("res://Asset/Sounds//pause.wav"),
	"portal": preload("res://Asset/Sounds//portal.wav"),
	"slider": preload("res://Asset/Sounds//slider.wav"),
	"trampolin": preload("res://Asset/Sounds//trampolin.wav"),
	"victory": preload("res://Asset/Sounds//victory.mp3"),
}

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func play(sound_name: String, volume: float = 1.0, bus: String = "SoundEffects") -> AudioStreamPlayer:
	var stream = sounds.get(sound_name)

	if stream == null:
		push_error("Unknown sound: %s" % sound_name)
		return

	var player := AudioStreamPlayer.new()
	player.process_mode = Node.PROCESS_MODE_ALWAYS
	player.bus = bus
	player.stream = stream
	player.volume_db = linear_to_db(volume)
	add_child(player)

	player.play()
	
	player.finished.connect(player.queue_free)
	return player
