extends StaticBody

var objects : Array
var ActiveBuildableObject : bool

export var AtekgasCost : int
export var RunewoodCost : int
export var VoidstoneCost : int
export var LunariumCost : int
export var EthertiteCost : int 
export var PopulationCost : int

export var IncreasePopCap : bool = false
export var IncreaseCapAmount : int = 5

export var SpawnActor : bool = true
export var Actor : PackedScene
var currentActor
var spawned : bool
  


func _ready():
	$Area.connect("area_entered", self, "_on_Area_area_entered")
	$Area.connect("area_exited", self, "_on_Area_area_exited")
 
func _on_Area_area_entered(area):
	if ActiveBuildableObject:
		objects.append(area)
		BuildingManager.AbleToBuild = false
		pass
#
func _on_Area_area_exited(area):
	if ActiveBuildableObject:
		objects.remove(objects.find(area))
		if(objects.size() <= 0):
			BuildingManager.AbleToBuild = true
		pass 

func runSpawn():
	if SpawnActor:
		var actor = Actor.instance()
		currentActor = actor
		actor.Hut = $SpawnPoint
		get_tree().root.add_child(actor)
		actor.global_translation = $SpawnPoint.global_translation
#	if IncreasePopCap:
#		GameManager.MaxPopulation += IncreaseCapAmount
#
#func runDespawn():
#	if SpawnActor:
#		currentActor.queue_free()
#	GameManager.Population -= PopulationCost
#	if IncreasePopCap:
#		GameManager.Population -= IncreaseCapAmount
#	queue_free()
#

#
func SetDisabled(disabled : bool):
	$CollisionShape.disabled = disabled
