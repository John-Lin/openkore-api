Dir.glob('./{config,controllers,models,services}/init.rb').each do |file|
  require file
end

run OpenKoreAPI
