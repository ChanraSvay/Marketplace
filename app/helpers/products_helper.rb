module ProductsHelper
    def format_condition(condition)
        words = condition.split("_").map do |word|
            word.capitalize
        end
        words.join(" ")
    end

    def product_thumbnail product
        # img = product.picture.present? product.picture.thumb.url : "placeholder."
        # image_tag img, class: "product-thumb"
    end

end
