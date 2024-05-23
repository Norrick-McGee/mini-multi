extends MultiplayerSynchronizer


func _process(delta):
	if self.is_multiplayer_authority():
		get_node("..").inputs['dir'] = Input.get_vector("ui_left","ui_right", 'ui_up','ui_down').normalized()
