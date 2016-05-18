namespace :badrumsbekannelser do
  namespace :dev do
    desc "Add seed data for development"
    task :seed => :environment do
      # Create 10 families with between 2 and 10 members.
      10.times do
        family = Family.create!(name: Faker::Name.last_name)
        rand(2..10).times do
          User.create!(
            first_name: Faker::Name.first_name,
            last_name:  family.name,
            email:      Faker::Internet.email,
            family:     family,
            password:   Faker::Internet.password(8)
          )
        end
      end

      user_ids = User.pluck(:id)
      25.times do
        user = User.find(user_ids.shuffle.first)

        user.confessions.create!(
          body: Faker::Lorem.paragraph
        )
      end

      confession_ids = Confession.pluck(:id)
      5.times do
        confession = Confession.find(confession_ids.shuffle.first)

        confession.build_comment(
          title: Faker::Lorem.sentence,
          body: Faker::Lorem.paragraph
        )

        confession.featured = [true, false].sample
        confession.save!
      end
    end
  end
end
