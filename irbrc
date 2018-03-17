# frozen_string_literal: true

require "awesome_print"

require "bond"
Bond.start

require "irbtools/configure"
Irbtools.welcome_message = nil
Irbtools.start
