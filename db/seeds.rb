[
  { country: 'USA', state: 'New York', name: 'New York' },
  { country: 'USA', state: 'California', name: 'Los Angeles' },
  { country: 'USA', state: 'Illinois', name: 'Chicago' },
  { country: 'USA', state: 'Texas', name: 'Houston' },
  { country: 'USA', state: 'California', name: 'San Francisco', enabled: true },
  { country: 'USA', state: 'California', name: 'San Jose' },
  { country: 'USA', state: 'Washington', name: 'Seattle' },
  { country: 'USA', state: 'Massachusetts', name: 'Boston' },
  { country: 'Canada', state: 'Ontario', name: 'Toronto' },
  { country: 'Canada', state: 'British Columbia', name: 'Vancouver' }
].each do |city_data|
  City.create!(city_data)
end

[
  { day_of_week: 'Thursday', time_of_day: '7 am', enabled: false },
  { day_of_week: 'Thursday', time_of_day: '8 am', enabled: false },
  { day_of_week: 'Thursday', time_of_day: '9 am', enabled: false },
  { day_of_week: 'Friday', time_of_day: '7 am', enabled: false },
  { day_of_week: 'Friday', time_of_day: '8 am', enabled: true },
  { day_of_week: 'Friday', time_of_day: '9 am', enabled: true },
  { day_of_week: 'Friday', time_of_day: '10 am', enabled: false },
  { day_of_week: 'Friday', time_of_day: '2 pm', enabled: true },
  { day_of_week: 'Saturday', time_of_day: '8 am', enabled: false },
  { day_of_week: 'Saturday', time_of_day: '9 am', enabled: false },
  { day_of_week: 'Saturday', time_of_day: '10 am', enabled: false }
].each do |timeslot|
  Timeslot.create!(timeslot)
end

if Rails.env.development?

  city = City.enabled.first
  week = Week.create_from_today

  101.times do
    user = User.create!(
      email: Faker::Internet.email,
      password: Devise.friendly_token[0, 20],
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      title: Faker::Job.title,
      profile: Faker::Avatar.image,
      approved: true,
      city: city
    )

    [1, 2, 3].sample.times do
      user.availabilities.create(timeslot: Timeslot.all.to_a.sample)
    end

    user.confirmations.create!(week: week) # if [true, false].sample
  end
end

User.create!(email: 'mmahalwy@gmail.com', password: 'password', role: :admin, approved: true, city: city)
