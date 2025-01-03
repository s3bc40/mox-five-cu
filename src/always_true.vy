# pragma version 0.4.0
# @licence MIT
"""
@author s3bc40
@dev Worshop subject at the end of Mox five section
"""

is_true: public(bool)

@deploy
def __init__():
    self.is_true = False
    
@external
def set_is_true():
    self.is_true = True

@view
@external
def get_is_true() -> bool:
    return self.is_true

    
