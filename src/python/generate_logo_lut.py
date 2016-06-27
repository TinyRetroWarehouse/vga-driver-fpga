#!/usr/bin/env python

import os
from PIL import Image

im = Image.open("logo.bmp")
pixels = im.getdata()

width, height = im.size

x, y = 0, 0

def writePixel(color):
    # Green
    if color == 2:
        print "\t\tred = 1'b0;"
        print "\t\tgreen = 1'b1;"
        print "\t\tblue = 1'b0;"
    # White
    elif color == 1:
        print "\t\tred = 1'b1;"
        print "\t\tgreen = 1'b1;"
        print "\t\tblue = 1'b1;"
    # Black
    else:
        print "\t\tred = 1'b0;"
        print "\t\tgreen = 1'b0;"
        print "\t\tblue = 1'b0;"

def moveCursor():
    global x, y
    x = x + 1
    if x >= width:
        y = y + 1
        x = 0

for pixel in pixels:
    if x == 0:
        print ("" if y == 0 else "else ") + "if (y_i == 9'd" + str(y) + ")"
        print "begin"

    if pixel:
        print "\t" + ("" if x == 0 else "else ") + "if (x_i == 10'd" + str(x) + ")"
        print "\tbegin"

        writePixel(pixel)

        print "\tend"

    if x == width - 1:
        print "end"

    moveCursor()
