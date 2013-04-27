require 'assert'
require 'fileutils'
require 'dassets'
require 'dassets-lessv1'

module Dassets::Lessv1

  class DigestTests < Assert::Context
    desc "digesting a less source file with the lessv1 engine registered"
    setup do
      @output_path = File.join(Dassets.config.output_path, "normal.css")
      @exp_css_content = File.read(Dassets.config.root_path.join("normal_compiled.css"))

      FileUtils.rm_f @output_path
    end

    should "produce a css file with the source less compiled to css" do
      assert_not_file_exists @output_path
      Dassets.digest_source_files

      assert_file_exists @output_path
      assert_equal @exp_css_content, File.read(@output_path)
    end

  end

end
