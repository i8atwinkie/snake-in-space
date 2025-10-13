extends CharacterBody2D

@onready var segment_controller = $Segments
@onready var draw_vector = $DrawVector

@export var base_speed = 200
@export var turn_speed = TAU

var speed = base_speed
var strike_location: Vector2
var current_strike_time = 0
var strike_duration = 0.25
var strike_length = 150

enum States {MOVEMENT, WINDUP, STRIKE}
var state: States = States.MOVEMENT

func _ready() -> void:
	for i in range(0, 10):
		segment_controller.add_segment()

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_EQUAL:
			segment_controller.add_segment()
		if event.pressed and event.keycode == KEY_MINUS:
			segment_controller.remove_segment()

func _physics_process(delta: float) -> void:
	match state:
		States.MOVEMENT:
			movement(delta)
		States.WINDUP:
			windup(delta)
		States.STRIKE:
			strike(delta)
	
	draw_vector.vector = velocity / 2

func enter_movement_state() -> void:
	state = States.MOVEMENT

func movement(delta) -> void:
	# Input handling for movement
	if Input.is_action_pressed("ui_select"):
		speed = base_speed * 1.5
	else:
		speed = base_speed
	
	#var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var input_axis = Input.get_axis("ui_left", "ui_right")
	var angle = velocity.angle()
	angle += input_axis * turn_speed * delta
	
	velocity = Vector2.from_angle(angle).normalized() * speed
	
	move_and_slide()
	
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
	velocity = strike_location / strike_duration

func strike(delta) -> void:
	current_strike_time += delta
	if current_strike_time >= strike_duration:
		velocity = velocity.normalized() * speed
		enter_movement_state()
	move_and_slide()
