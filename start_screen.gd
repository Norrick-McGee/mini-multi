extends Control

const PORT = 6767

@export var Main: Node2D
var eNetPeer: ENetMultiplayerPeer = ENetMultiplayerPeer.new()

func _on_host_button_pressed():
	eNetPeer.create_server(PORT)
	main_start_game(eNetPeer)

func _on_join_button_pressed():
	var ipv4 = '127.0.0.1' # TODO: get ipv4 from a text input
	eNetPeer.create_client(ipv4, PORT)
	main_start_game(eNetPeer)

func main_start_game(eNetPeer: ENetMultiplayerPeer):
	multiplayer.multiplayer_peer = eNetPeer
	# {'name':'bob'}.merged({'age':35})
	Main.start_game({})
	self.queue_free()
