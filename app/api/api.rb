module API
  class PhoneNumbers < Grape::API
    prefix :api
    format :json

    resource :phone_numbers do
      desc 'Create a phone number'
      post do
        number = PhoneNumber.generate_number(params)
        if number[:error].present?
          {error: number[:error] }
        else
          present number, with: Entities::PhoneApi
        end
      end
    end

  end
end
