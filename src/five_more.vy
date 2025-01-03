# pragma version 0.4.0
# @license MIT

import favorites
import message
import message_two_step
import always_true

initializes: favorites
exports: (
    # favorites.__interface__
    favorites.retrieve,
    favorites.add_person
)

# @dev workshop module
initializes: message
exports: (
    message.__interface__
)

initializes: always_true
exports: (
    always_true.__interface__
)

initializes: message_two_step[message := message]
exports: (
    message_two_step.get_end_message
)

@deploy
def __init__():
    favorites.__init__()
    message.__init__()
    message_two_step.__init__()
    always_true.__init__()
    
@external
def store(new_number: uint256):
    favorites.my_favorite_number = new_number + 5
    

    
