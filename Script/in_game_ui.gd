extends Node
@onready var texture_rect: TextureRect = $CanvasLayer/Panel/TextureRect
@onready var herz_ramen: TextureRect = $CanvasLayer/Panel/Herz_ramen

# Lädt die Bilder in diesen Variabeln. Diese haben den Typ Texture2D
var KI_Epoche := load("res://Asset/UI/Textschild KI-Epoche 02.svg")
var Mittelalter := load("res://Asset/UI/Textschild Mittelalter 02.svg")
var Ägypten := load("res://Asset/UI/Textschild Ägypten 02.svg")
var Altsteinzeit := load("res://Asset/UI/Textschild Altsteinzeit 02.svg")

var KI_Epoche_heartbar := load("res://Asset/UI/KI_heartbar.svg")
var Mittelalter_heartbar := load("res://Asset/UI/Mittelalter_heartbar.svg")
var Ägypten_heartbar := load("res://Asset/UI/Ägypten_heartbar.svg")
var Altsteinzeit_heartbar := load("res://Asset/UI/Altsteinzeit_heartbar.svg")


# Diese Methode wird immer bei Start einer Scene einmal genutzt.
func _ready() -> void:
	var current_scene: String = get_tree().current_scene.name # Holt sich den Namen des obersten Nodes aus der Scene.
	print(get_tree().current_scene.name) # Debugin Zeugs
	
	#Es wird geschaut in welchen Level man ist und das Designe und der Text ändern sich entsprechend.
	if(current_scene == "Level1"): 
		herz_ramen.texture = KI_Epoche_heartbar
		change_text("Ki-Epoche")
		change_textschildDesigne(KI_Epoche)
		
	if (current_scene == "Level2"):
		herz_ramen.texture = Mittelalter_heartbar
		change_text("Mittelalter")
		change_textschildDesigne(Mittelalter)
		
	if (current_scene == "Level3"):
		herz_ramen.texture = Ägypten_heartbar
		change_text("Ägypten")
		change_textschildDesigne(Ägypten)
		
	if (current_scene == "Level4"):
		herz_ramen.texture = Altsteinzeit_heartbar
		change_text("Altsteinzeit")
		change_textschildDesigne(Altsteinzeit)

#Ruft das übergebene Bild auf und lädt es in die TextureRect Node.
func change_textschildDesigne(image: Texture2D):
	texture_rect.texture = image
	
#Holt die erste ChildNode von TextureRect und ersetzt dann den Text vom Panel.
func change_text(text: String):
	texture_rect.get_child(0).text = text
	
	
	
	
