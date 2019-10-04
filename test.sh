#!/bin/bash

# Test success

testSuccess() {
    $EXEC 1 2 -3 > /dev/null
    assertEquals "Exit status doit être 0 en cas de succès (testé avec A=1, B=2, C=-3)" 0 $?
}

# Test arguments

test0arg() {
    $EXEC > /dev/null
    assertEquals "Exit status doit être 1 si pas d'argument" 1 $?
}

test1arg() {
    $EXEC 1 > /dev/null
    assertEquals "Exit status doit être 1 si un argument" 1 $?
}

test2arg() {
    $EXEC 1 1 > /dev/null
    assertEquals "Exit status doit être 2 si un arguments" 1 $?
}

# Test values A B C

testaA() {
    out=$($EXEC 1 2 -3 | grep -qP '[Aa]\s*=')
    assertEquals "Valeur de A non trouvée" 0 $?
}

testbB() {
    out=$($EXEC 1 2 -3 | grep -qP '[Bb]\s*=')
    assertEquals "Valeur de B non trouvée" 0 $?
}

testbC() {
    out=$($EXEC 1 2 -3 | grep -qP '[Cc]\s*=')
    assertEquals "Valeur de C non trouvée" 0 $?
}

testA() {
    out=$($EXEC 1 2 -3 | grep -qP '[A]\s*=')
    assertEquals "A doit être en majuscule" 0 $?
}

testB() {
    out=$($EXEC 1 2 -3 | grep -qP '[B]\s*=')
    assertEquals "B doit être en majuscule" 0 $?
}

testC() {
    out=$($EXEC 1 2 -3 | grep -qP '[C]\s*=')
    assertEquals "C doit être en majuscule" 0 $?
}

# Test values x1, x2
testx1() {
    out=$($EXEC 1 2 -3 | grep -qP 'x1\s*=')
    assertEquals "Valeur de x1 pas trouvée" 0 $?
}

testx2() {
    out=$($EXEC 1 2 -3 | grep -qP 'x2\s*=')
    assertEquals "Valeur de x2 pas trouvée" 0 $?
}

# Test values A, B, C

testValueA() {
    assertEquals "Valeur de A incorrecte" 1 $($EXEC 1 2 -3 | grep -Po 'A\s*=\s*\K\d+(\.\d+)?')
    assertEquals "Valeur de A incorrecte" 1.232 $($EXEC 1.232 2 -3 | grep -Po 'A\s*=\s*\K\d+(\.\d+)?')
    assertEquals "Valeur de A incorrecte" 1.232 $($EXEC 1.232 2 -3 | grep -Po 'A\s*=\s*\K\d+(\.\d+)?')
}

testValueB() {
    assertEquals "Valeur de B incorrecte" 2 $($EXEC 1 2 -3 | grep -Po 'B\s*=\s*\K\d+(\.\d+)?')
    assertEquals "Valeur de B incorrecte" 2.9 $($EXEC 1 2.9 -3 | grep -Po 'B\s*=\s*\K\d+(\.\d+)?')
    assertEquals "Valeur de B incorrecte" 9999.9 $($EXEC 1 9999.9 -3 | grep -Po 'B\s*=\s*\K\d+(\.\d+)?')
}

testValueC() {
    assertEquals "Valeur de C incorrecte" -3 $($EXEC 1 2 -3 | grep -Po 'C\s*=\s*\K-?\d+(\.\d+)?')
    assertEquals "Valeur de C incorrecte" -3.15 $($EXEC 1 2.9 -3.15 | grep -Po 'C\s*=\s*\K-?\d+(\.\d+)?')
    assertEquals "Valeur de C incorrecte" 3.1111 $($EXEC 1 9999.9 3.1111 | grep -Po 'C\s*=-?\s*\K\d+(\.\d+)?')
}

# Test roots

testValueX() {
    assertEquals "Valeur de x1 incorrecte" -1 $($EXEC -1 2 3 | grep -Po 'x1\s*=\s*\K-?\d+(\.\d+)?')

    assertEquals "Valeur de x1 incorrecte" 3 $($EXEC -1 2 3 | grep -Po 'x2\s*=\s*\K-?\d+(\.\d+)?')

    assertEquals "Valeur de x1 incorrecte" 0.841833 $($EXEC 1 2.9 -3.15 | grep -Po 'x1\s*=\s*\K-?\d+(\.\d+)?')

    assertEquals "Valeur de x2 incorrecte" -3.74183 $($EXEC 1 2.9 -3.15 | grep -Po 'x2\s*=\s*\K-?\d+(\.\d+)?')
}

# Test imaginary

testImaginary() {
    $EXEC 1 2 3 > /dev/null
    assertEquals "Exit status doit être 2 en cas de solutions imaginaires (testé avec A=1, B=2, C=3)" 2 $?
}

. shunit2
