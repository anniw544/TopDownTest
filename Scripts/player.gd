extends CharacterBody2D

@export var walk_speed = 0
@export var sprint_mod = 0
@export var deadzone = 0.5
var rs_look = Vector2(0,0)

#Player look
func rslook():
		rs_look.y = Input.get_axis("aim_up", "aim_down")
		rs_look.x = Input.get_axis("aim_left", "aim_right")
		if rs_look.length() >= deadzone:
			rotation = rs_look.angle()

func _physics_process(delta):
	
	#Player Movment
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	var vertical_direction = Input.get_axis("move_up", "move_down")
	if !Input.is_action_pressed("sprint"):
		velocity.x = walk_speed * horizontal_direction
		velocity.y = walk_speed * vertical_direction
	elif Input.is_action_pressed("sprint"):
		velocity.x = (walk_speed * horizontal_direction) * sprint_mod
		velocity.y = (walk_speed * vertical_direction) * sprint_mod
	
	move_and_slide()
	rslook()

	
	
