class Item < ApplicationRecord
  enum is_active: { default: 0, false: 1 }
end
