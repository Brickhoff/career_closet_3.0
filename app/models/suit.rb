class Suit < ApplicationRecord
  enum statuses: [:Available, :Reserved, :Checkout, :Damaged]
  enum genders:[:M, :G]
  
  validates :appid, presence: true, uniqueness: {case_sensitive: false}
  validates :gender, presence: true, inclusion: {in: genders}
  validates :article, presence: true
  validates :size, presence: true
  validates :status, presence: true, inclusion: {in: statuses}
    
  def isAvailable?
    status == "Available"
  end
  
  def self.search(search)
    if search
      where('gender LIKE ?', "%#{search}%")
    else
      where(nil)
    end
  end
  
  def self.search1(search1)
    if search1
      where('size LIKE ?', "%#{search1}%")
    else
      where(nil)
    end
  end
  
  def self.search2(search2)
    if search2
      where('status LIKE ?', "%#{search2}%")
    else
      where(nil)
    end
  end
  
end
