class ChildrenController < ApplicationController
  def index
    if current_user
      @children = current_user.children
    end
    @child = Child.new
  end

  def new

    @child = Child.new

  end

  def create
    @child = Child.new(child_params)    
    sort_sizes(params[:child][:base_size].to_i, params[:child][:shirt_size].to_i, params[:child][:pants_size].to_i, params[:child][:hats_and_gloves_size].to_i, params[:child][:shoe_size].to_i)
    if @child.save      
      @child.users << current_user
      redirect_to root_path
    else
      puts "Child did not save."
      redirect_to root_path
    end
  end

  private

  def child_params
    params.require(:child).permit(:nickname)
  end

  def sort_sizes(base, shirt, pants, hats_and_gloves, shoes)
    if shirt != 0
      add_shirts(shirt)
    else
      add_shirts(base)
    end

    if pants != 0
      add_pants(pants)
    else
      add_pants(base)
    end

    if hats_and_gloves != 0
      add_hats_and_gloves(hats_and_gloves)
    else
      add_hats_and_gloves(base)
    end

    if shoes != 0
      add_shoes(shoes)
    end
  end

  def add_shirts(size)
    @child.short_sleeve_shirt_size = size
    @child.long_sleeve_shirt_size = size
    @child.short_dress_size = size
    @child.long_dress_size = size
    @child.warm_pj_shirt_size = size
    @child.warm_pj_onesie_size = size
    @child.cool_pj_shirt_size = size
    @child.cool_pj_onesie_size = size
    @child.nightgown_size = size
    @child.winter_coat_size = size
    @child.fall_coat_size = size
    @child.rain_coat_size = size
    @child.suit_jacket_size = size
    @child.snow_suit_size = size
  end

  def add_pants(size)
    @child.shorts_size = size
    @child.jean_pants_size = size
    @child.non_jean_pants_size = size
    @child.short_skirt_size = size
    @child.long_skirt_size = size
    @child.warm_pj_pants_size = size
    @child.cool_pj_pants_size = size
    @child.underwear_size = size
    @child.socks_size = size
  end

  def add_hats_and_gloves(size)
    @child.winter_hat_size = size
    @child.non_winter_hat_size = size
    @child.gloves_size = size
    @child.mittens_size = size
  end
  
  def add_shoes(size)
    @child.dress_shoes_size = size
    @child.tennis_shoes_size = size
    @child.boot_size = size
    @child.rain_boot_size = size
    @child.snow_boot_size = size
  end
end
