class User < ActiveRecord::Base
    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"  }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
    #validates_attachment_content_type :avatar, content_type: pdf

    serialize :avatars, Array
    mount_uploaders :avatars, AvatarUploader
    
    def self.as_csv
  		CSV.generate do |csv|
    		csv << column_names
    		all.each do |item|
      			csv << item.attributes.values_at(*column_names)
    		end
  		end
	end
end
