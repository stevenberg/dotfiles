#!/usr/local/opt/ruby/bin/ruby
# frozen_string_literal: true

require "httparty"
require "oga"
require "terminal-notifier"

command =
  %(osascript -e 'tell application "Safari" to get URL of front document')

IO.popen(command, "r") do |p|
  url = p.read.chomp
  response = HTTParty.get(url, headers: { "User-Agent" => "Get Canonical URL" })
  document = Oga.parse_html(response)
  element = document.at_xpath("//link[@rel='canonical']")
  canonical_url = element&.get("href") || url

  IO.popen("pbcopy", "w") do |q|
    q.write(canonical_url)
  end

  TerminalNotifier.notify(
    canonical_url,
    title: "Canonical URL",
    open: canonical_url,
  )
end
