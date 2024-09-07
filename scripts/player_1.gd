extends CharacterBody2D
@export var move_speed: float
@export var jump_speed: float
@export var gravity: float
@export var piedra: PackedScene

var is_facing_rigth = true
@onready var maquina_estados:AnimationTree = $Sprite2D/AnimationTree

func eWalk(active:bool):
	maquina_estados["parameters/conditions/walk"] = active
	maquina_estados["parameters/conditions/reposo"] = not active
		
func eIdle(active:bool):
	maquina_estados["parameters/conditions/reposo"] = active
	maquina_estados["parameters/conditions/walk"] = not active
		
func eRun(active:bool):
	pass
	
func eJump(active:bool):
	maquina_estados["parameters/conditions/jump"] = active
	await get_tree().create_timer(.1).timeout
	maquina_estados["parameters/conditions/jump"] = not active
		
func eLanzar(active:bool):
	maquina_estados["parameters/conditions/lanzar"] = active
	await get_tree().create_timer(.1).timeout
	maquina_estados["parameters/conditions/lanzar"] = not active
	
func eDaño(active:bool):
	pass
	
func eDie(active:bool):
	pass

func _input(event):
	if event.is_action_pressed("arrojar"):
		eLanzar(true)
		
	if event.is_action_pressed("jump"):
		eJump(true)

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
	
	if velocity.x:
		eWalk(true) 
	else:
		eIdle(true)
	
func flip():
	if (is_facing_rigth and velocity.x < 0) or (not is_facing_rigth and velocity.x > 0):
		scale.x *= -1
		is_facing_rigth = not is_facing_rigth
	
