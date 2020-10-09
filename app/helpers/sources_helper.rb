module SourcesHelper
  def source_links(source)
    content = content_tag(:div) 
    if source.author.id == current_user
      content << link_to('Show', source)
      content << link_to('Edit', edit_source_path(source))
      content << link_to('Destroy', source, method: :delete, data: { confirm: 'Are you sure?' })
    end
    content
  end
end
