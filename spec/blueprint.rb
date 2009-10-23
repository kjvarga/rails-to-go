require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.full_name  { Faker::Name.name }
Sham.first_name { Faker::Name.first_name }
Sham.last_name { Faker::Name.last_name }
Sham.email { Faker::Internet.email }
Sham.tag(:unique => false) { ["Music", "Recipe", "Kazaa", "Gonzo Journalism", "Fake News", "Elton's Diary", "Climbing", "Twitter Rubbish"].rand }
Sham.content(:unique => false) { Faker::Lorem.paragraphs.join("\n\n") }
Sham.title { Faker::Company.catch_phrase }
Sham.metadata_as_text(:unique => false) { "Name: KarlVarga\nRating: R" }
Sham.user(:unique => false) { User.find :first, :order => 'RAND()' }
Sham.account_type(:unique => false) { %w{user admin author}.rand }
Sham.domain(:unique => false) { Faker::Internet.domain_name }
Sham.comment(:unique => false) { Faker::Lorem.paragraph }

User.blueprint do
  first_name
  last_name
  email
  password "password"
  password_confirmation "password"
end

User.blueprint(:admin) do
  account_type 'admin'
end

User.blueprint(:author) do
  account_type 'author'
end

Post.blueprint do
  title
  content
  metadata_as_text
end

Site.blueprint do
  domain
end

Tag.blueprint do
  name { Sham.tag }
end

Comment.blueprint do
  name { Sham.full_name }
  email
  comment
end

def seed_database(counts={})
  counts = { :admins => 3, :authors => 6, :users => 3, :posts => 32, 
    :sites => 8, :tags => 8 }.merge(counts)
  
  until User.count >= counts[:users]
    begin
      u = User.make
      puts "Created user #{u.email}"
    rescue
    end
  end

  until User.account_type_equals('author').count >= counts[:authors]
    begin
      u = User.make(:author)
      puts "Created author #{u.email}"
    rescue
    end
  end

  until User.account_type_equals('admin').count >= counts[:admins]
    begin
      u = User.make(:admin)
      puts "Created admin #{u.email}"
    rescue
    end
  end
  
  until Site.count >= counts[:sites]
    begin
      s = Site.make
      puts "Created site #{s.domain}"
    rescue
    end
  end
  
  until Tag.count >= counts[:tags]
    begin
      t = Tag.make
      puts "Created tag #{t.name}"
    rescue
    end
  end
  
  until Post.count >= counts[:posts]
    p = Post.make(:user => Sham.user) do |post|
      rand(10).times { post.comments.make }
      post.sites = Site.find :all, :order => 'RAND()', :limit => rand(counts[:sites])
      post.tag_list = TagList.new(Tag.find(:all, :order => 'RAND()', :limit => rand(4)).collect(&:name))
      post.save
    end  
    puts "Created post #{p.title} [tags: #{p.tag_list.join(', ')}]"  
  end
end