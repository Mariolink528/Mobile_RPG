extends Node

onready var BattleActionButtons = $UI/BattleActionButtons
onready var PlayerStats = $PlayerStats
onready var Enemy = $Enemy
func _ready():
	start_player_turn()


func start_enemy_turn():
	BattleActionButtons.hide()
	if Enemy != null:
		Enemy.attack(PlayerStats)
		yield(Enemy, "end_turn")
	start_player_turn()

func start_player_turn():
	BattleActionButtons.show()
	PlayerStats.AP = PlayerStats.max_AP
	yield(PlayerStats, "end_turn")
	start_enemy_turn()

func _on_Enemy_Died():
	BattleActionButtons.hide()	
