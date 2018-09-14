class PhoneNumber < ApplicationRecord

  NUMBER_START = 1111111111
  NUMBER_END =  9999999999

  validates :number, length: { is: 10 }
  validates :number, presence: true
  validates :number, uniqueness: true


  def self.generate_number params
    if params[:number].present?
      phone_number = params[:number].gsub(/[^\d,\.]/, '')
      return {error: "the phone is out of range"}   unless  check_phone phone_number
      create_number_with_params phone_number
    else
      create_random_number
    end
  end

  private

  def self.create_number_with_params number
    phone_number = PhoneNumber.find_or_initialize_by(number: number)
    if phone_number.new_record? && phone_number.valid?
      phone_number.save
      return phone_number
    else
      return {error: 'has already been taken'}
    end
  end

  def self.create_random_number
    while true
      number = PhoneNumber.new(number: rand(NUMBER_START..NUMBER_END) )
      return number if number.valid?
    end
  end

  def self.check_phone number
    return (NUMBER_START..NUMBER_END).include?(number.to_i)
  end

end
