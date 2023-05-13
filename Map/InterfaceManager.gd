extends Control

var RunewoodGatherers : PackedScene = ResourceLoader.load("res://Assets/MapObjects/Buildings/Gathering/RunewoodGatherers/RunewoodGatherers.tscn")

func _on_BuildRunewoodGatherersButton_button_down():
	BuildingManager.SpawnRunewoodGatherers()






# Keeps Buildings from spawning on menu bar

func _on_NoBuildZone_area_entered(area):
	BuildingManager.AbleToBuild = false

func _on_NoBuildZone_area_exited(area):
	BuildingManager.AbleToBuild = true
