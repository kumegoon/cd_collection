module CdsHelper
  def show_cd_image(cd)
    if cd.image.attached?
      image_tag cd.image.variant(resize: "300x300"), class: "img-thumbnail"
    else
      image_tag "no_image.png", class: "img-thumbnail"
    end
  end
  def show_cd_small_image(cd)
    if cd&.image&.attached?
      image_tag cd.image.variant(resize: "50x50"), class: "img-thumbnail"
    else
      image_tag "no_image.png", class: "img-thumbnail", width: 50
    end
  end  
end
