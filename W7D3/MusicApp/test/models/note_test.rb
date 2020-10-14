# == Schema Information
#
# Table name: notes
#
#  id       :bigint           not null, primary key
#  user_id  :integer          not null
#  track_id :integer          not null
#  note     :text             not null
#
require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
