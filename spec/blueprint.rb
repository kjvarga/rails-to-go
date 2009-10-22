require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.full_name  { Faker::Name.name }
Sham.first_name { Faker::Name.first_name }
Sham.last_name { Faker::Name.last_name }
Sham.email { Faker::Internet.email }
Sham.tag(:unique => false) { ["Adaptive", "Advanced", "Ameliorated", "Assimilated", "Automated", "Balanced", "Business-focused", "Centralized"].rand }
Sham.content(:unique => false) { Faker::Lorem.paragraphs }
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
  counts = { :users => 10, :posts => 30, :sites => 8 }.merge(counts)
  
  until User.count == counts[:users]
    u = User.new
    until u.valid?
      u.attributes = User.plan
    end
    u.save!
    puts "Created user #{u.email}"
  end

  until Site.count == counts[:sites]
    s = Site.new
    until s.valid?
      s.attributes = Site.plan
    end
    s.save!
    puts "Created site #{s.domain}"
  end
  
  until Post.count == counts[:posts]
    p = Post.make(:user => Sham.user) do |post|
      rand(10).times { post.comments.make }
      post.sites = Site.find :all, :order => 'RAND()', :limit => rand(counts[:sites])
    end  
    puts "Created post #{p.title}"  
  end
end