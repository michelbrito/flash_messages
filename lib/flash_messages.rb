module FlashMessages
	def flash_messages
    types = [:info, :success, :warning, :error]
    html = ""
    types.each do |type|
      if flash[type]
        html += "<div class=\"fm-#{type}\">#{flash[type]}</div>"
      end
    end
    return html
  end
end
