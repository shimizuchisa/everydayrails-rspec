class Note < ApplicationRecord
  belongs_to :project
  belongs_to :user

  delegate :name, to: :user, prefix: true

  validates :message, presence: true

  # LOWERは「引数の文字列をすべて小文字にするSQLの関数」
  scope :search, ->(term) {
    where("LOWER(message) LIKE ?", "%#{term.downcase}%")
  }

  has_one_attached :attachment

  validates :attachment, blob: { content_type: [
    "image/jpeg",
    "image/gif",
    "image/png",
    "application/pdf",
  ]}
end
