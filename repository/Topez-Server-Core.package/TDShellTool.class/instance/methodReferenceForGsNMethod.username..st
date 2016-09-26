find
methodReferenceForGsNMethod: gsNMethod username: username
  | methodRef |
  methodRef := MethodReference new
    setStandardClass: gsNMethod inClass
    methodSymbol: gsNMethod selector.
  username
    ifNotNil: [ 
      | symDictAr |
      symDictAr := (AllUsers
        userWithId: username
        ifAbsent: [ System myUserProfile ]) symbolList
        dictionariesAndSymbolsOf: gsNMethod inClass.
      methodRef symbolDictionary: ((symDictAr at: 1) at: 1) ].
  ^ methodRef