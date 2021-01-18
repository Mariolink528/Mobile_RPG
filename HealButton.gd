extends "res://ActionButton.gd"


func _on_pressed():
	var main = get_tree().current_scene
	var PlayerStats = main.find_node("PlayerStats")
	if PlayerStats != null:
		if PlayerStats.MP >= 8:
			PlayerStats.HP += 5
			PlayerStats.MP -= 8
			PlayerStats.AP -= 1
	
