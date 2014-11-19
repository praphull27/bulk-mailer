nodemailer = require "nodemailer"
fs = require "fs"

recipients =
	"Prof. FirstName LastName":"email@no-mail.mail.com"
	"Prof. FirstName1 LastName1":"email1@no-mail.mail.com"


mailer = nodemailer.createTransport "SMTP",
	service: "Gmail"
	auth:
		user: "email111@no-mail.mail.com"
		pass: "<Enter Password>"

for name, email of recipients
	do (name, email) ->
		mailer.sendMail
			from: "First Last <"email111@no-mail.mail.co>"
			to: "#{name} <#{email}>"
			subject: "Inquiry for GSR / Part-Time Position"
			text: "Dear #{name}\n\n" + fs.readFileSync "cover_leter.txt", encoding: "utf8"
			attachments: [filePath: "Resume File Name.pdf"]
			(err, res) ->
				if err
					console.error "Error occured sending email to #{name} <#{email}>"
				else
					console.log "Email sent to #{name} <#{email}>"
