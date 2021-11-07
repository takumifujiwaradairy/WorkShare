require 'rails_helper'
RSpec.describe User, type: :model do
  it '名前がなければ登録できない' do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'メールアドレスがなければ登録できない' do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it '重複したメールアドレスなら無効であること' do
    User.create(
      name: 'Joe',
      email: 'tester@example.com',
      password: 'aA1AAA'
    )
    user = User.new(
      name: 'Joe',
      email: 'tester@example.com',
      password: 'aA1AAA'
    )
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end

  it 'パスワードが5文字以下の場合は登録できないこと' do
    user = User.new(password: 'aA1AA', email: 'a@gamil.com', name: 'a')
    expect(user).to be_invalid
  end

  it 'パスワードが6文字以上の場合は登録できること' do
    user = User.new(password: 'aA1AAA', email: 'a@gamil.com', name: 'a')
    expect(user).to be_valid
  end

  it 'パスワードが20文字以下の場合は登録できること' do
    user = User.new(password: 'aA1AAAAAAAAAAAAAAAAA', email: 'a@gamil.com', name: 'a')
    expect(user).to be_valid
  end

  it 'パスワードが21文字以上の場合は登録できないこと' do
    user = User.new(password: 'aA1AAAAAAAAAAAAAAAAAA', email: 'a@gamil.com', name: 'a')
    expect(user).to be_invalid
  end

  it 'パスワードに指定されていない文字が入らないこと（ひらがな）' do
    user = User.new(password: 'あ' * 10, email: 'a@gamil.com', name: 'a')
    expect(user).to be_invalid
  end

  it 'パスワードに指定されていない文字が入らないこと（記号）' do
    user = User.new(password: '&' * 10, email: 'a@gamil.com', name: 'a')
    expect(user).to be_invalid
  end
end
