# == Schema Information
#
# Table name: notes
#
#  id       :bigint           not null, primary key
#  user_id  :integer          not null
#  track_id :integer          not null
#  note     :text             not null
#
class Note < ApplicationRecord

    validates :user_id, :track_id, :note, presence: true

    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :track,
        foreign_key: :track_id,
        class_name: :Track
end
