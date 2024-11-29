extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PlayButton.connect("pressed", Callable(self, "_on_PlayButton_pressed"))
	$LeftButton.connect("pressed", Callable(self, "_on_LeftButton_pressed"))
	$RightButton.connect("pressed", Callable(self, "_on_RightButton_pressed"))

func _on_PlayButton_pressed() -> void:
	print("Play button pressed")

func _on_LeftButton_pressed() -> void:
	print("Left button pressed")

func _on_RightButton_pressed() -> void:
	print("Right button pressed")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
