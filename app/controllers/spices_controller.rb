class SpicesController < ApplicationController
# diplay/index
def index
  spice=Spice.all
  render json:spice
end

# create/post
def create
  spice=Spice.create(spice_params)
  render json:spice, status: :created
end
# update
def update
  spice=Spice.find_by( id: params[:id])
  if spice
    spice.update(spice_params)
    render json: spice, status: :accepted
  else
    render json:{error:"the spice is not found"}, status: :not_found
  end

end
  # destroy
def destroy
  spice=Spice.find_by(id: params[:id])
  if spice
    spice.destroy
    render json:spice
  else
    render json:{error:"spice not found"}, status: :not_found
  end

end
# strong params
private
def spice_params
  params.permit( :title, :image, :description, :notes, :rating)
end

end


