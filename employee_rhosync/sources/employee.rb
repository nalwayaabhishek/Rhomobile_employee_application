class Employee < SourceAdapter
  def initialize(source,credential)
    @base = 'http://localhost:3000/employees'
    super(source,credential)
  end
 
  def login
    # TODO: Login to your data source here if necessary
  end
 
  def query(params=nil)
   
    parsed=JSON.parse(RestClient.get("#{@base}.json").body)
    @result={}
    parsed.each { |item|       
      @result[item["employee"]["id"].to_s]=item["employee"]
    } 
    @result       
  end
 
  def sync
    super
  end
 
  def create(create_hash,blob=nil)
    res = RestClient.post(@base,:employee => create_hash)
    JSON.parse(RestClient.get("#{res.headers[:location]}.json").body)["employee"]["id"]
  end
 
  def update(update_hash)
    obj_id = update_hash['id']
    update_hash.delete('id')   
    RestClient.put("#{@base}/#{obj_id}",:employee => update_hash)
  end
 
  def delete(object_id)
    RestClient.delete("#{@base}/#{object_id['id']}")
  end
 
  def logoff
    # TODO: Logout from the data source if necessary
  end
  
end