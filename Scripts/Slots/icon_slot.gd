extends Node2D

@onready var icon_component : Node = $"IconComponent"
@onready var icon : Sprite2D = $"Icon"

func get_card_texture(key : int):
	var texture_path = icon_component.get_icon_id(key)
	var texture = load(texture_path)
	icon.texture = texture
