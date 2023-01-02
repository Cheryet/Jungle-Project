require 'rails_helper'

RSpec.describe Products, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    validates :name, presence: true
    validates :price, presence: true
    validates :quantity, presence: true
    validates :category, presence: true
  end
end
