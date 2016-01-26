import Text.Regex
import Text.Regex.Posix

reSlump = makeRegex "([D|E]F+)+G"::Regex
reSlimp = makeRegex "AH|A([D|E]F+)+GC|AB(.+)C"::Regex

testCaseSlumps = ["DFG", "EFG", "DFFFFFG", "DFDFDFDFG", "DFEFFFFFG"]
testCaseNotSlumps = ["DFEFF", "EFAHG", "DEFG", "DG", "EFFFFDG"]
testCaseSlimps = ["AH", "ABAHC", "ABABAHCC", "ADFGC", "ADFFFFGC", "ABAEFGCC", "ADFDFGC"]
testCaseNotSlimps = ["ABC", "ABAH", "DFGC", "ABABAHC", "SLIMP", "ADGC"]
testCaseSlurpys = ["AHDFG", "ADFGCDFFFFFG", "ABAEFGCCDFEFFFFFG"]
testCaseNotSlurpys = ["AHDFGA", "DFGAH", "ABABCC"]

isMatched (Just (a,b,c,d)) = (a == "" && b /= "")
isMatched Nothing = False

isFullMatched (Just (a,b,c,d)) = (a == "" && b /= "" && c == "")
isFullMatched Nothing = False

getRecursiveSlimp (Just (a,b,c,d)) = d !! 1
getRecursiveSlimp Nothing = ""

restTestCase (Just (a,b,c,d)) = c
restTestCase Nothing = ""

test regex testCase = if matchedGroup /= "" then test regex matchedGroup else isMatched result
	where
		result = matchRegexAll regex testCase
		matchedGroup = getRecursiveSlimp result

testSlurpy testCase = if isSlimp then isSlump else False
	where
		resultSlimp = matchRegexAll reSlimp testCase
		isSlimp = isMatched resultSlimp
		isSlump = isFullMatched $ matchRegexAll reSlump (restTestCase resultSlimp)


--main = do print (map (test reSlimp) testCaseSlimps)
main = do print (map testSlurpy testCaseSlurpys)

n = input("input test count : ")
	testCases = [input("Test case " + str(i+1) + " : ").upper() for i in range(int(n))]
	print("-"*50)
	print("SLURPYS OUTPUT")
	for testCase in testCases:
		print("YES" if testSlurpy(testCase) else "NO")
	print("END OF OUTPUT")

