extends Node

@export var enemy_scenes: Array[PackedScene]
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_enemy_timeout() -> void:
	var enemy_scene = enemy_scenes.pick_random()
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.position = Vector2(152, 165)
	if enemy_instance.name == "eagle":
		enemy_instance.position.y -= 40
	add_child(enemy_instance)


func _on_player_hit() -> void:
	$scoretimer.stop()
	$HUD/score.hide()
	$HUD/finalmessage.show()
	$HUD/finalscore.text = str(score)
	$HUD/finalscore.show()
	$AudioStreamPlayer.pitch_scale = 0.4
	Engine.time_scale = 0.1
	await get_tree().create_timer(3 * Engine.time_scale).timeout
	Engine.time_scale = 1
	get_tree().reload_current_scene()


func _on_scoretimer_timeout() -> void:
	score += 1
	$HUD/score.text = str(score)

func _on_speed_timer_timeout() -> void:
	Engine.time_scale += 0.01
