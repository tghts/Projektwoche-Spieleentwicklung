extends Label


static var minutes: int
static var seconds: float

func _ready() -> void:
	text = "00m : 00s"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	seconds += delta
	if (seconds > 60):
		seconds = 0
		minutes += 1
	text = str(minutes)+"m : " +str("%d" % int(seconds))+"s"

func reset_time():
	minutes = 0
	seconds = 0

func get_seconds() -> int:
	return floor(seconds)
	
func get_minutes() -> int:
	return minutes
