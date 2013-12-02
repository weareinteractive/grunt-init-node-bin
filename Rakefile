desc "Create plugin and compare"
task :test do
  system "rm -rf test/node-example"
  system "mkdir test/node-example"
  Dir.chdir("test/node-example") do
    system "grunt-init node-bin"
  end
  puts "Comparing directories:"
  puts "-------------------------------------------------"
  system "diff -rq test/expected test/node-example"
  puts "-------------------------------------------------"
  puts "done"
  puts ""
  Dir.chdir("test/node-example") do
    puts "Installing depenencies"
    puts "-------------------------------------------------"
    system "npm install > /dev/null 2>&1"
    puts "done"
    puts ""
    puts "Running tests"
    puts "-------------------------------------------------"
    system "grunt test"
    puts "-------------------------------------------------"
    puts "done"
  end
end