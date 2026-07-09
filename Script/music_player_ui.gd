extends Control

@onready var track_label: Label = $HBoxContainer/TrackLabel

func _ready() -> void:
	MusicManager.track_changed.connect(_on_track_changed)

func _on_track_changed(title: String) -> void:
	track_label.text = title

func _on_next_button_pressed() -> void:
	MusicManager.next_track()

func _on_prev_button_pressed() -> void:
	MusicManager.previous_track()
