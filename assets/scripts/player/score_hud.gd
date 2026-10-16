extends Label


func _process(delta: float) -> void:
	var score_string = var_to_str(Global.player_score)
	%Score.set_text("Score: " + score_string)
