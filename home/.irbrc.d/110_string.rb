# "10:00" - "09:00" といった計算を行う。
# String#- は本来存在しないため、alias などは対応しない。
# c.f. https://gist.github.com/311940
class String
  def -(val)
    if TIME_RE =~ self && TIME_RE =~ val
      if self.length == 8 || val.length == 8
        with_sec = true
      end
      require "time"
      d = Time.parse(self) - Time.parse(val)
      sec = d % 60
      min = (d / 60) % 60
      hour = (d / 60 / 60) % 24
      res = ("%02d:%02d" % [hour, min])
      if with_sec
        res << ":%02d" % sec
      end
      return res
    else
      raise NoMethodError, "undefined method `-' for #{self.inspect}:#{self.class}"
    end
  end

  TIME_RE = /\A[0-2]\d:[0-5]\d(?::[0-5]\d)?\z/

  if RUBY_VERSION >= "1.9.3"
    private_constant :TIME_RE
  end
end
