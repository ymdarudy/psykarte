class ChangeColumnNullSiteNameToSupplementaryInformations < ActiveRecord::Migration[6.1]
  def change
    change_column_null :supplementary_informations, :site_name, false
    change_column_null :supplementary_informations, :site_url, false
  end
end
