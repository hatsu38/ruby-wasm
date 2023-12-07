# frozen_string_literal: true

require 'js'

def document
  @document ||= JS.global[:document]
end

def execute_ruby_code(code)
  result = eval(code)
  document.getElementById('result')[:innerText] = "結果: #{result}"
rescue Exception => e
  document.getElementById('result')[:innerText] = "エラー: #{e.message}"
end

button = document.getElementById('executeButton')

button.addEventListener 'click' do |_e|
  ruby_code = document.getElementById('ruby_code')[:value].to_s
  execute_ruby_code(ruby_code)
end
