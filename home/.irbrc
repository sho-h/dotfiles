require "pp"
# require "rubygems"

# ~/.irbrc.d/ 以下を読み込む。
# c.f. http://d.hatena.ne.jp/miyamuko/20080819/p1
rc_d = File.expand_path(IRB.rc_file("rc.d"))
Dir.glob("#{rc_d}/*.rb").sort.each do |rc|
  puts "Load #{rc}" if $DEBUG
  load rc
end
