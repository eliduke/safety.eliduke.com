require 'yaml'

puts "* Loading yaml file..."

manuals = YAML.load_file('./_data/manuals.yml')

puts "* Looping through manuals data..."

manuals.each do |manual|
  puts "* Creating file #{manual["slug"]}.html"
  File.open("./_manuals/#{manual["slug"]}.html", "wb") do |file|
    file.write(<<~EOS
    ---
    layout: manual
    carrier: #{manual["carrier"]}
    make: #{manual["make"]}
    model: #{manual["model"]}
    mode: #{manual["mode"]}
    version: #{manual["version"]}
    slug: #{manual["slug"]}
    ---
    EOS
    )
  end
end
