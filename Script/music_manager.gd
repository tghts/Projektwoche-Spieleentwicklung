extends Node

signal track_changed(title: String)

var playlists: Dictionary = {}
var current_playlist: Playlist = null
var current_track_index := 0

var music_volume := 0.4

var fade_time := 1.0

var fade_tween: Tween

@onready var player := AudioStreamPlayer.new()

func _ready() -> void:
	randomize()

	add_child(player)

	player.finished.connect(_on_track_finished)

	_load_playlists()

	play_title_music()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("next_track"):
		next_track()

	if Input.is_action_just_pressed("previous_track"):
		previous_track()

func _load_playlists() -> void:
	playlists["title_screen"] = load(
		"res://Playlists/title_screen.tres"
	)

	playlists["level_1"] = load(
		"res://Playlists/level_1.tres"
	)

	playlists["level_2"] = load(
		"res://Playlists/level_2.tres"
	)
	
	playlists["level_3"] = load(
		"res://Playlists/level_3.tres"
	)
	
	playlists["level_4"] = load(
		"res://Playlists/level_4.tres"
	)

	print("Loaded playlists:")
	print(playlists.keys())

func play_playlist(name: String) -> void:
	print("Playing playlist:", name)

	if !playlists.has(name):
		push_error("Playlist not found: " + name)
		return

	current_playlist = playlists[name]

	if current_playlist == null:
		push_error("Playlist is null: " + name)
		return

	if current_playlist.tracks.is_empty():
		push_error("Playlist has no tracks: " + name)
		return

	current_track_index = randi_range(
		0,
		current_playlist.tracks.size() - 1
	)

	_play_current()

func play_title_music() -> void:
	play_playlist("title_screen")

func play_level_music(level_name: String) -> void:
	play_playlist(level_name)

func stop() -> void:
	if fade_tween:
		fade_tween.kill()

	fade_tween = create_tween()

	fade_tween.tween_property(
		player,
		"volume_db",
		-80.0,
		fade_time
	)

	await fade_tween.finished

	player.stop()
	player.stream = null

func next_track() -> void:
	if current_playlist == null:
		return

	current_track_index += 1

	if current_track_index >= current_playlist.tracks.size():
		current_track_index = 0

	_play_current()

func previous_track() -> void:
	if current_playlist == null:
		return

	current_track_index -= 1

	if current_track_index < 0:
		current_track_index = current_playlist.tracks.size() - 1

	_play_current()

func _on_track_finished() -> void:
	next_track()

func _play_current() -> void:
	if current_playlist == null:
		return

	var stream := current_playlist.tracks[current_track_index]

	if stream == null:
		push_error("Track is null")
		return

	print("Playing track index:", current_track_index)
	print("Loading:", stream.resource_path)

	if fade_tween:
		fade_tween.kill()

	var target_volume := linear_to_db(music_volume)

	if player.playing:
		fade_tween = create_tween()

		fade_tween.tween_property(
			player,
			"volume_db",
			-80.0,
			fade_time
		)

		await fade_tween.finished

	player.stop()

	player.stream = stream
	player.bus = "Music"
	player.volume_db = -80.0

	player.play()

	fade_tween = create_tween()

	fade_tween.tween_property(
		player,
		"volume_db",
		target_volume,
		fade_time
	)

	var title := stream.resource_path.get_file().get_basename()
	track_changed.emit(title)
