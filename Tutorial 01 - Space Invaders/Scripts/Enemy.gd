extends Area2D

var screensize
export var speed = 100
export var forward_step = 50
var direction

func _ready ():
	screensize = get_viewport_rect ().size
	direction = "left"
	
func _process ( delta ):
	var velocity = 0
	if direction == "left" :
		velocity = -1
	else :
		velocity = 1
	position. x += velocity * speed * delta
	
	if position.x < -50 or position.x > screensize.x + 50 :
		position.y += forward_step
		if direction == "left" :
			direction = "right"
		else :
			direction = "left"