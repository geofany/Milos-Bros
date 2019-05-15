extends Control



func _on_MainMenuButton_pressed():
	get_tree().change_scene("res://StartMenu.tscn")
	pass # Replace with function body.


func _on_ExitButton_pressed():
	get_tree().quit()
	pass # Replace with function body.
