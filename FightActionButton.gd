extends "res://ActionButton.gd"

const Slash = preload("res://Slash.tscn")

func _on_pressed():
	var Enemy = BattleUnits.Enemy
	var PlayerStats = BattleUnits.PlayerStats
	if Enemy != null and PlayerStats != null:
		create_slash(Enemy.global_position)
		Enemy.take_damage(4)
		PlayerStats.MP += 2
		PlayerStats.AP -= 1

func create_slash(position):
	var slash = Slash.instance()
	var main = get_tree().current_scene
	main.add_child(slash)
	slash.global_position = position
