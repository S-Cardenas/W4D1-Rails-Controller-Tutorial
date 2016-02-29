class ContactShare < ActiveRecord::Base

  belongs_to:(
    :user,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :user_id
    )

  belongs_to:(
    :contact,
    class_name: 'Contact',
    primary_key: :id,
    foreign_key: :contact_id
  )

end 
