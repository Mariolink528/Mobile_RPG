extends Panel

onready var HPLabel = $StatsContainer/HP
onready var APLabel = $StatsContainer/AP
onready var MPLabel = $StatsContainer/MP


func _on_PlayerStats_HP_Changed(value):
	HPLabel.text = "HP\n"+str(value)


func _on_PlayerStats_AP_Changed(value):
	APLabel.text = "AP\n"+str(value) # Replace with function body.


func _on_PlayerStats_MP_Changed(value):
	MPLabel.text = "MP\n"+str(value) # Replace with function body.
