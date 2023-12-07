# frozen_string_literal: true

require 'js'

def document
  @document ||= JS.global[:document]
end

def test_regex(pattern, text)
  regex = Regexp.new(pattern)
  if (match = regex.match(text))
    highlighted_text = text.sub(regex, "<span class='bg-yellow-400 text-black px-1 font-bold'>#{match}</span>")
    status_message = "<span class='text-green-500'>マッチしました</span>"
    result = highlighted_text
  else
    status_message = "<span class='text-red-500'>マッチしませんでした。</span>"
    result = ''
  end
  document.getElementById('statusMessage')[:innerHTML] = status_message
  document.getElementById('result')[:innerHTML] = result
end

button = document.getElementById('runButton')
regex_input = document.getElementById('regex')
test_input = document.getElementById('testString')

button.addEventListener 'click' do
  test_regex(regex_input[:value].to_s, test_input[:value].to_s)
end
