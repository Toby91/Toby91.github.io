module Jekyll
  class CodeHighlightJSBlock < Liquid::Block

    def initialize(tag_name, langName, tokens)
      super
      @lang = langName
    end

    def render(context)
      _startTag = "<pre><code class=\"#{@lang}\">\n"
      _blockContent = super + "\n"
      _endTag = "</code></pre>\n"
      _startTag + _blockContent + _endTag
    end
  end
end

Liquid::Template.register_tag('code', Jekyll::CodeHighlightJSBlock)
