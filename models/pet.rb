require('pg')

class Pet

  attr_reader :name, :species, :image_url, :id, :store_id

def initialize(options)
  @name = options['name']
  @species = options['species']
  @image_url = options['image_url']
  @id = options['id']
  @store_id = options['store_id']
end

def store()
  sql = "SELECT * FROM stores WHERE id = #{@store_id}"
  result = Pet.run_sql( sql )
  Store.new( result[0] )
end

def save()
  sql = "INSERT INTO pets (
    name,
    species,
    image_url,
    store_id
    )
    VALUES (
    '#{@name}',
    '#{@species}',
    '#{@image_url}',
    '#{@store_id}'
    )"
  Pet.run_sql( sql )
end

def self.find(id)
 sql = "SELECT * FROM pets WHERE id = #{id}"
 result = Pet.run_sql( sql )
 return Pet.new( result[0] )
end

def update()
  sql = "UPDATE pets SET name='#{ @name }', store_id = #{ @store_id } WHERE id = #{@id}"
  return Pets.run_sql( sql )
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
