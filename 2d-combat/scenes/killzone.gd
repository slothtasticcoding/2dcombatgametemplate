extends Area2D
signal  HIT
func _ready() -> void:
	pass  # If connected via editor, no need to connect here
func _on_body_entered(body: Node2D) -> void:
	# Optional: filter to only reload when your player enters
	if body.is_in_group("Player"):
		get_tree().call_deferred("reload_current_scene")

		

# Replace with function body.


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Weapons"):
		HIT.emit()
