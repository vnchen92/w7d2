# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  band_id    :integer          not null
#  year       :integer          not null
#  title      :string           not null
#  live       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
    validates :band_id, :year, :title, :live, presence: true

    belongs_to :band,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Band
end
