# lib/tasks/admin.rake
namespace :admin do
  desc "Create an admin user or set an existing user as admin"
  task :create, [:email, :password] => :environment do |_, args|
    if args.email.blank?
      puts "Usage: rake admin:create[email,password]"
      exit
    end
    
    user = User.find_by(email: args.email)
    
    if user
      user.update(role: "admin")
      puts "User #{args.email} updated to admin role"
    else
      if args.password.blank?
        puts "Password required for new user"
        exit
      end
      
      user = User.new(
        email: args.email,
        password: args.password,
        role: "admin"
      )
      
      if user.save
        puts "Admin user #{args.email} created successfully"
      else
        puts "Error creating admin user: #{user.errors.full_messages.join(', ')}"
      end
    end
  end
end