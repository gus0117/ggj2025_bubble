extends Control
class_name GameUIController

var casoActual: Caso

#Scenes references
@onready var coartada_rich_text: RichTextLabel = $PanelContainer/VBoxContainer/CoartadaRichText
@onready var img_evidencia_1: TextureRect = $BurbujaEvidencia1/ImgEvidencia1
@onready var img_evidencia_2: TextureRect = $BurbujaEvidencia2/ImgEvidencia2
@onready var img_evidencia_3: TextureRect = $BurbujaEvidencia3/ImgEvidencia3

func UpdateUI(nuevoCaso: Caso) -> void:
	casoActual = nuevoCaso
	UpdateCoartada()
	UpdateBubbles()

func UpdateCoartada() -> void:
	coartada_rich_text.text = casoActual.coartada

func UpdateBubbles() -> void:
	var path : String = "res://Assets/Evidence/"+casoActual.urlPrueba1+".png"
	img_evidencia_1.texture = load(path)
	img_evidencia_2.texture = load(path)
	img_evidencia_3.texture = load(path)
