extends Control

var isJS = false

func _ready():
	# Determine if we are running in a JS environment
	if OS.get_name() == "HTML5":
		isJS = true
		print("HTML5 Detected")
	else:
		print("Non-Browser Environment")


#This function tests to see if you can call from the engine into the browser
func _on_Test_1_pressed():
	if !isJS:
		print("Not JS, aborting")
	else:
		JavaScript.eval("test1('Engine Calling to the JS Console')")


func _on_Test_2_pressed():
	if !isJS:
		print("Not JS, aborting")
	else:
		JavaScript.eval("test2()")


func _on_Test_3_pressed():
	if !isJS:
		print("Not JS, aborting")
	else:
		JavaScript.eval("test1('Engine Calling to the JS Console')")
