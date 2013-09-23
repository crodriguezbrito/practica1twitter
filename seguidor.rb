require 'twitter'
require './configure'
user = Hash.new
screen_name = ARGV[0] || 'unline91'
iteracion = ARGV[1] || '3'


a_user = Twitter.user(screen_name)

puts "Username   : #{a_user.screen_name}"


# Iterate friends, hash their followers
friends = Twitter.friend_ids(screen_name)
var = 0  

friends.ids.each do |fid|
  if var < 10
    f = Twitter.user(fid)
    # Only iterate if we can see their followers
    if (f.protected.to_s != "true")
      user[f.screen_name.to_s] = f.followers_count
      var +=1
    
    end
  end

end


user.sort_by {|k,v| -v}.each { |user, count| puts "#{user}, #{count}" }


