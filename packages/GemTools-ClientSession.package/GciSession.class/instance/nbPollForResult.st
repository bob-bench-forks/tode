private gci calls
nbPollForResult
  | i assoc |
  i := 0.
  [ 
  assoc := self library nbEnd.
  assoc key < 2 ]
    whileTrue: [ 
      i := i + 5 min: 50.
      self nbSleep: i ].
  Transcript
    cr;
    show: 'GciSession>>getNbResult nbEnd: ' , assoc value printString.
  ^ assoc value