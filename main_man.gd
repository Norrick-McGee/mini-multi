extends Node2D

var GameMan: Node2D

func start_game(kwargs: Dictionary):
	GameMan = load("res://game_man.tscn").instantiate()
	self.add_child(GameMan)
	if multiplayer.is_server():
		multiplayer.peer_connected.connect(host_add_player)
		multiplayer.peer_disconnected.connect(host_drop_player)
	else:
		pass
	
func host_add_player(id):
	GameMan.add_player(id)

func host_drop_player(id):
	GameMan.remove_player(id)
	
