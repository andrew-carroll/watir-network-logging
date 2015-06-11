require 'yaml'
require 'logger'
require 'active_record'

%w(lib app).each do |top_dir|
  Dir.glob("./#{top_dir}/*").each do |dir|
    Dir.glob(dir+'/*.rb').each do |file|
      require file
    end
  end
end

DATABASE_ENV = ENV['ENV'] || 'development'
db_config = YAML.load_file('db/config.yml')
ActiveRecord::Base.establish_connection(db_config[DATABASE_ENV])
