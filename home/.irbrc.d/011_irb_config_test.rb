# るりまで irb に関するドキュメントを書いた際の名残り。
if false
  IRB.conf[:AP_NAME] = "foo"
  IRB.conf[:IRB_NAME] = "bar"
  IRB.conf[:LOAD_MODULES] = ["csv"]
  IRB.conf[:RC_NAME_GENERATOR] = Proc.new { |rc|
    ["/tmp/myirb.#{rc}"].detect { |path| File.exists?(path) }
  }
  IRB.conf[:MATH_MODE] = true
end
