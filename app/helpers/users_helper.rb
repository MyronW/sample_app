module UsersHelper
  def gravatar_for(user,opts={})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    gravatar_url += "?s=#{opts[:size]}" if opts[:size]
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
