class Contact < ApplicationRecord

  enum subject: { manga: 0, message: 1,review: 2, follower: 3, other: 4 }
end
