extends RigidBody2D

func _ready():
	# returns an Array containing all three animation names
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	# pick a random number between 0 and 2 to select one of these names from the list
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])

# mobs delete themselves when they leave the screen
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
