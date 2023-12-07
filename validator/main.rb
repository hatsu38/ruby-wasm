# frozen_string_literal: true

require 'js'

def document
  @document ||= JS.global[:document]
end

def validate_phone(text)
  cond = text.match?(/\A0\d{10}\Z/)
  err = document.getElementById('phone_error')
  err[:innerText] = cond ? '' : '電話番号が不正です'
end

def validate_email(text)
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  cond = text.match?(email_regex)
  err = document.getElementById('email_error')
  err[:innerText] = cond ? '' : 'Emailが不正です'
end

def validate_password(text)
  password_regex = /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}\z/
  cond = text.match?(password_regex)
  err = document.getElementById('password_error')
  err[:innerText] = cond ? '' : 'パスワードが不正です（最低8文字、大文字、小文字、数字を含む必要があります）'
end

phone_input = document.getElementById('phone')
email_input = document.getElementById('email')
password_input = document.getElementById('password')

[phone_input, email_input, password_input].each do |input|
  input.addEventListener 'input' do |e|
    method = "validate_#{input[:id]}"
    send(method, e[:target][:value].to_s)
  end
end

button = document.getElementById('validateButton')

button.addEventListener 'click' do
  validate_phone(phone_input[:value].to_s)
  validate_email(email_input[:value].to_s)
  validate_password(password_input[:value].to_s)
end
