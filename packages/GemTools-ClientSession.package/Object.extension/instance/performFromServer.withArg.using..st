*gemtools-clientsession
performFromServer: aSelector withArg: argOop using: aSession
    "optimized version"

    self perform: aSelector with: argOop.
    self flag: 'hackety hack'.
    ^ nil