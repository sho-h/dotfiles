#!/bin/sh

export PATH="/usr/local/bin/:$PATH"
eval "$(rbenv init - zsh)"

# Syntax check
ruby -w -c $1
rc_exitcode=$?

# Brakeman vulnerability check
rails_root=`bundle exec rake about 2>/dev/null | grep "Application root" | awk '{print $3}'`
if [ "x${rails_root}" != "x" ]; then
  bundle exec brakeman ${rails_root} -f json -z --only-files $1 | ruby -r json -e 'JSON.parse(STDIN.read)["warnings"].collect {|h| path = h["file"].gsub(File.dirname(h["file"]), File.dirname(ARGV[0])); [path, h["line"], h["warning_type"], h["message"]].join(":")}.each {|s| STDERR.puts s}' $1
  exit $? || $rc_exitcode
fi

exit $rc_exitcode
