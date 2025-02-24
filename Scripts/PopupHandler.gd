extends Control
class_name PopupHandler

# Signal popup
signal on_close_popup

# Variables component
@export var title: Label
@export var evidence_img: TextureRect
@export var description: RichTextLabel

# Effect component
@export var blurPanel: Panel
@onready var animation_player: AnimationPlayer = $Panel/AnimationPlayer
@onready var sfx: AudioStreamPlayer = $SFX

func OpenPopup(newTitle: String, newDescription: String, evidencePath: String) -> void:
	get_tree().paused = true
	title.text = newTitle
	evidence_img.texture = load(evidencePath)
	description.text = newDescription
	self.visible = true
	await get_tree().create_timer(1.5).timeout
	FadeInAnimation()
	PlaySFX(newTitle)

func PlaySFX(newTitle: String) -> void:
	var path :String = "res://Assets/SFX/sfx_"+newTitle+".wav"
	sfx.stream = load(path)
	sfx.play()

func ClosePopup() -> void:
	get_tree().paused = false
	visible = false
	on_close_popup.emit()
	animation_player.stop()

func FadeInAnimation() -> void:
	animation_player.play("FadeIn")
	
func _on_exit_popup_pressed() -> void:
	ClosePopup()
