require 'assert'
require 'dassets-lessv1'

require 'dassets/engine'

class Dassets::Lessv1::Engine

  class UnitTests < Assert::Context
    desc "Dassets::Lessv1::Engine"
    setup do
      @engine = Dassets::Lessv1::Engine.new
    end
    subject{ @engine }

    should have_instance_method :compiler

    should "be a Dassets engine" do
      assert_kind_of Dassets::Engine, subject
      assert_respond_to 'ext', subject
      assert_respond_to 'compile', subject
    end

    should "use a Less compiler with the path set to the source path" do
      c = subject.compiler('')
      assert_kind_of ::Less::Engine, c
      assert_respond_to :to_css, c
      assert_equal subject.opts['source_path'], c.path
    end

    should "transform any input extension to `css`" do
      assert_equal 'css', subject.ext('less')
      assert_equal 'css', subject.ext('lss')
      assert_equal 'css', subject.ext('lessv1')
      assert_equal 'css', subject.ext('whatever')
    end

    should "compile any input content as LESS css" do
      assert_equal @factory.css_compiled,  subject.compile(@factory.css)
      assert_equal @factory.less_compiled, subject.compile(@factory.less)
    end

  end

end
