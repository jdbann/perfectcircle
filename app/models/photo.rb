class Photo < ApplicationRecord
  belongs_to :album
  has_attached_file :photo, styles: { full: "464x464>", thumb: "96x96#" }
end
