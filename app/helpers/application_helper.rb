module ApplicationHelper
  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      language="c" if language=="c++"
      language ||= :plaintext
      puts "======================================="
      puts language
      begin
        CodeRay.scan(code, language).div
      rescue Exception => e
        language="markdown"
        retry
      end
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(:filter_html => true,
                                  :hard_wrap => true)
    render_options = {
      # will remove from the output HTML tags inputted by user
      filter_html:     true,
      # will insert <br /> tags in paragraphs where are newlines
      # (ignored by default)
      hard_wrap: true,
      # hash for extra link options, for example 'nofollow'
      link_attributes: { rel: 'nofollow' }
      # more
      # will remove <img> tags from output
      # no_images: true
      # will remove <a> tags from output
      # no_links: true
      # will remove <style> tags from output
      # no_styles: true
      # generate links for only safe protocols
      # safe_links_only: true
      # and more ... (prettify, with_toc_data, xhtml)
    }
    renderer = Redcarpet::Render::HTML.new(render_options)

    extensions = {
      #will parse links without need of enclosing them
      autolink:     true,
      # blocks delimited with 3 ` or ~ will be considered as code block.
      # No need to indent.  You can provide language name too.
      # ```ruby
      # block of code
      # ```
      fenced_code_blocks: true,
      # will ignore standard require for empty lines surrounding HTML blocks
      lax_spacing:  true,
      # will not generate emphasis inside of words, for example no_emph_no
      no_intra_emphasis:  true,
      # will parse strikethrough from ~~, for example: ~~bad~~
      strikethrough:      true,
      # will parse superscript after ^, you can wrap superscript in ()
      superscript:  true
      # will require a space after # in defining headers
      # space_after_headers: true
    }
    Redcarpet::Markdown.new(coderayified, extensions).render(text).html_safe
  end

  def notice_message
    flash_messages = []

    flash.each do |type, message|
      type = :success if type.to_sym == :notice
      type = :danger  if type.to_sym == :alert
      text = content_tag(:div, link_to(raw('<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>'), '#', :class => 'close', 'data-dismiss' => 'alert') + message, class: "alert alert-#{type}")
      flash_messages << text if message
    end

    flash_messages.join("\n").html_safe
  end
  def add_topic(path)
    topic=File.open(path,"r")
    topic.each_line do |line|
      title= line.split(":")[1] if line[0...4] == "title"
      _tag= line.split(":")[1] if line[0...2] == "tag"
      date= line.split(":")[1] if line[0...3] == "date"
      categories=line.split(":")[1] if line[0...10] == "categories"
      body << line + "\n"
    end
    Topic.create(
      user_id: User.find_by(name: 'dccmmtop'),
      title: title,
      tag: _tag,
      category_id: Category.find_by(name:categories),
      body: body
    )
  end

  def calcu_date(date)
    minutes = (Time.now - date) / 60
    if minutes < 5
      return  '刚刚'
    elsif minutes < 60
      return "#{minutes.to_i}分钟前"
    elsif (minutes < 1440)
      return "#{(minutes/60).to_i}小时前"
    elsif minutes < 2880
      return "昨天"
    elsif minutes < 1440*30
      return "#{(minutes / 1440).to_i}天前"
    else
      return "#{(minutes / (1440 * 30)).to_i}月前"
    end
  end
end
