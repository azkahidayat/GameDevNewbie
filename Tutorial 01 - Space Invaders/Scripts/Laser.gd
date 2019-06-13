extends Area2D

export var speed = 500

func _ready():
	pass
	
func _process( delta ):
	position. y -= speed * delta
	if position. y < - 50 :
		queue_free()
		
func _on_Laser_area_entered( area ):
	if area.is_in_group( "enemy" ):
		area.queue_free()
		queue_free()