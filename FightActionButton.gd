extends "res://ActionButton.gd"


func _on_pressed():
	var main = get_tree().current_scene
	var Enemy = main.find_node("Enemy")
	var PlayerStats = main.find_node("PlayerStats")
	if Enemy != null and PlayerStats != null:
		Enemy.take_damage(4)
		PlayerStats.MP += 2
		PlayerStats.AP -= 1
