class ChamgeColumnDefaultToRequests < ActiveRecord::Migration[6.1]
  def change
    change_column_default :requests, :status, from: nil, to: "0"
  end
end
