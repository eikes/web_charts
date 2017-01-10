class DataController < ApplicationController
  def create_datum
    @datum = Datum.new(datum_params)
    if @datum.save
      redirect_to root_path, notice: 'datum successfully created!'
    else
      render 'new'
    end
  end

  def datum_params
    params.require(:datum_params).permit(
      :value, 
      :color, 
      :label 
    )
  end
end
