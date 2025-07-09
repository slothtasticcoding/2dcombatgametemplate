extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $sword/AnimationPlayer2
@onready var collision_shape_2d: CollisionShape2D = $sword/CollisionShape2D
@onready var sprite_2d: Sprite2D = $sword/Sprite2D
@onready var player: Sprite2D = $Sprite2D
@onready var enemy: Node2D = $"."
@onready var enemy_sprite: Sprite2D = $Sprite2D

var is_left = false
const SPEED = 500
const JUMP_VELOCITY = -500
var guh = 1
var is_down = false
var holding_up = false
#movement code no touchydddddddddd

func _ready() -> void:
		collision_shape_2d.disabled = true
		sprite_2d.hide()
		
		
	
func _physics_process(delta: float) -> void:
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if  direction > 0:
		player.flip_h = false
	if direction < 0:
		player.flip_h = true
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
func _process(delta: float) -> void:
	if Input.is_action_pressed("move_left"):
		is_left = true
	if Input.is_action_pressed("move_right"):
		is_left = false
	if Input.is_action_pressed("upward"):
		holding_up = true
	if Input.is_action_just_released("upward"):
		holding_up = false 
	
	if Input.is_action_pressed("down_attack"):
		is_down = true
	if Input.is_action_just_released("down_attack"):
		is_down = false
	if is_down == true and is_on_floor() == false:
		if Input.is_action_pressed("attack_light"):
			if animation_player.current_animation != ("Downward_lght_attack"):
				sprite_2d.show()
				collision_shape_2d.disabled = false
				animation_player.play("Downward_lght_attack")
	
	
	if Input.is_action_pressed("attack_light") and is_on_floor() == true:
			if is_left == true:
				if animation_player.current_animation != ("Left_light_attack"):
					sprite_2d.show()
					collision_shape_2d.disabled = false
					animation_player.play("Left_light_attack")
			else:
				if animation_player.current_animation != ("Right_light_attack"):  
					sprite_2d.show()
					collision_shape_2d.disabled = false
					animation_player.play("Right_light_attack")
			if animation_player.current_animation == "Downward_ight_attack":
				if is_on_floor():
					animation_player.stop()
			if Input.is_action_pressed("attack_light") and holding_up == true:
				if animation_player.current_animation != ("Upward_light_attack"):
					sprite_2d.show()
					collision_shape_2d.disabled = false
					animation_player.play("Upward_light_attack")
			

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Right_light_attack":
		sprite_2d.hide()
		collision_shape_2d.disabled = true
		animation_player.play("RESET") # Replace with function body..
	if anim_name == "Left_light_attack":
			sprite_2d.hide()
			collision_shape_2d.disabled = true # Replace with function body
			animation_player.play("RESET")
	if anim_name == "Downward_lght_attack":
		sprite_2d.hide()
		collision_shape_2d.disabled = true
		animation_player.play("RESET")
	if anim_name == "Upward_light_attack":
		sprite_2d.hide()
		collision_shape_2d.disabled = true
		animation_player.play("RESET")
		
