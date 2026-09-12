enum HandSign{
	ROCK, PAPER, SCIZZOR, THUMBS_UP, NONE
}

static func convert_finger_positions_to_handsign(finger_positions:Array[bool]) -> HandSign: 
	return HandSign.NONE

static func beatsHand(attackingHandSign: HandSign, defendingHandSign: HandSign) -> bool:
	if (attackingHandSign == HandSign.ROCK && 
	defendingHandSign == HandSign.SCIZZOR) || (attackingHandSign == HandSign.PAPER &&
	defendingHandSign == HandSign.ROCK) || (attackingHandSign == HandSign.SCIZZOR && defendingHandSign == HandSign.PAPER):
			return true
	return false
	
	
