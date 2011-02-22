class Comment < ActiveRecord::Base
	validates_presence_of :post, :name, :content
	belongs_to :post
end
