# == Schema Information
#
# Table name: comics
#
#  id           :integer          not null, primary key
#  title        :string
#  issue_number :integer
#  description  :text
#  comic_type   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class ComicTest < ActiveSupport::TestCase
  test "fixures are valid" do 
    comics.each do |c|
      assert c.valid?, c.errors.full_messages.inspect
    end
  end

  test "Has cover image" do
    c = comics(:one)
    assert c.valid?, c.errors.full_messages.inspect
  end

end
