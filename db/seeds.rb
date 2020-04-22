Aircraft.destroy_all
Runaway.destroy_all

10.times do |i|
  Aircraft.create!(number: "Plane-#{i + 1}")
end

Runaway.create!(name: 'Main runaway')
