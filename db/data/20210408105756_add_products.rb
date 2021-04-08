class AddProducts < ActiveRecord::Migration[6.1]
  def up
    Product.create(name: 'Iphone 12 Pro Max 128GB', price: 31_000_000, stock: 10)
    Product.create(name: 'Iphone 12 Pro 128GB', price: 28_000_000, stock: 10)
    Product.create(name: 'Iphone 12 64GB', price: 21_000_000, stock: 10)
    Product.create(name: 'Iphone 12 Mini 64GB', price: 18_000_000, stock: 10)
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
