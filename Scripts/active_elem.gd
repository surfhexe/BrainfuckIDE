extends Control

const AnimData = preload("anim_data.gd")
var labelAnim = AnimData.new(0)
var posAnim = AnimData.new(Vector2(0, 0))

func _ready():
	set_process(true)
	
func _process(delta):
	if !labelAnim.done():
		labelAnim.advance(delta)
		var a = labelAnim.get()
		if a > 1:
			a = 2-a
		print(a)
		get_node("marker_label").set_opacity(a)
	
	if !posAnim.done():
		posAnim.advance(delta)
		set_pos(posAnim.get())

func blink(text, time):
	get_node("marker_label").set_text(text)
	labelAnim.start(0, 0)
	labelAnim.start(2, time)

func moveTo(newPos, time):
	print("moveTo called with " + str(newPos))
	posAnim.start(newPos, time)