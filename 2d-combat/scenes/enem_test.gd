extends Node2D
@onready var node_2d: Node2D = $"."
@onready var killzone: Area2D = $killzone
@onready var collision_shape_2d: CollisionShape2D = $killzone/CollisionShape2D
@onready var sprite_2d: Sprite2D = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta'dadadadadadadada is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_killzone_hit() -> void:
	queue_free()
	# Replace with function body.
