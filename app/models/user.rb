class User < ApplicationRecord

  def self.import(path)
    list = []
    
    CSV.foreach(path, headers: true) do | row |
      list << {
        name: row["name"],
        age: row["age"],
        address: row["address"]
      }
    end

    puts "インポートを開始しました"
    User.create(list)
    puts "インポートに成功しました"
  rescue ActiveModel::UnknownAttributeError => invalid
    puts "インポートに失敗しました"
    
  end

end
