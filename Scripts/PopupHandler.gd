extends Control
class_name PopupHandler

# Variables component
@export var title: Label
@export var evidence_img: TextureRect
@export var description: RichTextLabel

# Effect component
@export var blurPanel: Panel
@onready var animation_player: AnimationPlayer = $Panel/AnimationPlayer

#Se utiliza un recurso para guardar las imagenes
@export var evidences: EvidenceDB

func OpenPopup(newTitle: String, newDescription: String, evidencePath: String) -> void:
	get_tree().paused = true
	title.text = newTitle
	evidence_img.texture = load(evidencePath)
	description.text = newDescription
	self.visible = true
	await get_tree().create_timer(1.5).timeout
	FadeInAnimation()

func ClosePopup() -> void:
	get_tree().paused = false
	visible = false
	animation_player.stop()

func FadeInAnimation() -> void:
	animation_player.play("FadeIn")
	
func _on_exit_popup_pressed() -> void:
	ClosePopup()
