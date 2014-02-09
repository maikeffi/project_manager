namespace :app do
  
  
  task :ensure_development_environment => :environment do
    if Rails.env.production?
      raise "\nI'm Sorry Kannan, I can't do that.\n you are asking us to drop production environment"
    end
  end
  
  desc "Rest Table"
  
  task :reset => [:ensure_development_environment,"db:drop","db:create","db:migrate","app:populate"]
  
  desc "Populate for dev table "
  
  task :populate => :environment do
    [
      {:first_name => "Kannan",:last_name => "Maikeffi"},
      {:first_name => "Richard",:last_name => "Kavin"},
      {:first_name => "Sri",:last_name => "Prasanna"},
      {:first_name => "Roshni",:last_name => "Bharadwaj"},
      {:first_name => "Viji",:last_name => "Mani"},
    ].each do |ppl|
      Person.find_or_create_by_first_name_and_last_name(ppl)
    end
    
    
    [
      {:title => "Planning" , :position => 1},
      {:title => "Implementing" , :position => 2},
      {:title => "Completed" , :position => 3},
      {:title => "Maintaining" , :position => 4},
    ].each do |sts|
      Status.find_or_create_by_title(sts)
    end
    
  end
  
end