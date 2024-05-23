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
	
	args
	---------
	id (int): 
	   player_id according to mutliplayer
	"""
	if not multiplayer.is_server(): return
	var spawn_position = spawn_points[players.size()]
	ActorMan.spawn([id, spawn_position])

func custom_spawn(args: Array) -> CharacterBody2D:
	"""
	args
	---------
	id (int): 
	   player_id according to mutliplayer
	pos (Vector2):
		position to spawn, probably picked from GameMan.spawn_points (Array[Vector2])
	returns
	---------
	p (CharacterBody2D):
		the player to spawn. I believe this needs to be returned in order to spawn it
	"""
	var id = args[0]
	var pos = args[1]
	var p = Actor.instantiate()
	players[id] = p
	p.MultiplayerSyncInput.set_multiplayer_authority(id)
	p.name = str(id) 
	p.position = pos
	return p

func remove_player(id):
	pass
