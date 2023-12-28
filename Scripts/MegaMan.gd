extends CharacterBody2D

const SPEED = 150.0
var lastdirection= Vector2(0,0)
var running= false

@onready var animatedSprite= $AnimatedSprite2D

func _physics_process(delta):
	_control()
	_animate()
	move_and_slide()

func _control():
	var direction = Input.get_vector("Left", "Right","Up","Down")
	velocity = direction * SPEED
	running = !direction == Vector2.ZERO
	if running: lastdirection= direction

func _animate():
	if running:
		if lastdirection.x>0 : animatedSprite.play("Run_Right")
		elif lastdirection.x<0: animatedSprite.play("Run_Left")
		else:
			if lastdirection.y>0 : animatedSprite.play("Run_Down")
			elif lastdirection.y<0: animatedSprite.play("Run_Up")
	else:
		if lastdirection.x>0 : animatedSprite.play("StandBy_Right")
		elif lastdirection.x<0: animatedSprite.play("StandBy_Left")
		else:
			if lastdirection.y>0 : animatedSprite.play("StandBy_Down")
			elif lastdirection.y<0: animatedSprite.play("StandBy_Up")
