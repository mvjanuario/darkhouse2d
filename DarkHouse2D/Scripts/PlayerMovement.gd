extends KinematicBody2D

var speed = 200
var velocity  = Vector2()

onready var animation = $AnimationPlayer

var canMove = true

func _physics_process(delta):
	handled_input(delta)

func handled_input(delta):
	velocity = Vector2()
	
	if Input.is_action_pressed("ui_up") && canMove:
		velocity.y -= 1
		animation.play("BackWalkPlayer")
	elif Input.is_action_pressed("ui_down") && canMove:
		velocity.y += 1
		animation.play("FrontWalkPlayer")
	elif Input.is_action_pressed("ui_left") && canMove:
		velocity.x -= 1
		animation.play("LeftWalkPlayer")
	elif Input.is_action_pressed("ui_right") && canMove:
		velocity.x += 1
		animation.play("RightWalkPlayer")
	else:
		animation.play("IdlePlayer")
	
	velocity.normalized()
	move_and_collide(velocity * speed * delta)
	
func _on_FinalObjective_setMobilePlayer(mobile):
	SetMove(mobile)

func _on_TextEdit_setMobilePlayer(mobile):
	SetMove(mobile)

func SetMove(mobile):
	canMove = mobile
