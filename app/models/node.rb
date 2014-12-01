class Node < ActiveRecord::Base
  TRANSFER_SYNTAX = {
    0  => 'Explicit Little Endian',
    9  => 'Implicit Little Endian',
    1  => 'JPEG 2000 Lossless',
    2  => 'JPEG 2000 Lossy - High Quality',
    3  => 'JPEG 2000 Lossy - Medium Quality',
    4  => 'JPEG 2000 Lossy - Low Quality',
    13 => 'JPEG LS Lossless',
    15 => 'JPEG LS Lossy - High Quality',
    16 => 'JPEG LS Lossy - Medium Quality',
    14 => 'JPEG LS Lossy - Low Quality',
    5  => 'JPEG Lossless',
  }

  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true
  validates :aetitle, presence: true
  validates :address, presence: true
  validates :port, presence: true

  def transfer_syntax_name
    TRANSFER_SYNTAX[transfer_syntax]
  end
end
