module EmojiHelper
  def emojify(content)
    EmojiParser.parse(content) do |emoji|
      %Q(<img src="#{image_path("emoji/#{emoji.image_filename}")}" alt=":#{emoji.name}:">)
    end.html_safe
  end
end
