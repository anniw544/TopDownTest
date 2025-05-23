extends CharacterBody2D
@onready var timer: Timer = $Timer

@export var walk_speed = 0
@export var sprint_mod = 0
@export var deadzone = 0.5
@export var max_stamina = 0
@export var stamina_regen_rate = 0
@export var Sstamina_drain_rate = 0
var stamina = 0
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
	elif Input.is_action_pressed("sprint") && stamina > (Sstamina_drain_rate * 2):
		velocity.x = (walk_speed * horizontal_direction) * sprint_mod
		velocity.y = (walk_speed * vertical_direction) * sprint_mod
		
		
	#Stamina manager
	if !Input.is_action_pressed("sprint"):
		if stamina < max_stamina:
			stamina += stamina_regen_rate
	if stamina < 0:
		stamina = 0
	elif stamina > max_stamina:
		stamina = max_stamina
	
	if Input.is_action_just_pressed("sprint"):
		timer.start()
		
	
		
	move_and_slide()
	rslook()
	print(stamina)


func _on_timer_timeout() -> void:
		stamina -= Sstamina_drain_rate
	
