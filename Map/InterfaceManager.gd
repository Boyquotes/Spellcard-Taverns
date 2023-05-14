extends Control

var RunewoodGatherers : PackedScene = ResourceLoader.load("res://Assets/MapObjects/Buildings/Gathering/RunewoodGatherers/RunewoodGatherers.tscn")


func _process(delta):
	$ResourceStats/VBoxContainer/Runewood/VBoxContainer/RunewoodValue.text = str(GameManager.Runewood)
	$ResourceStats/VBoxContainer/Voidstone/VBoxContainer/VoidstoneValue.text = str(GameManager.Voidstone)
#	$ResourceStats/VBoxContainer/Lunarium/VBoxContainer/LunariumValue.text = str(GameManager.Lunarium)
#	$ResourceStats/VBoxContainer/Ethertite/VBoxContainer/EthertiteValue.text = str(GameManager.Ethertite)
#	$ResourceStats/VBoxContainer/AtekGas/VBoxContainer/AtekGasValue.text = str(GameManager.AtekGas)







func _on_BuildRunewoodGatherersButton_button_down():
	BuildingManager.SpawnRunewoodGatherers()

# Keeps Buildings from spawning on menu bar

func _on_NoBuildZone_area_entered(area):
	BuildingManager.AbleToBuild = false

func _on_NoBuildZone_area_exited(area):
	BuildingManager.AbleToBuild = true
