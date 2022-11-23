class GetDoctorPatientsController < ApplicationController
  def index
    doctor_id = params["doctor"]
    inpatients = "
select * 
from in_patients 
where novem_digit in (
select distinct inpatient_novem_digit from treatments where doctor_id = #{doctor_id}
);"
    outpatients = "
select * 
from out_patients 
where novem_digit in (
select distinct out_patient_novem_digit from examinations where doctor_id = #{doctor_id}
);"
    @inpatients = Array.new
    @outpatients = Array.new

    inpatients_arr = ActiveRecord::Base.connection.execute(inpatients).values
    inpatients_arr.each.with_index do |e,i|
      @inpatients[i] = Hash.new
      @inpatients[i]["n9_digit"] = e[1]
      @inpatients[i]["fname"] = e[2]
      @inpatients[i]["lname"] = e[3]
      @inpatients[i]["gender"] = e[4]
      @inpatients[i]["dob"] = e[5]
      @inpatients[i]["phone"] = e[6]
      @inpatients[i]["address"] = e[7]
      @inpatients[i]["doa"] = e[8]
      @inpatients[i]["sickroom"] = e[9]
      @inpatients[i]["fee"] = e[10]
      @inpatients[i]["nurse_id"] = e[11]
    end
    @inpatients = @inpatients.to_json

    outpatients_arr = ActiveRecord::Base.connection.execute(outpatients).values
    outpatients_arr.each.with_index do |e,i|
      @outpatients[i] = Hash.new
      @outpatients[i]["prefix"] = e[0]
      @outpatients[i]["n9_digit"] = e[1]
      @outpatients[i]["fname"] = e[2]
      @outpatients[i]["lname"] = e[3]
      @outpatients[i]["gender"] = e[4]
      @outpatients[i]["dob"] = e[5]
      @outpatients[i]["phone"] = e[6]
      @outpatients[i]["address"] = e[7]
    end
    @outpatients = @outpatients.to_json
  end
end
