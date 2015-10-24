class Article < ActiveRecord::Base
  has_many :taggings ,:dependent => :destroy
  has_many :tags ,:through => :taggings
  attr_accessor :tag_names
  after_save :assing_tags

    def assing_tags
      if @tag_names
        puts @tag_names
        self.tags= @tag_names.split(/\s+/).map do |name|
        Tag.find_or_create_by(name:name)
      end
    end
   end

end
