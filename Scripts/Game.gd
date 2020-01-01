extends Spatial

onready var target = $New_Leg/Target
var speed = 0.1


func _ready():
	pass 

func _process(delta):
	
	if Input.is_action_pressed("up"):
		target.translation.z -= speed
	
	if Input.is_action_pressed("down"):
		target.translation.z += speed
	
	if Input.is_action_pressed("right"):
		target.translation.x += speed
	
	if Input.is_action_pressed("left"):
		target.translation.x -= speed
	
	if Input.is_action_pressed("space"):
		target.translation.y += speed
	
	if Input.is_action_pressed("shift"):
		target.translation.y -= speed
