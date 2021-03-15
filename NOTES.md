Between the Lines Pictures

MODELS
    user
        has secure password
        has many posts
    photo
        belongs to user

CONTROLLER  
    user_controller.rb
    photo_controller.rb

VIEWS
    user
        sign up
        log in
        index(all posts)
        log out
    photo
        create photo (title, ohoto, comment)
        show all photos
        update/edit current_user photo
        delete current_user photo

DB
    create_users

        t.string :username
        t.string :email
        t.string :password_digest

    create_photos
        belongs_to user
        t.string :title
        t.binary :data
        t.string :comment
        t.integer :user_id