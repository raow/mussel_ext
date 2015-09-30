class Response::Message < ActiveRecord::Base

  class << self
    def find_sti_class(type_name) 
      ("Response::"+type_name).constantize()
    end

    def sti_name
      name.demodulize
    end
  end
end

