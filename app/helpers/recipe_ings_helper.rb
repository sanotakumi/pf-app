module RecipeIngsHelper
  def calc_nutrition(quantity, nutrition)
    if quantity.present? && nutrition.present?
      (quantity * nutrition).to_s(:delimited)
    else
      "0"
    end
  end
end
