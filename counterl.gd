extends Label

var accum = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	accum += delta
	text = str(accum)
