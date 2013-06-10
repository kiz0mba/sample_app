module UsersHelper
  #Returns the Gravatar ( http://gravatar.com/ ) for the given user.
  def gravatar_for(user)
    gravatar_id  = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatars/#{gravatar_id}.png"
    gravatar_alt = "rails.png"
    image_tag(gravatar_url, alt: gravatar_alt, class: "gravatar")
    #image_tag("rails.png", alt:"Rails")
  end
end
