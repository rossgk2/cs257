AUTHORS: Ross Grogan-Kaylor and Jimmy Zhong

DATA: a dataset of 500+ Pokemon and their attributes, such as types (e.g. water, fire, grass, electric, flying, etc.) and abilities (e.g. berserk, dazzling, fur coat, gluttony, etc.).

Our dataset comes from https://www.kaggle.com/mrdew25/pokemon-database.

STATUS:

- the home page works great.
- each Pokemon's individual page is great.
- the infinite scrolling mechanism is awesome.
- the handling of user input on the advanced search page could be more robust. The user isn't alerted if some non-digit character (other than a hyphen, which is allowed), is entered into a field that is supposed to contain digits. We also don't check for this when processing user input. We would add this if we had more time.

NOTES: a substantial amount of effort went into writing the InfinitePokemonCardScroller class. Jimmy got the infinite scrolling to work in the first place, and Ross did the abstraction. It's possible that Ross spent too much time on this class instead of on other features. (Ross wrote this, so no, Jimmy is not throwing Ross under the bus here!)