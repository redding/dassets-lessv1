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
      @compiled_file = File.join(Dassets.config.root_path, "public/normal-fe8a898deedf1cdbbbdd775ec0152c04.css")
      @exp_compiled_content = @factory.less_compiled

      FileUtils.rm_f @compiled_file
    end

    should "produce a css file with the source less compiled to css" do
      assert_file_exists @source_file
      assert_not_file_exists @compiled_file
      Dassets.digest_source_files

      assert_file_exists @compiled_file
      assert_equal @exp_compiled_content, File.read(@compiled_file)
    end

  end

end
