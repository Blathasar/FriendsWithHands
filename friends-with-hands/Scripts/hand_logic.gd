enum HandSign{
	ROCK, PAPER, SCIZZOR, THUMBS_UP, NONE
}

static func convert_finger_positions_to_handsign(finger_positions:int) -> HandSign: 
	match finger_positions:
		0:
			return HandSign.ROCK
		11111:
			return HandSign.PAPER
		110:
			return HandSign.SCIZZOR
		1: 
			return HandSign.THUMBS_UP
	return HandSign.NONE

static func beatsHand(attackingHandSign: HandSign, defendingHandSign: HandSign) -> bool:
	if (attackingHandSign == HandSign.ROCK && 
	defendingHandSign == HandSign.SCIZZOR) || (attackingHandSign == HandSign.PAPER &&
	defendingHandSign == HandSign.ROCK) || (attackingHandSign == HandSign.SCIZZOR && defendingHandSign == HandSign.PAPER):
			return true
	return false
	
	
