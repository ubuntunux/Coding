import re

re.match("(?:[D|E]F+)+G", testSlumps).group()

testSlumps = "DFG", "EFG", "DFFFFFG", "DFDFDFDFG", "DFEFFFFFG"
testNotSlumps = "DFEFF", "EFAHG", "DEFG", "DG", "EFFFFDG"
testSlimps = "AH", "ABAHC", "ABABAHCC", "ADFGC", "ADFFFFGC", "ABAEFGCC", "ADFDFGC"
testNotSlimps = "ABC", "ABAH", "DFGC", "ABABAHC", "SLIMP", "ADGC"
testSlurpys = "AHDFG", "ADFGCDFFFFFG", "ABAEFGCCDFEFFFFFG"
testNotSlurpys = "AHDFGA", "DFGAH", "ABABCC"