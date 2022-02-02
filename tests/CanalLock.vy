gate1_down: public(bool) # False = Up (stopping water), True = Down (letting water through)
gate2_down: public(bool) # False = Up (stopping water), True = Down (letting water through)
beneficiary: public(address)
fee: public(uint256)

@external
def __init__(new_beneficiary: address, new_fee: uint256):
    self.beneficiary = new_beneficiary
    self.fee = new_fee

@external
def raise_gate(pick_gate1: bool):
    if pick_gate1:
        self.gate1_down = False # Raise up, stopping the flow of water
    else:
        self.gate2_down = False # Raise up, stopping the flow of water

@external
def lower_gate(pick_gate1: bool):
    if pick_gate1: # Gate 2 cannot
        # Both gates can not be lowered at the same time
        assert not self.gate2_down  # CHANGE ME
        self.gate1_down = True # Lower down, allowing the flow of water
    else:
        # Both gates can not be lowered at the same time
        assert not self.gate1_down
        self.gate2_down = True # Lower down, allowing the flow of water
