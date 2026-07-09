extends Node

signal track_changed(title: String)

const MUSIC_ROOT := "res://Asset/Musik"

var playlists: Dictionary = {}
var current_playlist: Array[String] = []
var current_track_index := 0

@onready var player := AudioStreamPlayer.new()

func _ready() -> void:
	add_child(player)

	player.finished.connect(_on_track_finished)

	_scan_music()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("next_track"):
		next_track()

	if Input.is_action_just_pressed("previous_track"):
		previous_track()

func _scan_music() -> void:
	print("Scanning music...")
	var root := DirAccess.open(MUSIC_ROOT)

	if root == null:
		push_error("Music folder not found")
		return

	root.list_dir_begin()

	var folder := root.get_next()

	while folder != "":
		if root.current_is_dir():
			var tracks: Array[String] = []

			var dir := DirAccess.open(MUSIC_ROOT + "/" + folder)

			if dir:
				dir.list_dir_begin()

				var file := dir.get_next()

				while file != "":
					if file.ends_with(".wav") or file.ends_with(".ogg") or file.ends_with(".mp3"):
						tracks.append(MUSIC_ROOT + "/" + folder + "/" + file)

					file = dir.get_next()

			playlists[folder] = tracks

		folder = root.get_next()
	print(playlists)

func play_playlist(name: String) -> void:
	print("Playing playlist:", name)
	if !playlists.has(name):
		print("Playlist not found")
		return
	
	print(playlists[name])

	current_playlist = playlists[name]
	current_track_index = 0

	_play_current()

func play_title_music() -> void:
	play_playlist("title_screen")

func play_level_music(level_name: String) -> void:
	play_playlist(level_name)

func next_track() -> void:
	if current_playlist.is_empty():
		return

	current_track_index += 1

	if current_track_index >= current_playlist.size():
		current_track_index = 0

	_play_current()

func previous_track() -> void:
	if current_playlist.is_empty():
		return

	current_track_index -= 1

	if current_track_index < 0:
		current_track_index = current_playlist.size() - 1

	_play_current()

func _on_track_finished() -> void:
	next_track()

func _play_current() -> void:
	print("Playing track index:", current_track_index)
	var path := current_playlist[current_track_index]
	print("Loading:", path)

	player.stream = load(path)
	player.bus = "Music"
	player.volume_db = linear_to_db(0.5)
	player.play()

	track_changed.emit(_filename_to_title(path))

func _filename_to_title(path: String) -> String:
	return path.get_file().get_basename()
