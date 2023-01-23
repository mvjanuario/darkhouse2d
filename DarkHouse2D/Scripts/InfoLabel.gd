extends Node2D

onready var objectNameLabel = $ObjectNameLabel
onready var infoLabel = $InfoLabel

func _on_Interaction_SetLabelText(objectName, text):
	SetText(objectName, text)

func _on_FinalObjective_SetLabelText(objectName, text):
	SetText(objectName, text)

func _on_TextEdit_SetLabelText(objectName, text):
	SetText(objectName, text)

func _on_Door2_SetLabelText(objectName, text):
	SetText(objectName, text)

func SetText(objectName, text):
	objectNameLabel.set_text(objectName)
	infoLabel.set_text(text)
