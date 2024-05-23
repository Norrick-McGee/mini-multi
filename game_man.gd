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
	add_player(1)

func add_player(id):
	if not multiplayer.is_server(): return
	var spawn_position = spawn_points[players.size()]
	players[id] = 0 # Using players(Dictionary) as a set datatype, so fill it with empty data 0
	ActorMan.add_player(id, spawn_position)

func remove_player(id):
	pass
