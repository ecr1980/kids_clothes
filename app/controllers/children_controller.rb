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
    @garment = Garment.new
    @needs = need_determination()
    @outgrown = outgrown_dermination()
  
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

  def update
    @child = Child.find(params[:id])
    # Sort sizes adds the sizes to each individual type of clothing article, so the user doesn't have to assign sizes to different types
    # that would naturally share a size, but users can still search for specific types by size.    
    sort_sizes(params[:child][:base_size].to_i, params[:child][:shirt_size].to_i, params[:child][:pants_size].to_i, params[:child][:hats_and_gloves_size].to_i, params[:child][:shoe_size].to_i)
    # Assign needs adds a needs value to each type of clothing, removed from the update method for readability.
    assign_needs()
    if @child.update(child_params)
      redirect_to child_path(@child.id)
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
    @child.sweater_size = size
    @child.sweatshirt_size = size
    @child.hoodie_size = size
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
    @child.dress_pants_size = size
    @child.sweatpants_size = size
    @child.leggings_size = size
    @child.short_skirt_size = size
    @child.long_skirt_size = size
    @child.warm_pj_pants_size = size
    @child.cool_pj_pants_size = size
    @child.boys_underwear_size = size
    @child.girls_underwear_size = size
    @child.low_cut_socks_size = size
    @child.high_cut_socks_size = size
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
    @child.boots_size = size
    @child.rain_boots_size = size
    @child.snow_boots_size = size
    @child.sandals_size = size
    @child.flip_flops_size = size
  end

  def assign_needs
    @child.short_sleeve_shirt_need = params[:child][:short_sleeve_shirt_need].to_i
    @child.long_sleeve_shirt_need = params[:child][:long_sleeve_shirt_need].to_i
    @child.sweater_need = params[:child][:sweater_need].to_i
    @child.sweatshirt_need = params[:child][:sweatshirt_need].to_i
    @child.hoodie_need = params[:child][:hoodie_need].to_i
    @child.short_dress_need = params[:child][:short_dress_need].to_i
    @child.long_dress_need = params[:child][:long_dress_need].to_i
    @child.warm_pj_shirt_need = params[:child][:warm_pj_shirt_need].to_i
    @child.warm_pj_onesie_need = params[:child][:warm_pj_onesie_need].to_i
    @child.cool_pj_shirt_need = params[:child][:cool_pj_shirt_need].to_i
    @child.cool_pj_onesie_need = params[:child][:cool_pj_onesie_need].to_i
    @child.nightgown_need = params[:child][:nightgown_need].to_i
    @child.winter_coat_need = params[:child][:winter_coat_need].to_i
    @child.fall_coat_need = params[:child][:fall_coat_need].to_i
    @child.rain_coat_need = params[:child][:rain_coat_need].to_i
    @child.suit_jacket_need = params[:child][:suit_jacket_need].to_i
    @child.snow_suit_need = params[:child][:snow_suit_need].to_i
    
    @child.shorts_need = params[:child][:shorts_need].to_i
    @child.jean_pants_need = params[:child][:jean_pants_need].to_i
    @child.dress_pants_need = params[:child][:dress_pants_need].to_i
    @child.sweatpants_need = params[:child][:sweatpants_need].to_i
    @child.leggings_need = params[:child][:leggings_pants_need].to_i
    @child.short_skirt_need = params[:child][:short_skirt_need].to_i
    @child.long_skirt_need = params[:child][:long_skirt_need].to_i
    @child.warm_pj_pants_need = params[:child][:warm_pj_pants_need].to_i
    @child.cool_pj_pants_need = params[:child][:cool_pj_pants_need].to_i
    @child.boys_underwear_need = params[:child][:boys_underwear_need].to_i
    @child.girls_underwear_need = params[:child][:girls_underwear_need].to_i
    @child.low_cut_socks_need = params[:child][:low_cut_socks_need].to_i
    @child.high_cut_socks_need = params[:child][:high_cut_socks_need].to_i

    @child.winter_hat_need = params[:child][:winter_hat_need].to_i
    @child.non_winter_hat_need = params[:child][:non_winter_hat_need].to_i
    @child.gloves_need = params[:child][:gloves_need].to_i
    @child.mittens_need = params[:child][:mittens_need].to_i

    @child.dress_shoes_need = params[:child][:dress_shoes_need].to_i
    @child.tennis_shoes_need = params[:child][:tennis_shoes_need].to_i
    @child.boots_need = params[:child][:boots_need].to_i
    @child.rain_boots_need = params[:child][:rain_boots_need].to_i
    @child.snow_boots_need = params[:child][:snow_boots_need].to_i
    @child.sandals_need = params[:child][:sandals_need].to_i
    @child.flip_flops_need = params[:child][:flip_flops_need].to_i
  end

  def need_determination()
    need_list = []
    if (@child.short_sleeve_shirt_need != nil) && (@child.short_sleeve_shirt_need > 0)
      need_list << ["Short Sleeve Shirts:", @child.short_sleeve_shirt_need]
    end
    if (@child.long_sleeve_shirt_need != nil) && (@child.long_sleeve_shirt_need > 0)
      need_list << ["Long Sleeve Shirts:", @child.long_sleeve_shirt_need]
    end
    if (@child.sweater_need != nil) && (@child.sweater_need > 0)
      need_list << ["Sweaters:", @child.sweater_need]
    end
    if (@child.sweatshirt_need != nil) && (@child.sweatshirt_need > 0)
      need_list << ["Sweatshirts:", @child.sweatshirt_need]
    end
    if (@child.hoodie_need != nil) && (@child.hoodie_need > 0)
      need_list << ["Hoodies:", @child.hoodie_need]
    end
    if (@child.shorts_need != nil) && (@child.shorts_need > 0)
      need_list << ["Shorts:", @child.shorts_need]
    end
    if (@child.jean_pants_need != nil) && (@child.jean_pants_need > 0)
      need_list << ["Jean Pants:", @child.jean_pants_need]
    end
    if (@child.dress_pants_need != nil) && (@child.dress_pants_need > 0)
      need_list << ["Dress Pants:", @child.dress_pants_need]
    end
    if (@child.sweatpants_need != nil) && (@child.sweatpants_need > 0)
      need_list << ["Sweat Pants:", @child.sweatpants_need]
    end
    if (@child.leggings_need != nil) && (@child.leggings_need > 0)
      need_list << ["Leggings:", @child.leggings_need]
    end
    if (@child.short_skirt_need != nil) && (@child.short_skirt_need > 0)
      need_list << ["Short Skirts:", @child.short_skirt_need]
    end
    if (@child.long_skirt_need != nil) && (@child.long_skirt_need > 0)
      need_list << ["Long Skirts:", @child.long_skirt_need]
    end
    if (@child.short_dress_need != nil) && (@child.short_dress_need > 0)
      need_list << ["Short Dresses:", @child.short_dress_need]
    end
    if (@child.long_dress_need != nil) && (@child.long_dress_need > 0)
      need_list << ["Long Dresses:", @child.long_dress_need]
    end
    if (@child.warm_pj_shirt_need != nil) && (@child.warm_pj_shirt_need > 0)
      need_list << ["Warm PJ Shirts:", @child.warm_pj_shirt_need]
    end
    if (@child.warm_pj_pants_need != nil) && (@child.warm_pj_pants_need > 0)
      need_list << ["Warm PJ Pants:", @child.warm_pj_pants_need]
    end
    if (@child.warm_pj_onesie_need != nil) && (@child.warm_pj_onesie_need > 0)
      need_list << ["Warm PJ Onesies:", @child.warm_pj_onesie_need]
    end
    if (@child.cool_pj_shirt_need != nil) && (@child.cool_pj_shirt_need > 0)
      need_list << ["Cool PJ Shirts:", @child.cool_pj_shirt_need]
    end
    if (@child.cool_pj_pants_need != nil) && (@child.cool_pj_pants_need > 0)
      need_list << ["Cool PJ Pants:", @child.cool_pj_pants_need]
    end
    if (@child.cool_pj_onesie_need != nil) && (@child.cool_pj_onesie_need > 0)
      need_list << ["Cool PJ Onesies:", @child.cool_pj_onesie_need]
    end
    if (@child.nightgown_need != nil) && (@child.nightgown_need > 0)
      need_list << ["Nightgowns:", @child.nightgown_need]
    end
    if (@child.boys_underwear_need != nil) && (@child.boys_underwear_need > 0)
      need_list << ["Boy's Underwear:", @child.boys_underwear_need]
    end
    if (@child.girls_underwear_need != nil) && (@child.girls_underwear_need > 0)
      need_list << ["Girls's Underwear:", @child.girls_underwear_need]
    end
    if (@child.low_cut_socks_need != nil) && (@child.low_cut_socks_need > 0)
      need_list << ["Low cut socks:", @child.low_cut_socks_need]
    end
    if (@child.high_cut_socks_need != nil) && (@child.high_cut_socks_need > 0)
      need_list << ["High cut socks:", @child.high_cut_socks_need]
    end
    if (@child.winter_coat_need != nil) && (@child.winter_coat_need > 0)
      need_list << ["Winter Coats:", @child.winter_coat_need]
    end
    if (@child.snow_suit_need != nil) && (@child.snow_suit_need > 0)
      need_list << ["Snow Suits:", @child.snow_suit_need]
    end
    if (@child.fall_coat_need != nil) && (@child.fall_coat_need > 0)
      need_list << ["Fall Coats:", @child.fall_coat_need]
    end
    if (@child.rain_coat_need != nil) && (@child.rain_coat_need > 0)
      need_list << ["Rain Coats:", @child.rain_coat_need]
    end
    if (@child.suit_jacket_need != nil) && (@child.suit_jacket_need > 0)
      need_list << ["Suit Jackets:", @child.suit_jacket_need]
    end
    if (@child.winter_hat_need != nil) && (@child.winter_hat_need > 0)
      need_list << ["Winter Hats:", @child.winter_hat_need]
    end
    if (@child.non_winter_hat_need != nil) && (@child.non_winter_hat_need > 0)
      need_list << ["Regular Hats:", @child.non_winter_hat_need]
    end
    if (@child.gloves_need != nil) && (@child.gloves_need > 0)
      need_list << ["Gloves:", @child.gloves_need]
    end
    if (@child.mittens_need != nil) && (@child.mittens_need > 0)
      need_list << ["Mittens:", @child.mittens_need]
    end
    if (@child.dress_shoes_need != nil) && (@child.dress_shoes_need > 0)
      need_list << ["Dress Shoes:", @child.dress_shoes_need]
    end
    if (@child.tennis_shoes_need != nil) && (@child.tennis_shoes_need > 0)
      need_list << ["Tennis Shoes:", @child.tennis_shoes_need]
    end
    if (@child.boots_need != nil) && (@child.boots_need > 0)
      need_list << ["Boots:", @child.boots_need]
    end
    if (@child.snow_boots_need != nil) && (@child.snow_boots_need > 0)
      need_list << ["Snow Boots:", @child.snow_boots_need]
    end
    if (@child.rain_boots_need != nil) && (@child.rain_boots_need > 0)
      need_list << ["Rain Boots:", @child.rain_boots_need]
    end
    if (@child.sandals_need != nil) && (@child.sandals_need > 0)
      need_list << ["Sandals:", @child.sandals_need]
    end
    if (@child.flip_flops_need != nil) && (@child.flip_flops_need > 0)
      need_list << ["Flip flops:", @child.flip_flops_need]
    end
    return need_list
  end

  def outgrown_dermination()
  end
end
