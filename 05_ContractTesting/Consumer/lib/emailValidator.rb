class EmailValidator
  def isEmailValid?(email)
    return false if email.match(/.+\@.+\..+/).nil?
#    return false unless email.include?("@")
#    return false unless email.include?(".")
#    return false if email.empty?
#    return false if email.split(".",-1)[-1].empty?
#    return false if email.split("@",-1)[0].empty?
    return true
  end
end