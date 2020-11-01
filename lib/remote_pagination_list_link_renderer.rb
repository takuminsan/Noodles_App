class RemotePaginationListLinkRenderer < WillPaginate::ViewHelpers::LinkRenderer
  private

  # :remote => true
  def link(text, target, attributes = {})
    if target.is_a? Fixnum
      attributes[:rel] = rel_value(target)
      target = url(target)
    end
    attributes[:href] = target
    attributes[“data-remote”] = true
    attributes[“data-method”] = :get
    tag(:a, text, attributes)
  end
end
