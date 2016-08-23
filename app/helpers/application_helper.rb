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

    text.split(' ').each do |word|
      wrapped_text << content_tag(:span, class: 'word') do
        wrapped_word = []

        word.each_char do |char|
          wrapped_word << content_tag(:span, char, class: 'letter')
        end

        wrapped_word.join.html_safe
      end
    end

    wrapped_text.join(' ')
  end
end
