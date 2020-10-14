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
require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
