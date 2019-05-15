extends KinematicBody2D
const UP = Vector2(0, -1)
const GRAVITY = 20
const ACCELERATION = 50
const MAX_SPEED = 200
const JUMP_HEIGHT = -550
var motion = Vector2() #untuk X Y
var index = 3

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED) #if motion.x > Max_speed so motion.x = max_speed
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED) #if motion.x < -Max_speed so motion.x = max_speed
		$Sprite.flip_h = true
		$Sprite.play("Run")
		
	else:
		$Sprite.play("Idle")
		friction = true
		
		
	if is_on_floor():
		
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
		
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
	motion = move_and_slide(motion, UP)
	pass


func _on_PauseButton_pressed():
	pause_mode


func _on_Area2D_area_shape_entered(area_id, area, area_shape, self_shape):
	get_node(str(index)).queue_free()
	index -= 1
	get_node(".").set_position(get_node("../spawnSpot").get_position())
	if index == 0:
		get_tree().change_scene("res://GameOver.tscn")
	pass # Replace with function body.
