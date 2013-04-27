require 'assert'
require 'dassets/engine'
require 'dassets-lessv1'

class Dassets::Lessv1::Engine

  class BaseTests < Assert::Context
    desc "the Dassets::Lessv1 engine"
    setup do
      @engine = Dassets::Lessv1::Engine.new
    end
    subject{ @engine }

    should "be a Dassets engine" do
      assert_kind_of Dassets::Engine, subject
      assert_respond_to 'ext', subject
      assert_respond_to 'compile', subject
    end

    should "transform the input extension to `css`" do
      skip 'todo'
    end

    should "compile any input content as LESS css" do
      skip 'todo'
    end

  end

end
