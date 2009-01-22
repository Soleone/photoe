desc "Run all specs in commandline with color"
task :specs do
  system("spec spec --color --format specdoc")
end