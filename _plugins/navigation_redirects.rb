# al-folio uses the Liquid page URL for both the navbar and search. Keep the
# local permalink for bookmarks while sending navigation straight to the target.
Jekyll::Hooks.register :pages, :post_init do |page|
  next unless page.data["nav"] && page.data["redirect"].is_a?(String)

  def page.to_liquid(*args)
    super.merge("url" => data.fetch("redirect"))
  end
end
