#!/usr/bin/env ruby

require 'fileutils'

def remove_whitespace (filePath, tabSize)
  file = File.open(filePath, "r")
  tmpFilePath = "tmp"
  tmpFile = File.open(tmpFilePath,"w+")
  file.each_line do |line|
    newLine = line.rstrip + $/
    newLine = newLine.gsub(/^([\t])+/){ ' ' * Integer(tabSize) * "#{$&}".size }
    tmpFile.write(newLine)
  end
  file.close
  tmpFile.close
  FileUtils.mv(tmpFilePath,filePath)
end

if __FILE__ == $0
  remove_whitespace(ARGV[0], ARGV[1])
end