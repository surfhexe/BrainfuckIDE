extends Control

var data
var elems
var i=0
var elemSize=Vector2(300, 200)
const ElemScene = preload("res://Scenes/data_elem.tscn")

func _ready():
	data=[0]
	elems=[]
	addElemDisplay()
	moveMarker(0)
	#set_process(true)

func movePtr(offset):
	i+=offset
	
	if i < 0:
		throwError("you went too far left")
		i=0
	
	while data.size() <= i:
		data.push_back(0)
	
	while elems.size() <= i:
		addElemDisplay()
	
	moveMarker(0.4)

func moveMarker(time):
	var pos = Vector2(elemSize.x*(i+0.5), elemSize.y)
	get_node("marker").moveTo(pos, time)

func addVal(amount):
	data[i]+=amount
	elems[i].changeVal(data[i], 0.4)
	
func getVal():
	return data[i]

func blinkOp(opText):
	get_node("marker").blink(opText, 0.4)

func addElemDisplay():
	var elem = ElemScene.instance()
	get_node("data_holder").add_child(elem)
	elem.set_pos(Vector2(elems.size()*elemSize.x, 0))
	elem.set_size(elemSize)
	elems.push_back(elem)

func throwError(msg):
	print("ERROR: " + msg)
