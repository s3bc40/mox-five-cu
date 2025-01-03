# pragma version 0.4.0
# @licence MIT
"""
@author s3bc40
@dev Worshop subject at the end of Mox five section
"""

import message

uses: message

end_message: String[100]

@deploy
def __init__():
    self.end_message = "Vyper is great!"

@view
@external
def get_end_message() -> String[204]:
    return concat( message.my_message, " // ", self.end_message)

    
