module RedCloth::Formatters::Plain
  include RedCloth::Formatters::Base
  [:h1, :h2, :h3, :h4, :h5, :h6, :p, :pre, :div].each do |m|
    define_method(m) do |opts|
      "#{opts[:text]}\n\n"
    end
  end

  [:strong, :code, :em, :i, :b, :ins, :sup, :sub, :span, :cite].each do |m|
    define_method(m) do |opts|
      opts[:text]
    end
  end
  
  def trademark(opts)
    "(TM)"
  end

  def registered(opts)
    "(R)"
  end

  def copyright(opts)
    "(C)"
  end

  def ellipsis(opts)
    "..."
  end

  def ignored_line(opts)
    "#{opts[:text]}\n"
  end

  def html_block(opts)
    strip_html(opts[:text])
  end

  def inline_html(opts)
    strip_html(opts[:text])
  end

private

  def escape(text)
    strip_html(text)
  end

  def escape_pre(text)
    strip_html(text)
  end

  def after_transform(text)
    text.strip!
  end

  # Strip tags.
  def strip_html( text )
    text.gsub!( /<!\[CDATA\[/, '' )
    text.gsub!( /<(\/*)([A-Za-z]\w*)([^>]*?)(\s?\/?)>/ ) { |m| "" }
    text
  end
end
