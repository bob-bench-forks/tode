stream extensions
nextPutAll: characters
  "Convert line terminators to cr. Note that #nextPut: does not do this conversion."

  characters isEmpty
    ifFalse: [ 
      super nextPutAll: (characters copyReplaceAll: String lf with: String cr).
      self flush ]