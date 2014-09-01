# IRBを拡張する。
begin
  require 'wirble'
  opts = {
    # IRBの機能で、ヒストリの保存は実現してるから無効にする。
    :skip_history => true,

    # シンタックスハイライトを有効にする。Wirble.colorize でも可能だけど、
    # Wirble.init に optsを渡すのでこちらで行う。
    :init_colors => true,
  }
  Wirble.init(opts)
rescue LoadError => e
  warn "failed to require '#{e.library_name}'" if $DEBUG
end
