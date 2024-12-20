class Detail < ApplicationRecord
  def index
    @details = Detail.all
  end
end
