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

    should "transform any input extension to `css`" do
      assert_equal 'css', subject.ext('less')
      assert_equal 'css', subject.ext('lss')
      assert_equal 'css', subject.ext('lessv1')
      assert_equal 'css', subject.ext('whatever')
    end

    should "compile any input content as LESS css" do
      raw_css_content = read_root_file('css.css')
      exp_css_content = read_root_file('css_compiled.css')
      assert_equal exp_css_content, subject.compile(raw_css_content)

      raw_less_content = read_root_file('normal.less')
      exp_css_content  = read_root_file('normal_compiled.css')
      assert_equal exp_css_content, subject.compile(raw_less_content)
    end

    private

    def read_root_file(rel_path)
      File.read(Dassets.config.root_path.join(rel_path))
    end

  end

end
