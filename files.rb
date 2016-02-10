

files = Dir.glob('public/uploads/*')
files.each do |file|
      puts file
end

records = Dir.glob("**/*")
puts records

