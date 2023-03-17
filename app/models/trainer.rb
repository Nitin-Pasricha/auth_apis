class Trainer < ApplicationRecord
    attr_accessor :password

    # validations
    validates :first_name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: /\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+/ }
    validates :password, length: {in: 6..20 },  confirmation: true, on: :create

    before_save :encrypt_password
    
    def self.authenticate(email, pwd)
        student = find_by_email(email)
        return student if student && student.check_password(pwd)
    end

    def check_password(pwd)
        encrypt(pwd) == self.encrypted_password
    end

    protected

        def encrypt_password
            return if password.blank?
            self.encrypted_password = encrypt(password)
        end

        def encrypt(string)
            Digest::SHA1.hexdigest(string)
        end
end
