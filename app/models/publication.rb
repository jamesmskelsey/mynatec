class Publication < ApplicationRecord
  has_many :excerpts, dependent: :destroy
  has_many :part_numbers

  after_create :extract_excerpts

  def extract
    print "I just created: #{self.pub_number}\n"
    yomu = Yomu.new self.path
    text = yomu.text
    excerpts = text.split(self.pub_number)
    excerpts.each.with_index do |e, i|
      self.excerpts.create(page_number: i+1, text: e)
    end
  end

  private

  def extract_excerpts
    print "I just created: #{self.pub_number}\n"
    yomu = Yomu.new self.path
    text = yomu.text
    excerpts = text.split(self.pub_number)
    excerpts.each.with_index do |e, i|
      self.excerpts.create(page_number: i+1, text: e)
    end
  end
end
