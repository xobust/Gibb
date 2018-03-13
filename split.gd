extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var direction
var speed = 100
var sprite

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	sprite = get_node("ring")
	
func _process(delta):
	var newpos = sprite.get_pos()
	if(direction == "up"):
		newpos.y -= speed*delta
	elif(direction == "down"):
		newpos.y += speed*delta
	elif(direction == "left"):
		newpos.x -= speed*delta
	elif(direction == "right"):
		direction = "right"
		newpos.x += speed*delta
		
	sprite.set_pos(newpos)
		