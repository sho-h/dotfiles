begin
  # did_you_meanの実験的な機能を読み込み。
  require 'did_you_mean/experimental'

  # TODO: PRが通らなければ自作のdid_you_mean拡張gemを読み込み。
  # c.f. https://github.com/yuki24/did_you_mean/pull/104
rescue LoadError
  # maybe ruby 2.2 or older
end
