extends Area2D

var screensize
export var speed = 300 #kecepatannya pixel/second

onready var bullet = preload ( "res://Scenes/Laser.tscn" )

func _ready():
	#mencari tahu ukuran window, agar nantinya bisa menentukan posisi relatif
	screensize = get_viewport_rect().size
	
func _process( delta ):
	var velocity = 0 #akselerasi, nentuin jalan ato tidak
	if Input.is_action_pressed( "ui_right" ):
		velocity = 1
	if Input.is_action_pressed( "ui_left" ):
		velocity = -1
		
	position.x += velocity * speed * delta
	#clamp >>>biar stay on screen, gk ngilang keluar visible window
	position.x = clamp(position.x, 0, screensize.x)
	
	if Input. is_action_just_pressed ( "ui_select" ):
		var n_bullet = bullet. instance ()
		n_bullet. position = position
		n_bullet. position . y -= 30
		get_node ( "/root/Main" ). add_child (n_bullet)