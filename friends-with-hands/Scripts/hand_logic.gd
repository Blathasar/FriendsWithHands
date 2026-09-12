class_name HandLogic

enum HandSign{
	ROCK, PAPER, SCIZZOR, THUMBS_UP, NONE
}

static func convert_finger_positions_to_handsign(finger_positions:Array[bool]) -> HandSign: 
	if finger_positions.size() != 5:
		return HandSign.NONE
	match finger_positions:
		[false,false,false,false,false]:
			return HandSign.ROCK
		[true,true,true,true,true]:
			return HandSign.PAPER
		[false,false,true,true,false]:
			return HandSign.SCIZZOR
		[false,false,false,false,true]: 
			return HandSign.THUMBS_UP
	return HandSign.NONE

static func convert_finger_positions_to_string(finger_positions:Array[bool]) -> String:
	if finger_positions.size() != 5:
		return ""
	var finger_string:String
	
	for n in finger_positions.size():
		if (finger_positions[n]):
			finger_string += "1"
		else:
			finger_string += "0"
	
	return finger_string
		
static func beatsHand(attackingHandSign: HandSign, defendingHandSign: HandSign) -> bool:
	if (attackingHandSign == HandSign.ROCK && 
	defendingHandSign == HandSign.SCIZZOR) || (attackingHandSign == HandSign.PAPER &&
	defendingHandSign == HandSign.ROCK) || (attackingHandSign == HandSign.SCIZZOR && defendingHandSign == HandSign.PAPER):
			return true
	return false

	
