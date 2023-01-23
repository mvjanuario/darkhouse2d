extends TextEdit
signal SetLabelText(objectName, textInLabel)
signal OpenDoor()
signal setMobilePlayer(mobile)

export(int) var LIMIT = 4
var erase_text = ''

func _on_TextEdit_text_changed():
	var new_text = get_text()
	if new_text.length() >= LIMIT:
		if new_text == "DEAD" || new_text == "Dead" || new_text == "dead":
			emit_signal("OpenDoor")
			emit_signal("SetLabelText", "", "You get a key")
		set_text(erase_text)
		emit_signal("setMobilePlayer", true)
		visible = false

func _on_FinalObjective_setVisibleTextEdit(visibility):
	visible = visibility
	if !visibility:
		set_text(erase_text)
