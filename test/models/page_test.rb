# == Schema Information
#
# Table name: pages
#
#  id          :integer          not null, primary key
#  page_number :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  comic_id    :integer
#
# Indexes
#
#  index_pages_on_comic_id  (comic_id)
#

require 'test_helper'

class PageTest < ActiveSupport::TestCase
  test "fixtures are valid" do
    pages.each do |q|
      assert q.valid?, q.errors.full_messages.inspect
    end
  end
end
