require "petitest/dsl"
require "petitest/spec/version"

module Petitest
  module Spec
    class << self
      # @note Override
      def extended(klass)
        klass.extend ::Petitest::DSL

        klass.singleton_class.class_eval do
          alias_method :context, :sub_test
          alias_method :describe, :sub_test
          alias_method :it, :test
          alias_method :specify, :test
        end
      end
    end

    # @param method_name [Symbol]
    def let(method_name, &block)
      define_method(method_name) do
        @memoized_table ||= {}
        @memoized_table.fetch(method_name) do |key|
          @memoized_table[key] = instance_eval(&block)
        end
      end
    end
  end
end
