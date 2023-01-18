class ApplicationController < ActionController::Base
    def index
        render html: "hello db start"
    end
end
