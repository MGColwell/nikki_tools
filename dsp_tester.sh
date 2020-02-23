#!/bin/bash

./decomposition_sheet_processor.py >/dev/null 2>/dev/null
TEST_STATUS=$(echo $?)
if [[ "$TEST_STATUS" -ne "2" ]]
then
  echo ":( isn't failing as expected when given no args"
else
  echo ":) failing as expected when given no args"
fi
HAPPY_PATH_RESULTS=$(./decomposition_sheet_processor.py -f test_input_sheet.csv -w test_wardrobe -o test_output_sheet.csv)
TEST_STATUS=$(echo $?)
ASURA_RESULT=$(grep "Dance of Asura" test_output_sheet.csv -c)
FOCUS_RESULT=$(grep "Absolute Focus" test_output_sheet.csv -c)
if [[ "$TEST_STATUS" -ne "0" ]]
then
  echo ":( Happy Path exiting with error code"
  exit
fi
if [[ "$ASURA_RESULT" -ne "1" ]]
then
  echo ":( Happy Path doesn't have Dance of Asura in output"
  TEST_STATUS=$(echo 1)
fi
if [[ "$FOCUS_RESULT" -ne "0" ]]
then
  echo ":( Happy Path has Absolute Focus found in output"
  TEST_STATUS=$(echo 1)
fi
if [[ $TEST_STATUS -eq "0" ]] 
then
  echo ":) Happy Path working as expected"
fi
