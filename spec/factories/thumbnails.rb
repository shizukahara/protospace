include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :thumbnail do
    prototype
    image_url { fixture_file_upload("spec/fixtures/img/sample.png") }

    trait :main do
      status :main
    end

    trait :sub do
      status   :sub
    end
    factory :main_image, traits: [:main]
    factory :sub_image, traits: [:sub]
  end
end



#edit
#  @main_image = @prototype.thumbnails.main
#  @sub_images = @prototype.thumbnails.sub

 #def edit
  #  @main_content = @prototype.prototype_images.first
  #  @sub_contents = @prototype.prototype_images.sub
 # end

