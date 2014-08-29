# methods だと多すぎてよくわからないので、Object クラスの
# instance_methods は除外する。
class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end
