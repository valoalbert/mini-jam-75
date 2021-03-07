extends Node

var _good_soul_counter setget set_good_soul, get_good_soul
var _bad_soul_counter setget set_bad_soul, get_bad_soul
var _total_points setget set_total_points, get_total_points

func set_good_soul(good_souls_ammount):
	if good_souls_ammount != null:
		_good_soul_counter = good_souls_ammount

func get_good_soul() -> int:
	return _good_soul_counter

func set_bad_soul(bad_souls_ammount):
	if bad_souls_ammount != null:
		_bad_soul_counter = bad_souls_ammount

func get_bad_soul() -> int:
	return _bad_soul_counter

func set_total_points(total_points_ammount):
	if total_points_ammount != null:
		_total_points = total_points_ammount

func get_total_points() -> int:
	return _total_points