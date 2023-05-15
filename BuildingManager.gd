extends Spatial

var AbleToBuild: bool = true
var CurrentSpawnable : StaticBody

#--- PRODUCTION PLANTS
var RunewoodGatherers : PackedScene = ResourceLoader.load("res://Assets/MapObjects/Buildings/Gathering/RunewoodPlant/RunewoodPlant.tscn")
var VoidstoneGatherers : PackedScene = ResourceLoader.load("res://Assets/MapObjects/Buildings/Gathering/VoidstoneGatherers/VoidstoneGatherers.tscn")
var EthertiteGatherers : PackedScene = ResourceLoader.load("res://Assets/MapObjects/Buildings/Gathering/EthertiteGatherers/EthertiteGatherers.tscn")
var AtekGasGatherers : PackedScene = ResourceLoader.load("res://Assets/MapObjects/Buildings/Gathering/AtekGasGatherers/AtekGasGatherers.tscn")
#--- MISC BUILDINGS
var StorageUnit : PackedScene = ResourceLoader.load("res://Assets/MapObjects/Buildings/Misc Buildings/Storage Unit/StorageUnit.tscn")



func _process(delta):
		
	if GameManager.CurrentState == GameManager.State.Building:
		var camera = get_viewport().get_camera()
		var from = camera.project_ray_origin(get_viewport().get_mouse_position())
		var to = from + camera.project_ray_normal(get_viewport().get_mouse_position()) * 1000
		var cursorPos = Plane(Vector3.UP, transform.origin.y).intersects_ray(from, to)
		CurrentSpawnable.translation = Vector3(round(cursorPos.x), cursorPos.y, round(cursorPos.z))
		CurrentSpawnable.ActiveBuildableObject = true	
		if AbleToBuild && canAfford(CurrentSpawnable): #&& GameManager.AlvPopulation >= CurrentSpawnable.PopulationCost:
			if Input.is_action_just_released("LeftMouseDown"):
				var obj := CurrentSpawnable.duplicate()
				var navMesh = get_tree().get_nodes_in_group("NavMesh")[0]
				navMesh.add_child(obj)
				get_tree().root.add_child(obj)
				obj.ActiveBuildableObject = false
				obj.runSpawn()
				obj.spawned = true
				obj.SetDisabled(false)
				chargeObject(obj)
				obj.translation = CurrentSpawnable.translation
				navMesh.bake_navigation_mesh(true)
			


				
				
			
		if Input.is_action_just_released("MiddleMouseButton"):
			CurrentSpawnable.rotation_degrees += Vector3(0,22.5,0)	
		
	pass


func canAfford(obj) -> bool:
		if GameManager.Runewood - obj.RunewoodCost < 0:
			return false
		if GameManager.Voidstone - obj.VoidstoneCost < 0:
			return false
		if GameManager.Ethertite - obj.EthertiteCost < 0:
			return false
		if GameManager.AtekGas - obj.AtekgasCost < 0:
			return false			
		if GameManager.Lunarium - obj.LunariumCost < 0:
			return false	
		return true					
			
func chargeObject(obj):
	GameManager.Runewood -= obj.RunewoodCost
	GameManager.Ethertite -= obj.EthertiteCost
	GameManager.Voidstone -= obj.VoidstoneCost
	GameManager.Lunarium -= obj.LunariumCost			
	GameManager.AtekGas -= obj.AtekgasCost
	
			
func SpawnObj(obj):	
	if CurrentSpawnable != null:
		CurrentSpawnable.queue_free()
	CurrentSpawnable = obj.instance()
	CurrentSpawnable.SetDisabled(true)
	get_tree().root.add_child(CurrentSpawnable)
	GameManager.CurrentState = GameManager.State.Building
	print("Object Created")
	
## [[ BUILDINGS ]]

#---Production Plants
func SpawnRunewoodGatherers():
	SpawnObj(RunewoodGatherers)
func SpawnVoidstoneGatherers():
	SpawnObj(VoidstoneGatherers)
func SpawnEthertiteGatherers():
	SpawnObj(EthertiteGatherers)
func SpawnAtekGasGatherers():
	SpawnObj(AtekGasGatherers)


#---Misc	
func SpawnStorageUnit():
	SpawnObj(StorageUnit)

#---Decorations
#---Nature
#---Magic
#---Creatures
