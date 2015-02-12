class Url < ActiveRecord::Base
  validates :long_form, :presence => true

  def generate_unique_id
    id = SecureRandom.urlsafe_base64(6)
    is_duplicate?(id) ? generate_unique_id : id
  end

  def is_duplicate?(id)
    Url.all.any? { |url| url.short_form == id}
  end

  def get_id_from_short_url
    request.params[:path]
  end

  def get_original_url
    url = Url.find_by short_form: request.params[:path]
    url.long_form
  end
end
