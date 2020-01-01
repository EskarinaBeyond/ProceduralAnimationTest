extends Spatial

onready var game = find_parent("Game")

onready var target = $Target
onready var segment1  = $Segment1
onready var segment2 = $Segment1/Segment2

onready var labels = game.get_node("VBoxContainer").get_children()

func law_of_cos(a, b, c):
	if 2* a * b == 0:
		return(0)
	return acos((a * a + b * b - c * c)/(2  * a * b))

func sss_clac(side_a, side_b, side_c):
	if side_c >= side_a + side_b:
		return{"A": 0, "B": 0, "C": 0}
	var angle_a = law_of_cos(side_b, side_c, side_a)
	var angle_b = law_of_cos(side_c, side_a, side_c) + PI
	var angle_c = PI - angle_a - angle_b
	
	return{"A": angle_a, "B": angle_b, "C": angle_c}


func update_leg_rotation():
	
	segment1.look_at(target.translation, Vector3(0, -1, 0))


func update_le_bend():
	var offset = segment1.translation - target.translation
	var distance = offset.length()
	var seg1_len = (segment1.translation - segment2.translation).length()
	var seg2_len = 3
	
	segment1.rotation.x = - (offset.y / distance) + sss_clac(seg1_len, seg2_len, distance).A
	#segment2.rotation.x = sss_clac(seg1_len, seg2_len, distance).C
	segment2.look_at(target.translation, Vector3(0, -1, 0))
	
	labels[0].text = "offset: " + str(offset)
	labels[1].text = "distance: " + str(distance)
	labels[2].text = "target x : " + str(target.translation.x)
	labels[3].text = "target y : " + str(target.translation.x)
	labels[4].text = "target z : " + str(target.translation.z)
	labels[5].text = "seg1 rot : " + str(segment1.rotation.x)
	labels[6].text = "seg2 rot : " + str(segment2.rotation.x)
	
	
func _ready():
	pass 
	
func _process(delta):
	update_leg_rotation()
	update_le_bend()
	