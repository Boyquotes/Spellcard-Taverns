extends Spatial

var RunewoodGatherers : PackedScene = ResourceLoader.load("res://Assets/MapObjects/Buildings/Gathering/RunewoodGatherers/RunewoodGatherers.tscn")
var VoidStoneGatherers : PackedScene = ResourceLoader.load("res://Assets/MapObjects/Buildings/Gathering/RunewoodGatherers/RunewoodGatherers.tscn")
var LunariumGatherers : PackedScene = ResourceLoader.load("res://Assets/MapObjects/Buildings/Gathering/RunewoodGatherers/RunewoodGatherers.tscn")
var EthertiteGatherers : PackedScene = ResourceLoader.load("res://Assets/MapObjects/Buildings/Gathering/RunewoodGatherers/RunewoodGatherers.tscn")
var AtekGasGatherers : PackedScene = ResourceLoader.load("res://Assets/MapObjects/Buildings/Gathering/RunewoodGatherers/RunewoodGatherers.tscn")
var CurrentSpawnable : StaticBody
var AbleToBuild: bool = true

func _process(delta):
		
	if GameManager.CurrentState == GameManager.State.Building:
		var camera = get_viewport().get_camera()
		var from = camera.project_ray_origin(get_viewport().get_mouse_position())
		var to = from + camera.project_ray_normal(get_viewport().get_mouse_position()) * 1000
		var cursorPos = Plane(Vector3.UP, transform.origin.y).intersects_ray(from, to)
		CurrentSpawnable.translation = Vector3(round(cursorPos.x), cursorPos.y, round(cursorPos.z))
		CurrentSpawnable.ActiveBuildableObject = true	
	if AbleToBuild:
		if Input.is_action_just_released("LeftMouseDown"):
			var obj := CurrentSpawnable.duplicate()
			var navMesh = get_tree().get_nodes_in_group("NavMesh")[0]
			navMesh.add_child(obj)
			get_tree().root.add_child(obj)
			obj.ActiveBuildableObject = false
			obj.runSpawn()
#			obj.setDisabled(false)
			obj.translation = CurrentSpawnable.translation
			navMesh.bake_navigation_mesh(true)
			
 
				
				
			
	if Input.is_action_just_released("MiddleMouseButton"):
		CurrentSpawnable.rotation_degrees += Vector3(0,22.5,0)	
		
	pass
	


func SpawnObj(obj):	
	if CurrentSpawnable != null:
		CurrentSpawnable.queue_free()
	CurrentSpawnable = obj.instance()
#	CurrentSpawnable.SetDisabled(false)
	get_tree().root.add_child(CurrentSpawnable)
	GameManager.CurrentState = GameManager.State.Building
	print("Object Created")
	
	
func SpawnRunewoodGatherers():
	SpawnObj(RunewoodGatherers)

func SpawnVoidStoneGatherers():
	SpawnObj(VoidStoneGatherers)

func SpawnLunariumGatherers():
	SpawnObj(LunariumGatherers)

func SpawnEthertiteGatherers():
	SpawnObj(EthertiteGatherers)

func SpawnAtekGasGatherers():
	SpawnObj(AtekGasGatherers)







