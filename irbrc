require "irb/completion"
require "awesome_print"

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:USE_READLINE] = true

begin
  include FactoryBot::Syntax::Methods
rescue NameError
  # do nothing
end
