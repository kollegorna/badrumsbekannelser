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
end
