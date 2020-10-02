require 'test/unit'
require './items.rb'
require './rules.rb'
require_relative 'app.rb'

module Test
  module Unit
    class CheckoutTest < Test::Unit::TestCase
      def setup
        rules = Rules.rules
        @co = Checkout.new(rules)
      end
      def test_1
        @co.scan(A)
        @co.scan(B)
        @co.scan(C)
        assert_equal(100, @co.total)
      end

      def test_2
        @co.scan(B)
        @co.scan(A)
        @co.scan(B)
        @co.scan(A)
        @co.scan(A)
        assert_equal(110, @co.total)
      end

      def test_3
        @co.scan(C)
        @co.scan(B)
        @co.scan(A)
        @co.scan(A)
        @co.scan(D)
        @co.scan(A)
        @co.scan(B)
        assert_equal(155, @co.total)
      end

      def test_4
        @co.scan(C)
        @co.scan(A)
        @co.scan(D)
        @co.scan(A)
        @co.scan(A)
        assert_equal(140, @co.total)
      end

      def test_fife
        @co.scan(A)
        @co.scan(A)
        @co.scan(A)
        @co.scan(A)
        @co.scan(B)
        @co.scan(B)
        @co.scan(B)
        @co.scan(A)
        @co.scan(A)
        @co.scan(A)
        assert_equal(215, @co.total)
      end

      def tests_rules
        rules_test = Rules.test_rules
        @co_test = Checkout.new(rules_test)
      end
    end
  end
end

