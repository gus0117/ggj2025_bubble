extends Control
class_name PopupHandler

@onready var blurPanel: Panel = $Panel/Body/Blur
@onready var descriptionPanel: MarginContainer = $Panel/Body/Blur/Description
@onready var animation_player: AnimationPlayer = $Panel/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	FadeInAnimation()

func OpenPopup() -> void:
	pass

func ClosePopup() -> void:
	pass

func FadeInAnimation() -> void:
	animation_player.play("FadeIn")
