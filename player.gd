extends CharacterBody2D

@onready var seek: Seek = $Seek

@export var base_speed = 200
@export var acceleration = 2

var speed = base_speed
var strike_location: Vector2
var current_strike_time = 0
var strike_duration = 0.25
var strike_length = 150

enum States {MOVEMENT, WINDUP, STRIKE}
var state: States = States.MOVEMENT

func _physics_process(delta: float) -> void:
	match state:
		States.MOVEMENT:
			movement(delta)
		States.WINDUP:
			windup(delta)
		States.STRIKE:
			strike(delta)

func enter_movement_state() -> void:
	state = States.MOVEMENT

func movement(delta) -> void:
	# Input handling for movement
	if Input.is_action_pressed("ui_select"):
		speed = base_speed * 1.5
	else:
		speed = base_speed
	
	var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var desired_velocity = input_vector * speed
	
	seek.target = desired_velocity
	seek.ratio = 1
	seek.seek(delta)
	
	if Input.is_action_just_pressed("ui_attack"):
		enter_windup_state()

func enter_windup_state() -> void:
	state = States.WINDUP
	velocity = Vector2.ZERO

func windup(delta) -> void:
	if Input.is_action_just_released("ui_attack"):
		enter_strike_state()

func enter_strike_state():
	state = States.STRIKE
	current_strike_time = 0
	strike_location = global_position.direction_to(get_global_mouse_position()) * strike_length
	print(strike_location)
	velocity = strike_location / strike_duration

func strike(delta) -> void:
	current_strike_time += delta
	if current_strike_time >= strike_duration:
		velocity = Vector2.ZERO
		enter_movement_state()
	move_and_slide()
