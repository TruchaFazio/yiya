extends CharacterBody2D

@export var gravity: float
const chickenRun = 50

func _ready():
	velocity.x = chickenRun
	$AnimatedSprite2D.play("run")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		velocity.x = -chickenRun
		
	if is_on_wall():
		if !$AnimatedSprite2D.flip_h:
			velocity.x = chickenRun
		else:
			velocity.x = -chickenRun
			
		if velocity.x < 0:
			$AnimatedSprite2D.flip_h = false
		elif velocity.x > 0:
			$AnimatedSprite2D.flip_h = true
			
	if is_on_wall():
		if !$AnimatedSprite2D.flip_h:
			velocity.x = -chickenRun
		else:
			velocity.x = chickenRun
			
		if velocity.x < 0:
			$AnimatedSprite2D.flip_h = false
		elif velocity.x > 0:
			$AnimatedSprite2D.flip_h = true
				
				
	 
	
	
	move_and_slide()
	
	
