class Food < ActiveRecord::Base
  attr_accessible :name, :calories, :category, :cholesterol, :commitment,
                  :fiber, :protein, :ratio_carb, :ratio_fat, :ratio_protein,
                  :saturated_fat, :serving, :sodium, :sugar,
                  :total_carbohydrate, :total_fat

  include PgSearch
  pg_search_scope :search, against: [:name, :category],
    using: {tsearch: {dictionary: "english"}},
    ignoring: :accents
  def self.text_search(query)
    if query.present?
      rank = <<-RANK
        ts_rank(to_tsvector(name), plainto_tsquery(#{sanitize(query)})) +
        ts_rank(to_tsvector(category), plainto_tsquery(#{sanitize(query)}))
      RANK
      where("to_tsvector('english', name) @@ plainto_tsquery(:q) or to_tsvector('english', category) @@ plainto_tsquery(:q)", q: query).order("#{rank} desc")
    else
      scoped
    end
  end
end
