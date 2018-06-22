class Publication < ApplicationRecord
  has_many :excerpts, dependent: :destroy

  after_create :extract_excerpts

  private

  def extract_excerpts
    print "I just created: #{self.title}\n"
    yomu = Yomu.new self.path
    text = yomu.text
    excerpts = text.split(self.title)
    excerpts.each.with_index do |e, i|
      self.excerpts.create(page_number: i+1, text: e)
    end
  end
end
