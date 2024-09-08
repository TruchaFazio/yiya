extends CharacterBody2D

@export var gravity: float
const MAX_SPEED : float = 50

var motion := Vector2()


func _ready():
	$AnimatedSprite2D.scale.x = 1
	motion.x = MAX_SPEED
	$AnimatedSprite2D.play("run")
	
func _next_to_left_wall() -> bool:
	return $LeftRay.is_colliding()
	
func _next_to_rigth_wall() -> bool:
	return $RigthRay.is_colliding()
	
func _floor_detection() -> bool:
	return $AnimatedSprite2D/FloorDetection.is_colliding()
	
func _flip():
	motion.x *= -1
	$AnimatedSprite2D.scale.x *= -1
	


func _process(delta):
	pass
	


				
	 
	
	
	move_and_slide()
	
	
