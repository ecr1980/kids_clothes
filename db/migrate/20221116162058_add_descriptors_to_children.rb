class AddDescriptorsToChildren < ActiveRecord::Migration[7.0]
  def change
    add_column :children, :short_sleeve_shirt_need, :integer   
    add_column :children, :long_sleeve_shirt_need, :integer   
    add_column :children, :shorts_need, :integer    
    add_column :children, :jean_pants_need, :integer   
    add_column :children, :non_jean_pants_need, :integer  
    add_column :children, :short_skirt_need, :integer
    add_column :children, :long_skirt_need, :integer
    add_column :children, :short_dress_need, :integer
    add_column :children, :long_dress_need, :integer
    add_column :children, :warm_pj_shirt_need, :integer
    add_column :children, :warm_pj_pants_need, :integer
    add_column :children, :warm_pj_onesie_need, :integer
    add_column :children, :cool_pj_shirt_need, :integer
    add_column :children, :cool_pj_pants_need, :integer
    add_column :children, :cool_pj_onesie_need, :integer
    add_column :children, :nightgown_need, :integer
    add_column :children, :underwear_need, :integer
    add_column :children, :socks_need, :integer
    add_column :children, :winter_coat_need, :integer
    add_column :children, :snow_suit_need, :integer
    add_column :children, :fall_coat_need, :integer
    add_column :children, :rain_coat_need, :integer
    add_column :children, :winter_hat_need, :integer
    add_column :children, :non_winter_hat_need, :integer
    add_column :children, :gloves_need, :integer
    add_column :children, :mittens_need, :integer
    add_column :children, :dress_shoes_need, :integer
    add_column :children, :tennis_shoes_need, :integer
    add_column :children, :boot_need, :integer
    add_column :children, :snow_boot_need, :integer
    add_column :children, :rain_boot_need, :integer
    add_column :children, :suit_jacket_need, :integer
    

    


    add_column :children, :short_sleeve_shirt_size, :string
    add_column :children, :long_sleeve_shirt_size, :string
    add_column :children, :shorts_size, :string
    add_column :children, :jean_pants_size, :string
    add_column :children, :non_jean_pants_size, :string
    add_column :children, :short_skirt_size, :string
    add_column :children, :long_skirt_size, :string
    add_column :children, :short_dress_size, :string
    add_column :children, :long_dress_size, :string
    add_column :children, :warm_pj_shirt_size, :string
    add_column :children, :warm_pj_pants_size, :string
    add_column :children, :warm_pj_onesie_size, :string
    add_column :children, :cool_pj_shirt_size, :string
    add_column :children, :cool_pj_pants_size, :string
    add_column :children, :cool_pj_onesie_size, :string
    add_column :children, :nightgown_size, :string
    add_column :children, :underwear_size, :string
    add_column :children, :socks_size, :string
    add_column :children, :winter_coat_size, :string
    add_column :children, :snow_suit_size, :string
    add_column :children, :fall_coat_size, :string
    add_column :children, :rain_coat_size, :string
    add_column :children, :winter_hat_size, :string
    add_column :children, :non_winter_hat_size, :string
    add_column :children, :gloves_size, :string
    add_column :children, :mittens_size, :string
    add_column :children, :dress_shoes_size, :string
    add_column :children, :tennis_shoes_size, :string
    add_column :children, :boot_size, :string
    add_column :children, :snow_boot_size, :string
    add_column :children, :rain_boot_size, :string
    add_column :children, :suit_jacket_size, :string
  end
end
