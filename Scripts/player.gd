extends CharacterBody3D
@onready var weapon = $"../Weapon"
@onready var camera = $Camera
@onready var pistol = $Camera/Pistol
@onready var flashlight = $Camera/Flashlight
@onready var tablegun = $"../Pistol"
@onready var laptop = $Laptop
@onready var laptopPick = $"../LaptopPick"
@onready var laptopCase = $"../Laptop"

const SPEED = 10.0
const JUMP_VELOCITY = 6.0
var sensitivity = 0.003

func player():
	pass

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	pistol.visible = false
	flashlight.visible = true
	laptop.visible = false
	
func _process(float) -> void:
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()
		
	if weapon.visible == true:
		if Input.is_action_just_pressed("e"):
			pistol.visible = true
			flashlight.visible = false
			weapon.visible = false
			tablegun.visible = false
	
	elif laptopPick.visible == true:
		if Input.is_action_just_pressed("e"):
			pistol.visible = false
			flashlight.visible = false
			weapon.visible = false
			laptopPick.visible = false
			laptop.visible = true
			tablegun.visible = false
			laptopCase.visible = false


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and State.in_dialogue == false:
		velocity.y = JUMP_VELOCITY

	var input_dir := Input.get_vector("a", "d", "w", "s")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	if direction and State.in_dialogue == false:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func _unhandled_input(event):
	if event is InputEventMouseMotion and State.in_dialogue == false:
		rotate_y(-event.relative.x * sensitivity)
		camera.rotate_x(-event.relative.y * sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(70))
