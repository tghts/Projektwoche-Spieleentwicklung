extends Node
@onready var texture_rect: TextureRect = $CanvasLayer/Panel/TextureRect
@onready var herz_rahmen: TextureRect = $CanvasLayer/Panel/HerzRahmen
@onready var pause_menu: Panel = $CanvasLayer/PauseMenu
@onready var zahnrad_count: Label = $CanvasLayer/Panel/ZahnradCount

# Lädt die Bilder in diesen Variabeln. Diese haben den Typ Texture2D
var KI_Epoche := load("res://Asset/UI/Textschild KI-Epoche 02.svg")
var Mittelalter := load("res://Asset/UI/Textschild Mittelalter 02.svg")
var Ägypten := load("res://Asset/UI/Textschild Ägypten 02.svg")
var Altsteinzeit := load("res://Asset/UI/Textschild Altsteinzeit 02.svg")

var KI_Epoche_heartbar := load("res://Asset/UI/KI_heartbar.svg")
var Mittelalter_heartbar := load("res://Asset/UI/Mittelalter_heartbar.svg")
var Ägypten_heartbar := load("res://Asset/UI/Ägypten_heartbar.svg")
var Altsteinzeit_heartbar := load("res://Asset/UI/Altsteinzeit_heartbar.svg")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		pause_menu.toggle()

# Diese Methode wird immer bei Start einer Scene einmal genutzt.
func _ready() -> void:
	var current_scene: String = get_tree().current_scene.name # Holt sich den Namen des obersten Nodes aus der Scene.
	print(get_tree().current_scene.name) # Debugin Zeugs
	
	# Zahnrad-Zähler
	zahnrad_count.text = str(GameData.zahnrad_count)
	GameData.zahnrad_count_changed.connect(_on_zahnrad_count_changed)
	
	# Character-HP-Zähler
	change_character_hp(GameData.character_hp)
	GameData.character_hp_changed.connect(_on_character_hp_changed)
	
	#Es wird geschaut in welchen Level man ist und das Designe und der Text ändern sich entsprechend.
	if(current_scene == "Level1"):
		MusicManager.play_level_music("level_1")
		herz_rahmen.texture = KI_Epoche_heartbar
		change_text("Ki-Epoche")
		change_textschildDesign(KI_Epoche)
		
	if (current_scene == "Level2"):
		MusicManager.play_level_music("level_2")
		herz_rahmen.texture = Mittelalter_heartbar
		change_text("Mittelalter")
		change_textschildDesign(Mittelalter)
		
	if (current_scene == "Level3"):
		MusicManager.play_level_music("level_3")
		herz_rahmen.texture = Ägypten_heartbar
		change_text("Ägypten")
		change_textschildDesign(Ägypten)
		
	if (current_scene == "Level4"):
		MusicManager.play_level_music("level_4")
		herz_rahmen.texture = Altsteinzeit_heartbar
		change_text("Altsteinzeit")
		change_textschildDesign(Altsteinzeit)

#Ruft das übergebene Bild auf und lädt es in die TextureRect Node.
func change_textschildDesign(image: Texture2D):
	texture_rect.texture = image
	
#Holt die erste ChildNode von TextureRect und ersetzt dann den Text vom Panel.
func change_text(text: String):
	texture_rect.get_child(0).text = text

func change_character_hp(hp: int):
	match hp:
		0:
			$CanvasLayer/Panel/Heart1.hide()
			$CanvasLayer/Panel/Heart2.hide()
			$CanvasLayer/Panel/Heart3.hide()
			$CanvasLayer/Panel/Heart4.hide()
			$CanvasLayer/Panel/Heart5.hide()
		1:
			$CanvasLayer/Panel/Heart1.show()
			$CanvasLayer/Panel/Heart2.hide()
			$CanvasLayer/Panel/Heart3.hide()
			$CanvasLayer/Panel/Heart4.hide()
			$CanvasLayer/Panel/Heart5.hide()
		2:
			$CanvasLayer/Panel/Heart1.show()
			$CanvasLayer/Panel/Heart2.show()
			$CanvasLayer/Panel/Heart3.hide()
			$CanvasLayer/Panel/Heart4.hide()
			$CanvasLayer/Panel/Heart5.hide()
		3:
			$CanvasLayer/Panel/Heart1.show()
			$CanvasLayer/Panel/Heart2.show()
			$CanvasLayer/Panel/Heart3.show()
			$CanvasLayer/Panel/Heart4.hide()
			$CanvasLayer/Panel/Heart5.hide()
		4:
			$CanvasLayer/Panel/Heart1.show()
			$CanvasLayer/Panel/Heart2.show()
			$CanvasLayer/Panel/Heart3.show()
			$CanvasLayer/Panel/Heart4.show()
			$CanvasLayer/Panel/Heart5.hide()
		5:
			$CanvasLayer/Panel/Heart1.show()
			$CanvasLayer/Panel/Heart2.show()
			$CanvasLayer/Panel/Heart3.show()
			$CanvasLayer/Panel/Heart4.show()
			$CanvasLayer/Panel/Heart5.show()

func _on_zahnrad_count_changed(count: int):
	zahnrad_count.text = str(count)

func _on_character_hp_changed(hp: int):
	change_character_hp(hp)
