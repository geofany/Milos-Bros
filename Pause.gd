extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		var pause_state = not get_tree().paused
		get_tree().paused = pause_state
		visible = pause_state

func _on_ResumeButton_pressed():
		var pause_state = not get_tree().paused
		get_tree().paused = pause_state
		visible = pause_state



func _on_MenuButton_pressed():
	get_tree().change_scene("res://StartMenu.tscn")
	get_tree().paused = false
	pass # Replace with function body.
