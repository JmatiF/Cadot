extends Node

@onready var spin_button : Button = $"../CanvasLayer/SpinButtonContainer/SpinButton"

@onready var button_timer : Timer = $"ButtonTimer"

@onready var spin_button_texture : String = "res://Art/Spin/Spin.png"
@onready var spin_button_pushed_texture : String = "res://Art/Spin/Spin_psuhed.png"

func _ready():
	button_timer.one_shot = true

func _on_spin_button_pressed() -> void:
	var pushed_texture = load(spin_button_pushed_texture)
	spin_button.icon = pushed_texture
	spin_button.disabled = true
	button_timer.start()


func _on_button_timer_timeout() -> void:
	var texture = load(spin_button_texture)
	spin_button.icon = texture
	spin_button.disabled = false
