# python （利用python將數據圖形化）

*

[](https://gist.github.com/electronut/5641933)https://gist.github.com/electronut/5641933

## python serial port (code)

#!/usr/bin/env python

import sys, serial

import numpy as np

from time import sleep

from collections import deque

from matplotlib import pyplot as plt

# class that holds analog data for N samples

class AnalogData:

  # constr

  def __init__(self, maxLen):

    self.a1 = deque([0.0]*maxLen)

    self.a2 = deque([0.0]*maxLen)

    self.a3 = deque([0.0]*maxLen)

    self.a4 = deque([0.0]*maxLen)

    self.maxLen = maxLen

  # ring buffer

  def addToBuf(self, buf, val):

    if len(buf) < self.maxLen:

      buf.append(val)

    else:

      buf.pop()

      buf.appendleft(val)

  # add data

  def add(self, data):

    assert(len(data) == 4)

    self.addToBuf(self.a1, data[0])

    self.addToBuf(self.a2, data[1])

    self.addToBuf(self.a3, data[2])

    self.addToBuf(self.a4, data[3])

# plot class

class AnalogPlot:

  # constr

  def __init__(self, analogData):

    # set plot to animated

    plt.ion() 

    self.a1line, = plt.plot(analogData.a1)

    self.a2line, = plt.plot(analogData.a2)

    self.a3line, = plt.plot(analogData.a3)

    self.a4line, = plt.plot(analogData.a4)

    plt.ylim([40, 50])

  # update plot

  def update(self, analogData):

    self.a1line.set_ydata(analogData.a1)

    self.a2line.set_ydata(analogData.a2)

    self.a3line.set_ydata(analogData.a3)

    self.a4line.set_ydata(analogData.a4)

    plt.draw()

# main() function

def main():

  strPort = '/dev/ttyUSB0'

  # plot parameters

  analogData = AnalogData(100)

  analogPlot = AnalogPlot(analogData)

  print 'plotting data...'

  # open serial port

  ser = serial.Serial(strPort, 9600)

  while True:

    try:

      line = ser.readline()

      data = [float(val) for val in line.split(',')]

      #print data

      if(len(data) == 4):

        analogData.add(data)

        analogPlot.update(analogData)

    except KeyboardInterrupt:

      print 'exiting'

      break

  # close serial

  ser.flush()

  ser.close()

# call main

if __name__ == '__main__':

 main()