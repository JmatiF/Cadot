extends Node


var icon_map := {
	1 : "res://Art/Icons/Clasics/Bar3.png",
	2 : "res://Art/Icons/Clasics/Bar5.png",
	3 : "res://Art/Icons/Clasics/Bar.png",
	4 : "res://Art/Icons/Clasics/Cherry.png",
	5 : "res://Art/Icons/Clasics/SevenB.png",
	6 : "res://Art/Icons/Clasics/SevenW.png", # Finish Clasics
	7 : "res://Art/Icons/Wildcard/Blue.png", # Start Wildcard
	8 : "res://Art/Icons/Wildcard/Spin.png", # Finish Wildcard
	9 : "res://Art/Icons/Bonuses/Bunny.png" #Star Finish Bonuses
}

func get_icon_id(key: int) -> String:
	return icon_map.get(key, null)
