# pragma version 0.4.0
# @licence MIT
"""
@author s3bc40
@dev Worshop subject at the end of Mox five section
"""

my_message: String[100]

@deploy
def __init__():
    self.my_message = "I am the default one"
    
@external
def set_my_message(new_message: String[100]):
    self.my_message = new_message

@view
@external
def get_my_message() -> String[100]:
    return self.my_message

    
