module Arproxy::Plugin
  class Readonly < Arproxy::Base
    Arproxy::Plugin.register(:readonly, self)

    class NotReadonlyError < StandardError; end

    def execute(sql, name = nil)
      if sql =~ /^(SELECT|SET|SHOW|DESCRIBE)\b/
        super sql, name
      else
        raise NotReadonlyError.new("#{name}: #{sql}")
      end
    end
  end
end
