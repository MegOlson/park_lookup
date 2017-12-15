class Seed
  def self.begin
    seed = Seed.new
    seed.generate_content
  end

  def generate_content
    State.destroy_all
    Park.destroy_all

    20.times do |i|
      state = State.create!(
        name: Faker::Address.state
      )

      5.times do |s|
        park = state.parks.create!(
          name: Faker::TwinPeaks.location
        )
        puts "Park #{s}: Name is #{park.name}."
      end

      puts "State #{i}: Name is #{state.name}."
    end
  end
end

Seed.begin
