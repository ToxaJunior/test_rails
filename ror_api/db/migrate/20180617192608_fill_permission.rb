class FillPermission < ActiveRecord::Migration[5.2]
  def self.up
    10.times do |i|
      Permission.create(:name => "permission#{i + 1}")
    end
  end
  def self.down
    10.times do |i|
      Permission.delete(:name => "permission#{i + 1}")
    end
  end
end
