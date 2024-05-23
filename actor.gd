extends CharacterBody2D

@export var MultiplayerSyncInput: MultiplayerSynchronizer
@export var MultiplayerSyncPos: MultiplayerSynchronizer
@export var inputs: Dictionary = {'dir':Vector2()}


const SPEED = 300.0

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var dir = inputs['dir']
	if dir:
		velocity.x = dir.x * SPEED
		velocity.y = dir.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
