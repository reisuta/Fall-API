module Api
  class FutureAimsController < ApplicationController
    def index
      @aims = Aim.all
      @aims_month = []
      @aims.each do |f|
        if f.started_at.strftime("%y%m") == "2208"
          @aims_month.push(f)
        end
      end
    end
  end
end
