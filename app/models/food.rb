class Food < ActiveRecord::Base
  include PgSearch

  default_scope { order(name: :asc) }

  pg_search_scope :search, against: [:name, :category],
                           using: { tsearch: { dictionary: "english" } },
                           ignoring: :accents

  def self.text_search(query)
    return all unless query.present?
    rank = <<-RANK
      ts_rank(to_tsvector(name), plainto_tsquery(#{sanitize(query)})) +
      ts_rank(to_tsvector(category), plainto_tsquery(#{sanitize(query)}))
    RANK
    where("to_tsvector('english', name) @@ plainto_tsquery(:q) or to_tsvector('english', category) @@ plainto_tsquery(:q)", q: query).order("#{rank} desc")
  end
end
