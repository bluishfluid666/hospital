class SearchPatientsController < ApplicationController
  def search
    if params["patient_name"] == '' && params["patient_phone_number"] == '' && params["patient_address"] == ''
      if params["In patient"]
        @result1 = Array.new
      end
      if params["Out patient"]
        @result2 = Array.new
      end
      render json: [@result1, @result2]
    else
      name = ''
      phone_no = ''
      addr = ''
      if params["patient_name"] != ''
        name = "(lower(first_name) like '%#{params["patient_name"].downcase}%' or lower(last_name) like '%#{params["patient_name"].downcase}%')"
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
        select prefix, novem_digit, first_name || ' ' || last_name as full_name, phone_number, start_datetime, end_datetime, result, date_of_admission, sickroom, fee, nurse_id, doctor_id 
        from in_patients left join treatments 
        on in_patients.prefix = treatments.inpatient_prefix and in_patients.novem_digit = treatments.inpatient_novem_digit 
        where #{name}#{phone_no}#{addr};
        "     
        @result1 = Array.new
        inpatients = ActiveRecord::Base.connection.execute(raw).values
        inpatients.each.with_index do |p,i|
          @result1[i] = Hash.new
          @result1[i]["prefix"] = p[0]
          @result1[i]["n9_digit"] = p[1]
          @result1[i]["full_name"] = p[2]
          @result1[i]["phone"] = p[3]
          @result1[i]["start_datetime"] = p[4]
          @result1[i]["end_datetime"] = p[5]
          @result1[i]["result"] = p[6]
          @result1[i]["doa"] = p[7]
          @result1[i]["sickroom"] = p[8]
          @result1[i]["nurse_id"] = p[9]
          @result1[i]["doctor_id"] = p[10]
        end
      end
      if params["Out patient"]
        raw = "
        select prefix, novem_digit, first_name || ' ' || last_name as full_name, phone_number, date_n_time, doctor_id, fee
        from out_patients left join examinations on out_patients.novem_digit = examinations.out_patient_novem_digit
        where #{name}#{phone_no}#{addr};
        "
        @result2 = Array.new
        outpatients = ActiveRecord::Base.connection.execute(raw).values
        outpatients.each.with_index do |p,i|
          @result2[i] = Hash.new
          @result2[i]["prefix"] = p[0]
          @result2[i]["n9_digit"] = p[1]
          @result2[i]["full_name"] = p[2]
          @result2[i]["phone"] = p[3]
          @result2[i]["date_n_time"] = p[4]
          @result2[i]["doctor_id"] = p[5]
          @result2[i]["fee"] = p[6]
        end
      end
      if @result1 && @result2
        render json: @result1+@result2
      elsif @result1
        render json: @result1
      elsif @result2
        render json: @result2
      end
    end
  end
end
