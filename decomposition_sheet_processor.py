#!/usr/bin/env python3
import sys, argparse

'''
To Start:
- Nearly everything
To Test/Finish:
- initial help text
- argparser
To Refactor:
- add -v to replace each #comment/uncomment for debug
'''

def main(argv):
  print (argv) #comment/uncomment for debug
  parser = argparse.ArgumentParser(description="Generate new decomposition sheet with items already owned removed from Used to Make column")
  parser.add_argument("-f", "--input-filename", required=True, help="path to file of decomposition csv", dest="sheet")
  parser.add_argument("-w", "--wardrobe", required=True, help="path to file with newline separated wardrobe items", dest="wardrobe")
  parser.add_argument("-o", "--output-file", required=True, help="path to output file destination", dest="output")
  config = parser.parse_args()
  print(config.wardrobe) #comment/uncomment for debug

main(sys.argv[1:])
