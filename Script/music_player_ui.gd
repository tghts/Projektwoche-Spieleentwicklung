extends Control

@onready var track_label: Label = $HBoxContainer/TrackLabel
@onready var record: TextureRect = $HBoxContainer/Record

func _ready() -> void:
	MusicManager.track_changed.connect(_on_track_changed)
	await get_tree().process_frame
	record.pivot_offset = record.size / 2.0

func _process(delta: float) -> void:
	record.rotation_degrees += 90 * delta

func _on_track_changed(title: String) -> void:
	track_label.text = title

func _on_next_button_pressed() -> void:
	MusicManager.next_track()

func _on_prev_button_pressed() -> void:
	MusicManager.previous_track()
