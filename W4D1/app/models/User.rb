class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
    has_many(
      :contacts,
      class_name: 'Contact',
      primary_key: :id,
      foreign_key: :user_id
      )

      has_many(
        :shared_contacts,
        through: :contacts,
        source: :shared_contacts
      )

end
