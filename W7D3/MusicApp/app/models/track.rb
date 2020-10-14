# == Schema Information
#
# Table name: tracks
#
#  id       :bigint           not null, primary key
#  title    :string           not null
#  album_id :integer          not null
#  ord      :string           not null
#  lyrics   :text
#  bonus    :boolean          default(TRUE)
#
class Track < ApplicationRecord

    validates :title, :ord, :album_id, presence: true

    belongs_to :album,
        foreign_key: :album_id,
        class_name: :Album

    has_one :band,
        through: :album,
        source: :band

    has_many :notes,
        foreign_key: :track_id,
        class_name: :Note
end
