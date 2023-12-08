extends Area2D

func _on_body_entered(body):
	if body is player:
		Global.frutas += 1
		queue_free()
	if Global.frutas == 6 and Global.worldCount == 0:
		get_tree().change_scene_to_file("res://world1.tscn")
		Global.frutas = 0
		Global.worldCount = 1
	if Global.frutas == 6 and Global.worldCount == 1:
		get_tree().change_scene_to_file("res://world2.tscn")
		Global.frutas = 0
