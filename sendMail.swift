import UIKit
import MessageUI

class newsDetailViewController: UIViewController,MFMailComposeViewControllerDelegate{

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	//this is a button, we will see the action When we clicked the  button .
	@IBAction func PressOpen(_ sender: Any) {
	   let mailController = sendmail()
		if MFMailComposeViewController.canSendMail(){
			self.present(mailController, animated: true, completion: nil)
		} else {
			showError()
		}
		
	}
		// send Mail From Mail App on your Device
	func sendmail() ->MFMailComposeViewController{
		let Mymail = MFMailComposeViewController()
		Mymail.mailComposeDelegate = self
		Mymail.setCcRecipients(["xxxx@gmail.com"]) // Write there receiver`s Email address
		Mymail.setSubject("we write a subject here") // Write there your mail`s Subject
		Mymail.setMessageBody("We write our Mail context here ", isHTML: false) // Write there your mail`s contents
		return Mymail
	}
		//show Error when App could not send mail on your device
	func showError(){
		let sendMailError = UIAlertController(title: "Could not send message", message: "Your device could not send this message", preferredStyle: .alert)
		let dismiss = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
		sendMailError.addAction(dismiss)
		self.present(sendMailError, animated: true, completion: nil)
	}
	// this block work when we sent mail , mail sent seccessfuly and viewcontroller will dismiss
	func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
		controller.dismiss(animated: true, completion: nil)
	}
	
	
}