extends Node2D

@onready var icon_component : Node = $"IconComponent"
@onready var icon : Sprite2D = $"Icon"
@onready var winner_light : ColorRect = $"WinnerLights"

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

func winner_lights():
	winner_light.color = Color(1, 1, 0, 1)

func winner_lights_off():
	winner_light.color = Color(1, 1, 1, 1)
