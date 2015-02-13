class Url < ActiveRecord::Base
  validates :long_form, :presence => true

  def generate_unique_id
    id = SecureRandom.urlsafe_base64(4)
    Url.is_duplicate?(id) ? generate_unique_id : id
  end

  def self.is_duplicate?(id)
    self.all.any? { |url| url.short_form == id}
  end

  def self.get_last_urls(num_of_urls)
    self.order('updated_at DESC').limit(num_of_urls)
  end

  def self.get_top_urls(num_of_urls)
    self.order('access_count DESC').limit(num_of_urls)
  end

  def self.get_long_url(short_url_id)
    self.find_by short_url_id
  end

  def visit_incrementor(count_column)
    count_column += 1
  end
end
