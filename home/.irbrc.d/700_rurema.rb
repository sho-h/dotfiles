# Object.method(:foo).rurema! でるりまを参照する。
# c.f. http://hibariya.github.com/entries/20120723.html
begin
  require "ruremai"

  # firefox でるりまを開く。
  ENV['BROWSER'] = "firefox"

  # Object.m で Method オブジェクトを取得する。
  class Object
    alias m method
  end

  # メソッドだけじゃなくてクラスも。
  require "launchy"
  class Class
    def rurema!
      url = File.join([
        "http://doc.ruby-lang.org/ja/", RUBY_VERSION, "class",
        # TODO: もう少しまともに修正する。
        self.to_s.gsub(/:/, "=3a")
      ]) + ".html"
      Launchy.open(url)
    end
  end
rescue LoadError => e
  warn "failed to require '#{e.library_name}'" if $DEBUG
end
