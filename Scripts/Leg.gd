extends Spatial

onready var skel = $Leg_Skeleton/Skeleton
var id

func _ready():
	id = skel.find_bone("Bone")
	set_process(true)

func _process(delta):
	var t = skel.get_bone_pose(id)
	t = t.rotated(Vector3(0.0, 1.0, 0.0), 0.9 * delta)
	skel.set_bone_pose(id, t)