extends CanvasLayer




func _process(delta):
	$Panel/ResourceStats/VBoxContainer/Runewood/VBoxContainer/RunewoodValue.text = str(GameManager.Runewood)
	$Panel/ResourceStats/VBoxContainer/Voidstone/VBoxContainer/VoidstoneValue.text = str(GameManager.Voidstone)
	$Panel/ResourceStats/VBoxContainer/Lunarium/VBoxContainer/LunariumValue.text = str(GameManager.Lunarium)
	$Panel/ResourceStats/VBoxContainer/Ethertite/VBoxContainer/EthertiteValue.text = str(GameManager.Ethertite)
	$Panel/ResourceStats/VBoxContainer/AtekGas/VBoxContainer/AtekGasValue.text = str(GameManager.AtekGas)
	
	#
	#
	
# Keeps Buildings from spawning on menu bar
func _on_NoBuildZone_area_entered(area):
	BuildingManager.AbleToBuild = false

func _on_NoBuildZone_area_exited(area):
	BuildingManager.AbleToBuild = true

#
#

## [[ BUILDINGS ]]

#---Production Plants
func _on_BuildRunewoodGatherersButton_button_down():
	BuildingManager.SpawnRunewoodGatherers()
func _on_BuildVoidstoneMine_button_down():
	BuildingManager.SpawnVoidstoneGatherers()
func _on_BuildEthertiteForge_button_down():
	BuildingManager.SpawnEthertiteGatherers()
func _on_BuildAtekGasPlant_button_down():
	BuildingManager.SpawnAtekGasGatherers()
	
	
#---Misc
func _on_BuildStorageUnit_button_down():
	BuildingManager.SpawnStorageUnit()
	
	#---Decorations
	#---Nature
	#---Magic
	#---Creatures











