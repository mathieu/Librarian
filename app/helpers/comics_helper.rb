module ComicsHelper
  def display_authors(authors)

    if authors.nil?
      return ''
    end

    name =''
    authors.each do |author|
      name += author.name + ', '
    end

    name.strip.end_with?(',') ? name.strip[0..-2] : name.strip
  end
end
