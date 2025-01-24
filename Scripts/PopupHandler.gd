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

func OpenPopup(newTitle: String, newDescription: String, evidencePath: String) -> void:
	title.text = newTitle
	evidence_img.texture = load(evidencePath)
	description.text = newDescription
	self.visible = true
	await get_tree().create_timer(1.5).timeout
	FadeInAnimation()

func ClosePopup() -> void:
	visible = false

func FadeInAnimation() -> void:
	animation_player.play("FadeIn")
	
func _on_exit_popup_pressed() -> void:
	ClosePopup()
