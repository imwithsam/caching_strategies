module ApplicationHelper
  def cache_key_for(model)
    prefix        = model.to_s.downcase.pluralize
    count         = model.count
    # 'try' keeps this from blowing up if there are no records
    # to_s(:number) returns a string of just the numbers
    max_updated_at = model.maximum(:updated_at).try(:utc).try(:to_s, :number)

    "#{prefix}/all-#{count}-#{max_updated_at}"
  end
end
