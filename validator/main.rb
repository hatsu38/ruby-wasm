# frozen_string_literal: true

require 'js'

def document
  @document ||= JS.global[:document]
end

def validate_phone(text)
  cond = text.match?(/\A0\d{10}\Z/)
  err = document.getElementById('phone_error')
  err[:innerText] = if cond
                      ''
                    else
                      '電話番号が不正です'
                    end
end

def validate_email(text)
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  cond = text.match?(email_regex)
  err = document.getElementById('email_error')
  err[:innerText] = if cond
                      ''
                    else
                      'Emailが不正です'
                    end
end

phone_input = document.getElementById('phone')
email_input = document.getElementById('email')

phone_input.addEventListener 'change' do |e|
  validate_phone(e[:target][:value].to_s)
end

email_input.addEventListener 'change' do |e|
  validate_email(e[:target][:value].to_s)
end

button = document.getElementById('validateButton')

button.addEventListener 'click' do |_e|
  validate_phone(phone_input[:value].to_s)
  validate_email(email_input[:value].to_s)
end
