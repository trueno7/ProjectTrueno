class ContactsMailer < ActionMailer::Base
    default to: 'mir_nizam@hotmail.com'
    def conctact_email(name, email, body)
        @name = name
        @email = email
        @body = body
        
        mail(from: email, subject: 'Conctact Form Message')
    end
end
