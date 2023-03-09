class GarmentsController < ApplicationController

  def new
    @garment = Garment.new
  end

  def create
    @garment = Garment.new(garment_params)
    if @garment.save
      if @garment.photo != nil
        #@garment.photo.attach(params[:photo])
      end
      redirect_to child_path(params[:garment][:child_id])
    end
  end

  def childs
    @child = params[:child_id]
    @catagory = params[:catagory]
    @garments = @child.garments.where(clothing_catagory: @catagory)
    respond_to do |format|
      format.turbo_stream
    end
  end

  def show
    @type_target = params[:typeTarget]
    @size_target = params[:sizeTarget]
    if params[:catagory] == "Tops"
      @options = $tops
    elsif params[:catagory] == "Bottoms"
      @options = $bottoms
    elsif params[:catagory] == "Dresses"
      @options = $dresses_and_skirts
    elsif params[:catagory] == "Socks"
      @options = $socks_and_underwear
    elsif params[:catagory] == "PJs"
      @options = $pjs
    elsif params[:catagory] == "Outerwear"
      @options = $outerwear
    elsif params[:catagory] == "Shoes"
      @options = $shoes
    else
      @options = [""]
    end

    if params[:catagory] == "Shoes"
      @size = $shoe_sizes
    else
      @size = $clothing_sizes
    end
    respond_to do |format|
      format.turbo_stream
    end
  end

  private
  
  def garment_params
    params.require(:garment).permit(:clothing_catagory, :clothing_catagory_item, :color, :season, :on_market, :price, :size, :child_id, :market_id, :photo)
  end
end
