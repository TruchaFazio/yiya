extends CharacterBody2D

@onready var animated_sprite = $PinkMonsterReposo
@export var move_speed: float
@export var jump_speed: float
@export var gravity: float
var is_facing_rigth = true
var arrojando

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	jump()
	move_x()
	flip()
	arrojar()
	update_animations()
	move_and_slide()
		
func update_animations():	
	if not is_on_floor():
		if velocity.y < 0:
			animated_sprite.play("jump")
		else:
			animated_sprite.play("jump")
		return
		
	if velocity.x:
		animated_sprite.play("run")
	else:
		animated_sprite.play("reposo")
					
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
	
func arrojar():
	if Input.is_action_just_pressed("arrojar"):
		animated_sprite.play("arrojar")
		arrojando = true
	else:
		arrojando = false
		
	
		
