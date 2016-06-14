require 'assert/factory'

module Factory
  extend Assert::Factory

  module_function

  def css
    "SPAN {\n"\
    "  width: 20px;\n"\
    "  height: 30px;\n"\
    "}\n"
  end

  def css_compiled
    "SPAN {\n"\
    "  width: 20px;\n"\
    "  height: 30px;\n"\
    "}\n"
  end

  def less
    "@nice_blue: #5B83AD;\n"\
    "@light_blue: @nice_blue + #111;\n"\
    "#header {\n"\
    "  color: @light_blue;\n"\
    "}\n"\
    "div {\n"\
    "  width: 1 + 1;\n"\
    "}\n"
  end

  def less_compiled
    "#header { color: #6c94be; }\n"\
    "div { width: 2; }\n"
  end

end
