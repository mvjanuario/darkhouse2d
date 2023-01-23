extends Area2D
signal SetLabelText(objectName, textInLabel)

var touching = false;
export var objectName = "";
export var textInLabel = "";

func _process(delta):
	if Input.is_action_just_pressed("interact") && touching:
		print("Interacting with ", objectName)
		
func _on_Object_body_entered(body):
	if body.is_in_group("Player"):
		print("touching ", objectName)
		showText()
		touching = true;

func _on_Object_body_exited(body):
	if body.is_in_group("Player"):
		print("not touching ", objectName)
		hideText()
		touching = false;

func showText():
	emit_signal("SetLabelText", objectName, textInLabel)
	
func hideText():
	emit_signal("SetLabelText", "", "")
