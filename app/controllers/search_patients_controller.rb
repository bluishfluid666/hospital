class SearchPatientsController < ApplicationController
  def search
    if params["patient_name"] == '' && params["patient_phone_number"] == '' && params["patient_address"] == ''
      if params["In patient"]
        @result1 = Array.new
      end
      if params["Out patient"]
        @result2 = Array.new
      end
    else
      name = ''
      phone_no = ''
      addr = ''
      if params["patient_name"] != ''
        name = "lower(first_name) like '%#{params["patient_name"]}%' or lower(last_name) like '%#{params["patient_name"]}%'"
      end
      if params["patient_phone_number"] != ''
        if name != ''
          phone_no = ' and ' 
        end
        phone_no += "phone_number = '#{params["patient_phone_number"]}'"
      end
      if params["patient_address"] != ''
        if name != '' || phone_no != ''
          addr = ' and '
        end
        addr += "address = '#{params["patient_address"]}'"
      end
      if params["In patient"]
        raw = "
        select first_name || ' ' || last_name as full_name, phone_number, start_datetime, end_datetime, result 
        from in_patients left join treatments 
        on in_patients.prefix = treatments.inpatient_prefix and in_patients.novem_digit = treatments.inpatient_novem_digit 
        where #{name}#{phone_no}#{addr};
        "     
        @result1 = ActiveRecord::Base.connection.execute(raw).values
        render json: @result1
      end
      if params["Out patient"]
        raw = "
        select first_name || ' ' || last_name as full_name, phone_number
        from out_patients 
        where #{name}#{phone_no}#{addr};
        "
        @result2 = ActiveRecord::Base.connection.execute(raw).values
        render json: @result2
      end
    end
  end
end