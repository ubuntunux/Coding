import Text.Regex
import Text.Regex.Posix


reSlump = makeRegex "([D|E]F+G*)+G"::Regex
testCaseSlumps = ["DFG", "EFG", "DFFFFFG", "DFDFDFDFG", "DFEFFFFFG"]
testCaseNotSlumps = ["DFEFF", "EFAHG", "DEFG", "DG", "EFFFFDG"]
testSlimps = ["AH", "ABAHC", "ABABAHCC", "ADFGC", "ADFFFFGC", "ABAEFGCC", "ADFDFGC"]
testNotSlimps = ["ABC", "ABAH", "DFGC", "ABABAHC", "SLIMP", "ADGC"]
testSlurpys = ["AHDFG", "ADFGCDFFFFFG", "ABAEFGCCDFEFFFFFG"]
testNotSlurpys = ["AHDFGA", "DFGAH", "ABABCC"]

unwrap (Just (a,b,c,d)) = b

testSlump testCase = unwrap result
    where result = matchRegexAll (makeRegex "DFG"::Regex) "DFG"

--testSlump testCase = testCase == (match reSlump testCase::String)
--testNoSlump testCase = not $ testSlump testCase

main = do print $ testSlump "DFG"

