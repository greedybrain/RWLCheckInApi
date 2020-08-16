class CheckInSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :time_in, :time_out,  :num_of_visits, :remarks_post_visit
end
