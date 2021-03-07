extends Node

signal soul_grabbed(soul_type) # Connected in LevelScript
signal score_updated(points) # Connected in PointsControlScript

signal soul_delivered # Connected in SoulSpawnSprite
signal end_game