class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :user_id, presence: true

  belongs_to(
    :owner,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :user_id
  )

  has_many(
    :shared_contacts,
    class_name: 'ContactShare',
    primary_key: :id,
    foreign_key: :contact_id
  )

  has_many(
    :shared_users,
    through: :shared_contacts,
    source: :user 
  )
end
