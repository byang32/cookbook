namespace :db do
  desc 'Puts default categories in the database'
  task import_categories: :environment do
    Category.create name: 'Beverages'
    Category.create name: 'Deserts'
    Category.create name: 'Appetizers'
    Category.create name: 'Entrees'
    Category.create name: 'Breakfast'
    Category.create name: 'Sandwiches'
    
    puts 'Created categories.'
  end
end  