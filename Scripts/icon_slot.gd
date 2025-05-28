extends Node2D

@onready var icon_component : Node = $"IconComponent"
@onready var icon : Sprite2D = $"Icon"

var card_id : int

func set_card_texture(key : int):
	var texture_path = icon_component.get_icon_id(key)
	var texture = load(texture_path)
	icon.texture = texture
	card_id = key

func get_texture():
	return icon.texture

func get_card_id() -> int:
	return card_id
