class Status < ActiveRecord::Base
    has_many :konkursi, :foreign_key => "status_id"
end
