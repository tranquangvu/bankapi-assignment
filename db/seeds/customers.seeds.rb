puts '~> Create customers'

[
  'Arisha Barron',
  'Branden Gibson',
  'Rhonda Church',
  'Georgina Hazel'
].each do |customer_fulname|
  Customer.create!(
    email: "#{arisha_barron.parameterize}@gobank.com",
    password: 'password123',
    fullname: customer_fulname
  )
end
