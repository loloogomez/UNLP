          ORG      1000H
CADENA    DB       "HELLO"
FINCAD    DB       ?

          ORG      2000H
          MOV      AL, OFFSET FINCAD - OFFSET CADENA
          MOV      BX, OFFSET CADENA
          INT      7
          HLT

END
