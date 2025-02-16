extends Sprite2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer


func _unhandled_input(event: InputEvent) -> void:
	animation_player.play('Roll')
