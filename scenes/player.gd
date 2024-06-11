extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

const speed = 125
var canLeave = false

func _physics_process(delta):
	# basic movement
	var xdirection = Input.get_axis("left", "right")
	if xdirection:
		velocity.x = xdirection * speed
		if (xdirection < 0):
			animated_sprite_2d.play("mleft")
		else:
			animated_sprite_2d.play("mright")
	else:
		velocity.x = move_toward(velocity.x, 0, speed/10)
		if (animated_sprite_2d.animation == "mleft"):
			animated_sprite_2d.play("left")
		if (animated_sprite_2d.animation == "mright"):
			animated_sprite_2d.play("right")
	var ydirection = Input.get_axis("up", "down")
	if ydirection:
		velocity.y = ydirection * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed/10)
	if xdirection && ydirection:
		velocity = velocity.normalized() * speed
	
	move_and_slide()
	
	if (Input.is_action_pressed("interact") && canLeave):
		get_tree().change_scene_to_file("res://scenes/control.tscn")


func _on_door_body_entered(body):
	canLeave = true

func _on_door_body_exited(body):
	canLeave = false
