module ApplicationHelper

	def admin_types
		["AdminUser"]
	end

	def active?(path)
		"active" if current_page?(path)
	end

	def status_label(status)
		status_span_generator(status)
	end

	def status_span_generator(status)
		labels_hash = { 
			"submitted": "primary", 
			"approved": "success", 
			"rejected": "danger",
			"pending": "primary",
			"confirmed": "success"
	 	}
		content_tag(:span, status.titleize, class: "label label-#{labels_hash[status.to_sym]}")
	end

end
