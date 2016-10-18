module PostsHelper
	def status_label(status)
		status_span_generator(status)
	end

	def status_span_generator(status)
		labels_hash = { "submitted": "primary", "approved": "success", "rejected": "danger" }
		content_tag(:span, status.titleize, class: "label label-#{labels_hash[status.to_sym]}")
	end
end
