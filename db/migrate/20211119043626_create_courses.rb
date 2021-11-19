class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|      #create_table(:courses)
      t.string :name                  #t.string(:name) 把:name以字串的型態呈現
      t.integer :price
      t.text :intro
      t.decimal :hour
      t.string :cover

      t.timestamps
    end
  end
end

# params:{"authenticity_token"=>"jiTJXNQltX-ZoOKShgWLLewEvuXMx_n1GpzR_lsceypOZ2eNf9u9ocqakM14lbCen68_psNAH0mhFYTit2p9YQ", 
# "course"=>{"name"=>"", "price"=>"", "intro"=>"", "hour"=>""}, 
# "commit"=>"送出", 
# "controller"=>"courses", 
# "action"=>"create"}


#建立的這些欄位名稱
# (1)取用時都是要用符號的型態
# (2)會自動變成一個方法
