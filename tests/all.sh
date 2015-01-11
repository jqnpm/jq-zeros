#!/usr/bin/env bash


fileUnderTest="${BASH_SOURCE%/*}/../jq/main.jq"


# For 9999999999999996 see:
# https://github.com/stedolan/jq/issues/529

read -d '' fourLineTests <<-'EOF' || true
zeros: Can get zeros.
null
zeros(3)
"000"

integer: Can pad single digit number to 0 digits.
1
integer(0)
"1"

integer: Can pad single digit number to 3 digits.
1
integer(3)
"001"

integer: Can pad 5 digit number to 3 digits.
12345
integer(3)
"12345"

integer: Can pad negative single digit number to 3 digits.
-1
integer(3)
"-001"

integer: Can pad negative 5 digit number to 3 digits.
-12345
integer(3)
"-12345"

fractions: Can pad single integer digit number to 3 fraction digits.
1
fractions(3)
"100"

fractions: Can pad 5 integer digit number to 3 fraction digits.
12345
fractions(3)
"12345"

pad: Can pad both integer and fractions.
1.1
pad(3; 3)
"001.100"

pad: Can pad both integer and fractions.
12345.54321
pad(3; 3)
"12345.54321"

pad: Can pad both negative integer and fractions.
-1.1
pad(3; 3)
"-001.100"

pad: Can pad both negative integer and fractions.
-12345.54321
pad(3; 3)
"-12345.54321"

pad: Can pad both integer and fractions without fractions.
1
pad(3; 3)
"001.000"

pad: Can pad both negative integer and fractions without fractions.
-1
pad(3; 3)
"-001.000"

pad: Can pad both integer and fractions with 0 fraction digits.
1
pad(3; 0)
"001"

pad: Can pad both integer and fractions with 1 fraction digits.
1.1
pad(3; 0)
"001.1"

pad: Can pad both integer and fractions with 0 integer digits.
1.1
pad(0; 3)
"1.100"

pad: Can pad both integer and fractions with 0 integer digits.
.1
pad(0; 3)
".100"

pad: Can pad both integer and fractions with 1 integer digits.
1.1
pad(1; 3)
"1.100"

pad: Can pad both integer and fractions with 1 integer digits.
.1
pad(1; 3)
"0.100"

pad: Can pad both integer and fractions for 0.
0
pad(3; 3)
"000.000"

pad: Can pad both integer and fractions for -0.
-0
pad(3; 3)
"-000.000"

pad: Can pad rational number with finite decimal fraction.
null
1/2 | pad(3; 3)
"000.500"

pad: Can pad rational number with infinite decimal fraction.
null
1/3 | pad(3; 3)
"000.3333333333333333"

pad: Can pad rational number with infinite decimal fraction without rounding.
null
2/3 | pad(3; 3)
"000.6666666666666666"

pad: Can pad really high numbers.
9999999999999996
pad(3; 3)
"9999999999999996.000"

pad: Can pad numbers really close to 1.
.9999999999999996
pad(3; 3)
"000.9999999999999996"
EOF

function testAllFourLineTests () {
	echo "$fourLineTests" | runAllFourLineTests
}


# Run tests above automatically.
# Custom tests can be added by adding new function with a name that starts with "test": function testSomething () { some test code; }
source "${BASH_SOURCE%/*}/test-runner.sh"
