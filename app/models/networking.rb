class Networking < ActiveRecord::Base
belongs_to :user
has_many :connection, class_name: 'User2'

end
