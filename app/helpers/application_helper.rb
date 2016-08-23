module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def description(page_description)
    content_for(:description) { page_description }
  end

  def wrap_in_span(text)
    text = EmojiParser.detokenize(text.gsub(EmojiParser.emoticon_regex) {|match| ":#{EmojiParser.emoticons[match]}:" })

    wrapped_text = []

    text.each_char do |c|
      wrapped_text << "<span>#{c}</span>"
    end

    return wrapped_text.join
  end

#  def wrap_in_span(text)
#    text = EmojiParser.detokenize(text.gsub(EmojiParser.emoticon_regex) {|match| ":#{EmojiParser.emoticons[match]}:" })
#
#    wrapped_text = []
#    wrapped_word = []
#
#    text.each_char do |c|
#      if c.match(/\s+/)
#        wrapped_text << "<span class='word'>#{wrapped_word.join}</span> "
#        wrapped_word = []
#      else
#        wrapped_word << "<span class='letter'>#{c}</span>"
#      end
#    end
#
#    return wrapped_text.join
#  end
end
