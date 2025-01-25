extends Control
class_name GameUIController

#Signals para las burbujas
signal on_normal_bubble
signal on_angry_bubble
signal on_relax_bubble

var casoActual: Caso
var evidenciaActual: int #Indice que va de 1 a 3, sirve para gestionar las evidencias

#Scenes references
@onready var coartada_rich_text: RichTextLabel = $PanelContainer/VBoxContainer/CoartadaRichText
@onready var img_evidencia_1: TextureRect = $BurbujaEvidencia1/ImgEvidencia1
@onready var img_evidencia_2: TextureRect = $BurbujaEvidencia2/ImgEvidencia2
@onready var img_evidencia_3: TextureRect = $BurbujaEvidencia3/ImgEvidencia3
@onready var popup: PopupHandler = $PopUp

func _ready() -> void:
	InitCase()

func InitCase() -> void:
	evidenciaActual = 1

func UpdateUI(nuevoCaso: Caso) -> void:
	casoActual = nuevoCaso
	UpdateCoartada()
	UpdateBubbles()

func UpdateCoartada() -> void:
	coartada_rich_text.text = casoActual.coartada

func UpdateBubbles() -> void:
	if evidenciaActual > 3: # Solo hay 3 evidencias por personaje
		return
	var path : String = GetNewEvidencePath()
	img_evidencia_1.texture = load(path)
	img_evidencia_2.texture = load(path)
	img_evidencia_3.texture = load(path)

func GetNewDescription() -> String:
	var description: String
	if evidenciaActual == 1:
		if casoActual.pacienciaActual < 0.3:
			description = casoActual.p1_completa
		elif casoActual.pacienciaActual >= 0.3 and casoActual.pacienciaActual < 0.7:
			description = casoActual.p1_incompleta
		elif casoActual.pacienciaActual >= 0.7:
			description = casoActual.p1_debil
	elif evidenciaActual == 2:
		if casoActual.pacienciaActual < 0.3:
			description = casoActual.p2_completa
		elif casoActual.pacienciaActual >= 0.3 and casoActual.pacienciaActual < 0.7:
			description = casoActual.p2_incompleta
		elif casoActual.pacienciaActual >= 0.7:
			description = casoActual.p2_debil
	elif evidenciaActual == 3:
		if casoActual.pacienciaActual < 0.3:
			description = casoActual.p3_completa
		elif casoActual.pacienciaActual >= 0.3 and casoActual.pacienciaActual < 0.7:
			description = casoActual.p3_incompleta
		elif casoActual.pacienciaActual >= 0.7:
			description = casoActual.p3_debil
	return description

func GetNewEvidencePath() -> String:
	var path: String = "res://Assets/Evidence/"
	if evidenciaActual == 1:
		path += casoActual.urlPrueba1
	elif evidenciaActual == 2:
		path += casoActual.urlPrueba2
	elif evidenciaActual == 3:
		path += casoActual.urlPrueba3
	return path+".png"

func IncreseEvidenceIndex() -> void:
	evidenciaActual += 1
	if evidenciaActual > 3:
		print("Siguiente nivel")

func GetNewEvidenceTitle() -> String:
	var title:= ""
	if evidenciaActual == 1:
		title = casoActual.urlPrueba1
	elif evidenciaActual == 2:
		title = casoActual.urlPrueba2
	elif evidenciaActual == 3:
		title += casoActual.urlPrueba3
	return title


func _on_burbuja_evidencia_1_pressed() -> void:
	# Abrir el popup
	popup.OpenPopup(GetNewEvidenceTitle(), GetNewDescription(), GetNewEvidencePath())
	# Emitir señal de burbuja seleccionada
	on_normal_bubble.emit()


func _on_burbuja_evidencia_2_pressed() -> void:
	# Abrir el popup
	popup.OpenPopup(GetNewEvidenceTitle(), GetNewDescription(), GetNewEvidencePath())
	# Emitir señal de burbuja seleccionada
	on_angry_bubble.emit()


func _on_burbuja_evidencia_3_pressed() -> void:
	# Abrir el popup
	popup.OpenPopup(GetNewEvidenceTitle(), GetNewDescription(), GetNewEvidencePath())
	# Emitir señal de burbuja seleccionada
	on_relax_bubble.emit()


func _on_close_popup() -> void:
	# Aumentar el indice para pasar a otra evidencia
	IncreseEvidenceIndex()
	# Actualiza las burbujas
	UpdateBubbles()
