extends Area2D

signal coinCollected

func _on_body_entered(body):
	emit_signal("coinCollected")
	queue_free()
	pass # Replace with function body.
