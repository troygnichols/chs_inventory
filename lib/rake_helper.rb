require 'rake'

def ask(message)
  print "#{message}\n"
  STDIN.gets.chomp
end
