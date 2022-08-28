module RSpecHelper
  def log_in(user)
    visit new_user_session_path
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_on "commit"
  end
end
