extends Area2D
signal SetLabelText(objectName, textInLabel)
signal setVisibleTextEdit(visibility)
signal setMobilePlayer(mobile)

var touching = false;
export var objectName = "";
export var textInLabel = "";

func _process(delta):
	if Input.is_action_just_pressed("interact") && touching:
		showAnswerInput()

func _on_FinalObjective_body_entered(body):
	if body.is_in_group("Player"):
		print("Final Ob in")
		showText()
		touching = true;

func _on_FinalObjective_body_exited(body):
	if body.is_in_group("Player"):
		print("Final Ob out")
		hideText()
		hideAnswerInput()
		touching = false;

func showText():
	emit_signal("SetLabelText", objectName, textInLabel)
	
func hideText():
	emit_signal("SetLabelText", "", "")
	
func showAnswerInput():
	print("Input")
	emit_signal("setVisibleTextEdit", true)
	emit_signal("setMobilePlayer", false)
	
func hideAnswerInput():
	print("Input")
	emit_signal("setVisibleTextEdit", false)
	emit_signal("setMobilePlayer", true)
