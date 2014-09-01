def ls(*args)
  cmds = ["ls"] + args
  system(*cmds)
end

def pwd
  Dir.pwd
end
