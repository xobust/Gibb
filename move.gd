extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var direction = "up"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	pass
	
func _process(delta):
	var newpos = get_node("player").get_pos()
	if(Input.is_action_pressed("move_up")):
		direction = "up"
		newpos.y -= 50*delta
	if(Input.is_action_pressed("move_down")):
		direction = "down"
		newpos.y += 50*delta
	if(Input.is_action_pressed("move_left")):
		direction = "left"
		newpos.x -= 50*delta
	if(Input.is_action_pressed("move_right")):
		direction = "right"
		newpos.x += 50*delta
	
	if(Input.is_action_pressed("shoot")):
		var scene = load("res://ring.tscn") # will load when parsing the script
		var ring = scene.instance()
		add_child(ring)
		ring.direction = direction
		ring.sprite.set_pos(newpos)
		
	get_node("player").set_pos(newpos)
	