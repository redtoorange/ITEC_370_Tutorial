extends Panel

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Button_pressed():
	$Label.text = "HELLO!"
