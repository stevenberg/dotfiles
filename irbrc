require "awesome_print"
require "semantic"

IRB.conf[:PROMPT_MODE] = :SIMPLE

if Semantic::Version.new(RUBY_VERSION) < Semantic::Version.new("2.7.0")
  require "irb/completion"

  IRB.conf[:AUTO_INDENT] = true
  IRB.conf[:SAVE_HISTORY] = 1000
  IRB.conf[:USE_READLINE] = true
end

begin
  include FactoryBot::Syntax::Methods
rescue NameError
  # do nothing
end
