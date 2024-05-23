extends MultiplayerSpawner
@export var Actor: PackedScene 

func custom_spawn(vars):
	var id = vars[0]
	var pos = vars[1]
	var p = Actor.instantiate()
	p.MultiplayerSyncInput.set_multiplayer_authority(id)
	p.name = str(id) 
	p.position = pos
	return p
	
func _ready():
	self.spawn_function = custom_spawn

func add_player(id, spawn_position):
	self.spawn([id, spawn_position])
