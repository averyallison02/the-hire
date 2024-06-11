extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var npc = $"."

func _ready():
	if (npc.get_meta("name") == "ari"):
		animated_sprite_2d.play("ari")
	elif (npc.get_meta("name") == "dev"):
		animated_sprite_2d.play("dev")
	elif (npc.get_meta("name") == "cora"):
		animated_sprite_2d.play("cora")
	elif (npc.get_meta("name") == "levi"):
		animated_sprite_2d.play("levi")
