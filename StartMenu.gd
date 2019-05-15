extends Control

func _on_StartButton_pressed():
	get_tree().change_scene("res://World.tscn")
	pass # Replace with function body.


func _on_QuitButton_pressed():
	get_tree().quit()
	pass # Replace with function body.
