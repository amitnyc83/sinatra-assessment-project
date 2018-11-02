owner1 = User.create!(:name => 'Amit', :username => 'amit', :password => '1234')
team1 = Team.create!(:name => 'Liverpool', :stadium => 'Anfield', :sponsor => 'Standard Chartered', :user_id => owner1.id)



owner2 = User.create!(:name => 'Jack', :username => 'jack', :password => '12345')
team2 = Team.create!(:name => 'Chelsea', :stadium => 'High Park', :sponsor => 'Yokohama', :user_id  => owner2.id)



owner3 = User.create!(:name => 'Reno', :username => 'reno', :password => '123456')
team3 = Team.create!(:name => 'Juventus', :stadium => 'The Old Lady', :sponsor => 'Emirates', :user_id  => owner3.id)
