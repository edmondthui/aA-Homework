# == Schema Information
#
# Table name: albums
#
#  id      :bigint           not null, primary key
#  title   :string           not null
#  year    :integer          not null
#  band_id :integer          not null
#  studio  :boolean          default(TRUE)
#
class Album < ApplicationRecord

    validates :title, :year, :band_id, presence: true

    belongs_to :band,
        foreign_key: :band_id,
        class_name: :Band
        
    has_many :tracks,   
        foreign_key: :album_id,
        class_name: :Track,
        dependent: :destroy
end
