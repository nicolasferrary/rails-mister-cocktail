class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, presence: true, uniqueness: true
  # before_destroy :check_for_doses


  private

  # def check_for_doses
  #   if doses.count > 0
  #     errors.add_to_base("cannot delete ingredient when used by a cocktail")
  #     return false
  #   end
  # end

end
