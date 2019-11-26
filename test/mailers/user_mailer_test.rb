require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "usage" do
    mail = UserMailer.usage
    assert_equal "Usage", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
