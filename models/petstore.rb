require('pg')

class Store

  attr_reader :name, :address, :stock, :id

  def initialize(options)
    @name = options['name']
    @address = options['address']
    @stock = options['stock']
    @id = options['id']
  end

  def pets()
    sql = "SELECT * FROM pets WHERE store_id=#{@id} ORDER BY name"
    pets = Store.run_sql(sql)
    result = pets.map { |pet| Pet.new(pet)}
  end

  def self.all()
    sql = "SELECT * FROM stores ORDER BY name"
    stores = Store.run_sql(sql)
    result = stores.map { |store| Store.new(store)}
  end

  def save()
    sql = "INSERT INTO stores (
        name,
        address,
        stock
      ) VALUES (
      '#{@name}',
      '#{@address}',
      '#{@stock}'
      )"
      return Store.run_sql(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM stores WHERE id = #{id}"
    result = Store.run_sql(sql)
    store = Store.new(result[0])
  end

  def update()
    sql = "UPDATE stores SET name='#{@name}', address='#{@address}', stock='#{@stock}' WHERE id = #{@id}"
    return Store.run_sql(sql)
  end

  private

 def self.run_sql(sql)
   begin
     db = PG.connect({dbname: 'petstore', host: 'localhost'})
     result = db.exec(sql)
     return result
   ensure #ensure that this always gets run (so in this case, always connect to the DataBase.)
     db.close
   end
 end

end