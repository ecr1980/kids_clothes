class ChildrenController < ApplicationController
  def index
    if current_user
      @children = current_user.children
    end
    # Child.new is added at the index so that the paramater exists for the child creation form.
    @child = Child.new
  end

  def show
    # This if else statement is used to ensure that only children associated with the user can be viewed. Any children not associated,
    # or any id numbers not in use, will redirect the user back to root, giving no clue that there may be a child at that specific ID number.
    if current_user.children.include?(Child.find(params[:id]))
      @child = Child.find(params[:id])
    else
      redirect_to root_path
    end

    @needs = need_determination()
  
  end

  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    # Sort sizes adds the sizes to each individual type of clothing article, so the user doesn't have to assign sizes to different types
    # that would naturally share a size, but users can still search for specific types by size.    
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

  def need_determination()
    need_list = []
    if @child.short_sleeve_shirt_need && @child.short_sleeve_shirt_need > 0
      need_list << ["Short Sleeve Shirts:", @child.short_sleeve_shirt_need]
    end
    if @child.long_sleeve_shirt_need && @child.long_sleeve_shirt_need > 0
      need_list << ["Long Sleeve Shirts:", @child.long_sleeve_shirt_need]
    end
    if @child.shorts_need && @child.shorts_need > 0
      need_list << ["Shorts:", @child.shorts_need]
    end
    if @child.jean_pants_need && @child.jean_pants_need > 0
      need_list << ["Jean Pants:", @child.jean_pants_need]
    end
    if @child.non_jean_pants_need && @child.non_jean_pants_need > 0
      need_list << ["Non-jean Pants:", @child.non_jean_pants_need]
    end
    if @child.short_skirt_need && @child.short_skirt_need > 0
      need_list << ["Short Skirts:", @child.short_skirt_need]
    end
    if @child.long_skirt_need && @child.long_skirt_need > 0
      need_list << ["Long Skirts:", @child.long_skirt_need]
    end
    if @child.short_dress_need && @child.short_dress_need > 0
      need_list << ["Short Dresses:", @child.short_dress_need]
    end
    if @child.long_dress_need && @child.long_dress_need > 0
      need_list << ["Long Dresses:", @child.long_dress_need]
    end
    if @child.warm_pj_shirt_need && @child.warm_pj_shirt_need > 0
      need_list << ["Warm PJ Shirts:", @child.warm_pj_shirt_need]
    end
    if @child.warm_pj_pants_need && @child.warm_pj_pants_need > 0
      need_list << ["Warm PJ Pants:", @child.warm_pj_pants_need]
    end
    if @child.warm_pj_onesie_need && @child.warm_pj_onesie_need > 0
      need_list << ["Warm PJ Onesies:", @child.warm_pj_onesie_need]
    end
    if @child.cool_pj_shirt_need && @child.cool_pj_shirt_need > 0
      need_list << ["Cool PJ Shirts:", @child.cool_pj_shirt_need]
    end
    if @child.cool_pj_pants_need && @child.cool_pj_pants_need > 0
      need_list << ["Cool PJ Pants:", @child.cool_pj_pants_need]
    end
    if @child.cool_pj_onesie_need && @child.cool_pj_onesie_need > 0
      need_list << ["Cool PJ Onesies:", @child.cool_pj_onesie_need]
    end
    if @child.nightgown_need && @child.nightgown_need > 0
      need_list << ["Nightgowns:", @child.nightgown_need]
    end
    if @child.underwear_need && @child.underwear_need > 0
      need_list << ["Underwear:", @child.underwear_need]
    end
    if @child.socks_need && @child.socks_need > 0
      need_list << ["Socks:", @child.socks_need]
    end
    if @child.winter_coat_need && @child.winter_coat_need > 0
      need_list << ["Winter Coats:", @child.winter_coat_need]
    end
    if @child.snow_suit_need && @child.snow_suit_need > 0
      need_list << ["Snow Suits:", @child.snow_suit_need]
    end
    if @child.fall_coat_need && @child.fall_coat_need > 0
      need_list << ["Fall Coats:", @child.fall_coat_need]
    end
    if @child.rain_coat_need && @child.rain_coat_need > 0
      need_list << ["Rain Coats:", @child.rain_coat_need]
    end
    if @child.suit_jacket_need && @child.suit_jacket_need > 0
      need_list << ["Suit Jackets:", @child.suit_jacket_need]
    end
    if @child.winter_hat_need && @child.winter_hat_need > 0
      need_list << ["Winter Hats:", @child.winter_hat_need]
    end
    if @child.non_winter_hat_need && @child.non_winter_hat_need > 0
      need_list << ["Regular Hats:", @child.non_winter_hat_need]
    end
    if @child.gloves_need && @child.gloves_need > 0
      need_list << ["Gloves:", @child.gloves_need]
    end
    if @child.mittens_need && @child.mittens_need > 0
      need_list << ["Mittens:", @child.mittens_need]
    end
    if @child.dress_shoes_need && @child.dress_shoes_need > 0
      need_list << ["Dress Shoes:", @child.dress_shoes_need]
    end
    if @child.tennis_shoes_need && @child.tennis_shoes_need > 0
      need_list << ["Tennis Shoes:", @child.tennis_shoes_need]
    end
    if @child.boot_need && @child.boot_need > 0
      need_list << ["Boots:", @child.boot_need]
    end
    if @child.snow_boot_need && @child.snow_boot_need > 0
      need_list << ["Snow Boots:", @child.snow_boot_need]
    end
    if @child.rain_boot_need && @child.rain_boot_need > 0
      need_list << ["Rain Boots:", @child.rain_boot_need]
    end
    return need_list
  end
end
