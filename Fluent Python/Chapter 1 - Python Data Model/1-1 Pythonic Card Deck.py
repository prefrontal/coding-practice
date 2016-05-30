# Pythonic Card Deck

# By using standard Python special methods a class can inherit 
# a broad range of standard functionality automatically

import collections

Card = collections.namedtuple('Card', ['rank', 'suit'])

class FrenchDeck:
    ranks = [str(n) for n in range(2, 11)] + list('JQKA')
    suits = 'spades diamonds clubs hearts'.split()

    def __init__(self):
        self._cards = [Card(rank, suit) for suit in self.suits
                       for rank in self.ranks]

    def __len__(self):
        return len(self._cards)

    def __getitem__(self, position):
        return self._cards[position]

# Test the FrenchDeck class implementation
deck = FrenchDeck()

# Supports length and index selection
print (len(deck))
print (deck[0])

# Supports slicing
print (deck[:3])

# Supports Iteration
for card in deck:
    print (card)
