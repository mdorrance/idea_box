class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :idea_images
  has_many :images, through: :idea_images, dependent: :destroy

  def image_list
    self.images.collect do |image|
      image.url
    end
  end
  def save_image(images)
    images.each do |image|
      if image.to_i != 0
       self.images << (Image.find(image.to_i))
     end
    end
  end
end
