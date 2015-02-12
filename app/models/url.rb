class Url < ActiveRecord::Base
  validates :long_form, :presence => true

  def generate_unique_id
    @id = SecureRandom.urlsafe_base64(6)
    is_duplicate?(id) ? generate_unique_id : id
  end

  def is_duplicate?(id)
    Url.all.any? { |url| url.short_form == id}
  end

  def short_url(base_url, id)
    "base_url/id"
  end
end
