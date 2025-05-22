extends CharacterBody2D

@export var walk_speed = 0

func _physics_process(delta):
	
	#Player Movment
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	var vertical_direction = Input.get_axis("move_up", "move_down")
	velocity.x = walk_speed * horizontal_direction
	velocity.y = walk_speed * vertical_direction
	move_and_slide()
	
	
