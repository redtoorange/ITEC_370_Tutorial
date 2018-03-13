extends Node

export(PackedScene) var Mob
var score

func _ready():
	randomize()
	if OS.get_name() == "HTML5":
		OS.set_window_maximized(true)


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	
	$HUD.show_game_over()

func new_game():
	score = 0
	$Player.start( $StartPosition.position )
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	

func _on_MobTimer_timeout():
	$MobPath/MobSpawnLocation.set_offset(randi())
	var mob = Mob.instance()
	add_child(mob)
	var direction = $MobPath/MobSpawnLocation.rotation + PI/2
	mob.position = $MobPath/MobSpawnLocation.position
	direction += rand_range(-PI/4, PI/4)
	mob.rotation = direction
	mob.set_linear_velocity(Vector2(rand_range(mob.MIN_SPEED, mob.MAX_SPEED), 0).rotated(direction))


func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)


func _on_StartTimer_timeout():
	$ScoreTimer.start()
	$MobTimer.start()
