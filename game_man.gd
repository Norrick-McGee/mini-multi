extends Node2D

@export var Actor: PackedScene 
@export var ActorMan: MultiplayerSpawner
var players: Dictionary = {}
var spawn_points = [
	Vector2(100,0),
	Vector2(300,0),
	Vector2(300,300),
	Vector2(300,600)
]

func _ready():
	ActorMan.spawn_function = custom_spawn
	add_player(1)

func add_player(id):
	"""
	add_player is called by game_man._ready() and by main_man.host_add_player(id)
	"""
	if not multiplayer.is_server(): return
	var spawn_position = spawn_points[players.size()]
	ActorMan.spawn([id, spawn_position])

func custom_spawn(vars):
	var id = vars[0]
	var pos = vars[1]
	var p = Actor.instantiate()
	players[id] = p
	p.MultiplayerSyncInput.set_multiplayer_authority(id)
	p.name = str(id) 
	p.position = pos
	return p

func remove_player(id):
	pass
