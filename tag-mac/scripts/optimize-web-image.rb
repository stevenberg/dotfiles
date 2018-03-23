# frozen_string_literal: true

# Brett Terpstra <http://brettterpstra.com>

# Example:
# > file1@2x%%ohc.png
# => Converts png to jpeg, creates 1x and 2x versions, optimizes both with jpegoptim
#
# Available directives:
#
#   %%[och]rXXX[xXXX]
#   o => optimize image
#   c => convert png to jpg
#   h => create a half size image (remove @2x or add _sm)
#   rXXX[xXXX] => resize to max-width or WxH
#
# Requires jpegoptim, pngcrush, and convert (ImageMagick)
require "fileutils"

ARGV.each do |arg|
  input = File.expand_path(arg)
  Process.exit 1 unless File.exist?(input)
  extension = File.extname(input)
  filename = File.basename(input, extension)
  folder = File.dirname(input)

  next unless filename.match?(/%%/)
  targets = []
  m = filename.match(/%%([hcor\dx]+)$/)

  next if m.nil?
  directives = m[1]
  filename.sub!(/%%[hcor\dx]+$/, "")

  if directives =~ /c/ && extension =~ /\.png/i
    target = File.join(folder, filename + ".jpg")
    print "Converting #{input} -> #{target}... "
    res = system %(/usr/local/bin/convert "#{input}" -background white -flatten  -alpha off "#{target}" &> /dev/null)
    if res
      puts "OK"
      FileUtils.mv input, File.expand_path("~/.Trash"), force: true
      extension = ".jpg"
      input = target
      targets.push(target)
    else
      puts "ERROR"
      Process.exit 1
    end
  else
    target = File.join(folder, filename + extension)
    FileUtils.cp input, File.expand_path("~/.Trash")
    FileUtils.mv input, target, force: true
    input = target
    targets.push(target)
  end

  if directives =~ /r(\d+(x(\d+))?)/
    width = Regexp.last_match(1)
    dim = Regexp.last_match(2).nil? ? "#{width}x#{width}" : "#{width}x#{Regexp.last_match(3)}"
    if filename =~ /@2x$/ && directives =~ /h/
      size = (width.to_i / 2).to_s
      puts "#{width} / 2 = #{size}"
    else
      size = width.to_s
      puts "Fullsize = #{size}"
    end
    filename.sub!(/(@2x)?$/, "-#{size}\\1")
    resized = File.join(folder, filename + extension)
    print "Resizing #{input} to #{dim} -> #{resized}... "
    res = system %(/usr/local/bin/convert "#{input}" -adaptive-resize #{dim} "#{resized}" &> /dev/null)
    if res
      puts "OK"
      FileUtils.mv input, File.expand_path("~/.Trash"), force: true
      targets.delete(input)
      targets.push(resized)
      input = resized
    else
      puts "ERROR"
      Process.exit 1
    end
  end

  if directives.match?(/h/)
    halfsize = if filename.match?(/@2x$/)
                 File.join(folder, filename.sub(/@2x$/, "") + extension)
               else
                 File.join(folder, filename + "_sm" + extension)
               end
    print "Halving #{input} -> #{halfsize}... "
    puts %(/usr/local/bin/convert "#{input}" -adaptive-resize 50% "#{halfsize}" &> /dev/null)
    res = system %(/usr/local/bin/convert "#{input}" -adaptive-resize 50% "#{halfsize}" &> /dev/null)
    if res
      puts "OK"
      targets.push(halfsize)
    else
      puts "ERROR"
      Process.exit 1
    end
  end

  next unless directives.match?(/o/)
  targets.each do |target|
    print "Optimizing #{target}... "
    if target =~ /\.jpe?g$/i && File.exist?("/usr/local/bin/jpegoptim")
      res = system %(/usr/local/bin/jpegoptim -fopt --strip-all -m80 -T10 "#{target}" &> /dev/null)
    elsif target =~ /.png$/i && File.exist?("/usr/local/bin/pngcrush")
      res = system %(/usr/local/bin/pngcrush -q -ow "#{target}" &> /dev/null)
    end
    puts res ? "OK" : "ERROR"
  end
end
