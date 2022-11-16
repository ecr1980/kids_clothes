class ChangeSizesOnGarments < ActiveRecord::Migration[7.0]
  def change
    remove_column :garments, :size
    add_column :garments, :size, :integer

    remove_column :children, :short_sleeve_shirt_size
    remove_column :children, :long_sleeve_shirt_size
    remove_column :children, :shorts_size
    remove_column :children, :jean_pants_size
    remove_column :children, :non_jean_pants_size
    remove_column :children, :short_skirt_size
    remove_column :children, :long_skirt_size
    remove_column :children, :short_dress_size
    remove_column :children, :long_dress_size
    remove_column :children, :warm_pj_shirt_size
    remove_column :children, :warm_pj_pants_size
    remove_column :children, :warm_pj_onesie_size
    remove_column :children, :cool_pj_shirt_size
    remove_column :children, :cool_pj_pants_size
    remove_column :children, :cool_pj_onesie_size
    remove_column :children, :nightgown_size
    remove_column :children, :underwear_size
    remove_column :children, :socks_size
    remove_column :children, :winter_coat_size
    remove_column :children, :snow_suit_size
    remove_column :children, :fall_coat_size
    remove_column :children, :rain_coat_size
    remove_column :children, :winter_hat_size
    remove_column :children, :non_winter_hat_size
    remove_column :children, :gloves_size
    remove_column :children, :mittens_size
    remove_column :children, :dress_shoes_size
    remove_column :children, :tennis_shoes_size
    remove_column :children, :boot_size
    remove_column :children, :snow_boot_size
    remove_column :children, :rain_boot_size
    remove_column :children, :suit_jacket_size

    add_column :children, :short_sleeve_shirt_size, :integer
    add_column :children, :long_sleeve_shirt_size, :integer
    add_column :children, :shorts_size, :integer
    add_column :children, :jean_pants_size, :integer
    add_column :children, :non_jean_pants_size, :integer
    add_column :children, :short_skirt_size, :integer
    add_column :children, :long_skirt_size, :integer
    add_column :children, :short_dress_size, :integer
    add_column :children, :long_dress_size, :integer
    add_column :children, :warm_pj_shirt_size, :integer
    add_column :children, :warm_pj_pants_size, :integer
    add_column :children, :warm_pj_onesie_size, :integer
    add_column :children, :cool_pj_shirt_size, :integer
    add_column :children, :cool_pj_pants_size, :integer
    add_column :children, :cool_pj_onesie_size, :integer
    add_column :children, :nightgown_size, :integer
    add_column :children, :underwear_size, :integer
    add_column :children, :socks_size, :integer
    add_column :children, :winter_coat_size, :integer
    add_column :children, :snow_suit_size, :integer
    add_column :children, :fall_coat_size, :integer
    add_column :children, :rain_coat_size, :integer
    add_column :children, :winter_hat_size, :integer
    add_column :children, :non_winter_hat_size, :integer
    add_column :children, :gloves_size, :integer
    add_column :children, :mittens_size, :integer
    add_column :children, :dress_shoes_size, :integer
    add_column :children, :tennis_shoes_size, :integer
    add_column :children, :boot_size, :integer
    add_column :children, :snow_boot_size, :integer
    add_column :children, :rain_boot_size, :integer
    add_column :children, :suit_jacket_size, :integer
  end
end
