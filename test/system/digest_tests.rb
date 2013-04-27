require 'assert'
require 'fileutils'
require 'dassets'
require 'dassets-lessv1'

module Dassets::Lessv1

  class DigestTests < Assert::Context
    desc "digesting a less source file with the lessv1 engine registered"
    setup do
      @source_file = File.join(Dassets.config.source_path, "normal.less")
      File.open(@source_file, 'w'){ |f| f.write(@factory.less) }
      @output_file = File.join(Dassets.config.output_path, "normal.css")
      @exp_output_content = @factory.less_compiled

      FileUtils.rm_f @output_file
    end

    should "produce a css file with the source less compiled to css" do
      assert_file_exists @source_file
      assert_not_file_exists @output_file
      Dassets.digest_source_files

      assert_file_exists @output_file
      assert_equal @exp_output_content, File.read(@output_file)
    end

  end

end
