extends Control
class_name PopupHandler

# Variables component
@onready var title: Label = $Panel/Header/Title
@onready var evidence_img: TextureRect = $Panel/Body/EvidenceImg
@onready var description: RichTextLabel = $Panel/Body/Blur/Description/RichTextLabel

# Effect component
@onready var blurPanel: Panel = $Panel/Body/Blur
@onready var descriptionPanel: MarginContainer = $Panel/Body/Blur/Description
@onready var animation_player: AnimationPlayer = $Panel/AnimationPlayer

#Se utiliza un recurso para guardar las imagenes
@export var evidences: EvidenceDB


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	OpenPopup(0)

func OpenPopup(newIndex: int) -> void:
	upgradeUI(newIndex)
	self.visible = true

func upgradeUI(index: int)->void:
	title.text = evidences.evidenceDB[index].title
	evidence_img.texture = load(evidences.evidenceDB[index].img)
	description.text = evidences.evidenceDB[index].description

func ClosePopup() -> void:
	pass

func FadeInAnimation() -> void:
	animation_player.play("FadeIn")
