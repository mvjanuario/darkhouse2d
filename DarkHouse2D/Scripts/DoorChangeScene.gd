extends Area2D
signal SetLabelText(objectName, textInLabel)

var touching = false;
export var room = "";
export var opened = true;

func _process(delta):
	if Input.is_action_just_pressed("interact") && touching && opened:
		print("Interacting with door ", room)
		get_tree().change_scene(str("res://scenes/", room, ".tscn"))
	if Input.is_action_just_pressed("interact") && touching && !opened:
		emit_signal("SetLabelText", "", "That door is closed. Looks like I need to find the key")

func _on_Door_body_entered(body):
	if body.is_in_group("Player"):
		print("Room: ", room, opened)
		touching = true;

func _on_Door_body_exited(body):
	if body.is_in_group("Player"):
		print("Room:", room, opened)
		emit_signal("SetLabelText", "", "")
		touching = false;

func _on_TextEdit_OpenDoor():
	opened = true;
