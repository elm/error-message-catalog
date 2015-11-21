
missingElse =
    if True then
        1

nextFunction =
    "something"

-- Current error message is:
-- I need whitespace, but got stuck on what looks like a new declaration. You are
-- either missing some stuff in the declaration above or just need to add some
-- spaces here:
-- I am looking for one of the following things:
--    whitespace
--
-- It hints at "missing some stuff in the declaration above". But, there are no
-- actual hints what is missing. Apparently an if-then statement must have a else
-- statement. I you add the else statement the code compiles. So, the compiler 
-- should check if a else statement is present. And if not it should report it.
--
-- Note: when I delete nextFunction, I get the following error message:
-- I ran into something unexpected when parsing your code!
-- I am looking for one of the following things:
--    an 'else' branch
--    whitespace
--
-- Apparently the parser now does report on the missing else branch.