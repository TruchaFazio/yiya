extends CharacterBody2D

@export var move_speed: float
@export var jump_speed: float
@export var gravity: float
var is_facing_rigth = true

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	jump()
	move_x()
	flip()
	move_and_slide()

func jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_speed

func move_x():
	var input_axis = Input.get_axis("move_left", "move_rigth")
	velocity.x = input_axis * move_speed
	
func flip():
	if (is_facing_rigth and velocity.x < 0) or (not is_facing_rigth and velocity.x > 0):
		scale.x *= -1
		is_facing_rigth = not is_facing_rigth
		