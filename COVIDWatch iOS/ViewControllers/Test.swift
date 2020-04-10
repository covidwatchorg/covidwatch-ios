//
//  Test.swift
//  COVIDWatch iOS
//
//  Created by Laima Cernius-Ink on 4/8/20.
//  Copyright © 2020 IZE. All rights reserved.
//
import UIKit

// swiftlint:disable:next type_body_length
class Test: UIViewController {
  var icon: UIImageView?
    var title1 = LargeText(text: "COVID WATCH")
    var q1 = MainText(text: "Have you been tested for COVID-19?")
    var q2 =  MainText(text: "I attest that the information I’ve submitted is true to the best of my knowledge.")
    var terms =  MainText(text: "By clicking \"Report\", you acknowledge, understand and further agree to our Privacy Policy and Terms & Conditions.")
       var not = Button(text: "Not tested", subtext: "")
       var neg = Button(text: "Tested negative", subtext: "")
       var pos = Button(text: "Tested positive", subtext: "")
       var date = Button(text: "Select Date", subtext: "")
       var back = UIView()
       var confirm = UIView()
       var agree =  Button(text: "Agree", subtext: "")
       var disagree =  Button(text: "Disagree", subtext: "")
       var report =  Button(text: "Report", subtext: "")
       var conditionLbl = UITextView()
       var step = 0
       var agreeCount = 0
       var condition = ""
       let screenSize: CGRect = UIScreen.main.bounds
       let timePicker = UIDatePicker()

    func openTimePicker() {
        timePicker.datePickerMode = UIDatePicker.Mode.date
        timePicker.frame = CGRect(x: 0.0, y: 1000, width: self.view.frame.width, height: 150.0)

        timePicker.backgroundColor = UIColor.white
        self.view.addSubview(timePicker)
    }

    func startTimeDiveChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.timeStyle = .short

        timePicker.removeFromSuperview() // if you want to remove time picker
    }

    // swiftlint:disable:next function_body_length
    override func viewDidLoad() {
        super.viewDidLoad()
        openTimePicker()

        if let uiImage = UIImage(named: "logo-cw (3)") {
            icon = UIImageView(image: uiImage)
        }
        icon!.frame.size.width = 41
        icon!.frame.size.height = 39

        icon!.center.x = view.center.x
        icon!.center.y = 75
        self.view.addSubview(icon!)

        title1.textColor = UIColor(red: 0.941, green: 0.329, blue: 0.322, alpha: 1)
        title1.font = UIFont(name: "Montserrat-SemiBold", size: 24)
        title1.sizeToFit()
        title1.center.x = view.center.x
        title1.center.y = icon!.center.y + 50

        view.addSubview(title1)

        q1.textColor = UIColor(red: 0.345, green: 0.345, blue: 0.345, alpha: 1)
        q1.font = UIFont(name: "Montserrat-SemiBold", size: 24)
        q1.frame.size.width = 300
        q1.frame.size.height = 75
        q1.center.x = view.center.x - 25
        q1.center.y = title1.center.y + 100

        view.addSubview(q1)

        // swiftlint:disable:next line_length
        terms.textColor = UIColor(red: 0.345, green: 0.345, blue: 0.345, alpha: 1)
        terms.font = UIFont(name: "Montserrat-SemiBold", size: 12)
        terms.frame.size.width = 320
        terms.frame.size.height = 120
        terms.textAlignment = .center
        terms.center.x = view.center.x
        terms.center.y = screenHeight/1.01 + 1000
        terms.alpha = 0

        view.addSubview(terms)

        q2.textColor = UIColor(red: 0.345, green: 0.345, blue: 0.345, alpha: 1)
        q2.font = UIFont(name: "Montserrat-SemiBold", size: 18)
        q2.frame.size.width = 320
        q2.frame.size.height = 100

        q2.center.x = view.center.x - 3
        q2.center.y = view.center.y + 1050
        q2.textAlignment = .left
        view.addSubview(q2)

        not.frame.size.width = 300
        not.frame.size.height = 75
  
        not.backgroundColor = UIColor(red: 0.925, green: 0.949, blue: 0.98, alpha: 1)
        not.layer.cornerRadius = 20
 not.text.textColor = UIColor(red: 0.345, green: 0.345, blue: 0.345, alpha: 1)
        not.draw(parentVC: self, centerX:view.center.x , centerY: q1.center.y + 125 )

        neg.frame.size.width = 300
        neg.frame.size.height = 75
   neg.backgroundColor = UIColor(red: 0.925, green: 0.949, blue: 0.98, alpha: 1)
        neg.layer.cornerRadius = 20
 neg.text.textColor = UIColor(red: 0.345, green: 0.345, blue: 0.345, alpha: 1)
        neg.draw(parentVC: self, centerX:view.center.x , centerY: not.center.y + 125 )
        pos.frame.size.width = 300
        pos.frame.size.height = 75

        pos.backgroundColor = UIColor(red: 0.925, green: 0.949, blue: 0.98, alpha: 1)
        pos.layer.cornerRadius = 20
         pos.text.textColor = UIColor(red: 0.345, green: 0.345, blue: 0.345, alpha: 1)
        pos.draw(parentVC: self, centerX:view.center.x , centerY: neg.center.y + 125 )
        date.frame.size.width = 300
        date.frame.size.height = 75

        date.layer.cornerRadius = 20

        date.frame.size.width = 300
        date.frame.size.height = 75
        date.text.textColor = UIColor(red: 0.345, green: 0.345, blue: 0.345, alpha: 1)
        date.backgroundColor = UIColor(red: 0.925, green: 0.949, blue: 0.98, alpha: 1)
        date.layer.cornerRadius = 20
        self.date.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dated)))
       date.draw(parentVC: self, centerX:view.center.x , centerY: 1000)

        back.frame.size.width = 75
        back.frame.size.height = 75
        back.center.x = view.center.x - 130
        back.center.y = screenHeight/1.07
        back.backgroundColor = UIColor(red: 0.925, green: 0.949, blue: 0.98, alpha: 1)
        back.layer.cornerRadius = 20
        //    view.addSubview(back)

        confirm.frame.size.width = 325
        confirm.frame.size.height = 350
        confirm.center.x = view.center.x
        confirm.center.y = view.center.y + 1000
        confirm.layer.borderWidth = 1
        confirm.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
        confirm.alpha = 0
        confirm.layer.cornerRadius = 20
        view.addSubview(confirm)

        report.frame.size.width = 289
        report.frame.size.height = 58
        report.alpha = 0
        report.backgroundColor = UIColor(red: 0.286, green: 0.435, blue: 0.714, alpha: 1)
        self.report.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.home)))
        report.layer.cornerRadius = 20
        report.draw(parentVC: self, centerX:view.center.x, centerY: view.center.y + 1000)

        agree.frame.size.width = 289
        agree.frame.size.height = 58
        agree.center.x = view.center.x
        agree.center.y = view.center.y + 1000

        agree.backgroundColor = UIColor(red: 0.286, green: 0.435, blue: 0.714, alpha: 1)
        agree.alpha = 0
        agree.layer.cornerRadius = 20
       agree.draw(parentVC: self, centerX:view.center.x , centerY: view.center.y + 1000)
        disagree.frame.size.width = 289
        disagree.frame.size.height = 58
        disagree.center.x = view.center.x
        disagree.center.y = agree.center.y + 75
        disagree.alpha = 0
        disagree.backgroundColor = UIColor(red: 0.925, green: 0.949, blue: 0.98, alpha: 1)
  disagree.text.textColor = UIColor(red: 0.345, green: 0.345, blue: 0.345, alpha: 1)
        disagree.layer.cornerRadius = 20
        disagree.draw(parentVC: self, centerX:view.center.x , centerY: agree.center.y + 75)

        conditionLbl.text =  "Not yet tested"
        conditionLbl.textColor = UIColor(red: 0.345, green: 0.345, blue: 0.345, alpha: 1)
        conditionLbl.font = UIFont(name: "Montserrat-Bold", size: 15)
        conditionLbl.frame.size.width = 300
        conditionLbl.frame.size.height = 100
        conditionLbl.alpha = 0

        conditionLbl.center.y = not.center.y + 1000

        view.addSubview(conditionLbl)
        let tap = UITapGestureRecognizer(target: self, action: #selector(notTap))

        not.addGestureRecognizer(tap)

        let tap2 = UITapGestureRecognizer(target: self, action: #selector(negTap))

        neg.addGestureRecognizer(tap2)

        let tap3 = UITapGestureRecognizer(target: self, action: #selector(posTap))

        pos.addGestureRecognizer(tap3)

        let tap4 = UITapGestureRecognizer(target: self, action: #selector(agreed))

        agree.addGestureRecognizer(tap4)

        // Do any additional setup after loading the view.
    }

    // swiftlint:disable:next function_body_length
    @objc func dated() {
        step += 1
        if step == 2 {
            UIView.animate(
                withDuration: 1.0,
                delay: 0.0,
                options: [],
                animations: { [weak self] in
                    if let controller = self {
                        controller.timePicker.frame = CGRect(
                            x: 0.0, y: (controller.view.frame.height/2 + 60),
                            width: controller.view.frame.width, height: 150.0
                        )
                        controller.timePicker.fadeInD(1.0)
                    }
                },
                completion: nil
            )
        }
        if step == 3 {
            UIView.animate(withDuration: 1.0,
                           delay: 1.2,
                           options: [],
                           animations: { [weak self] in
                            if let controller = self {
                            controller.confirm.center.y -= 1000
                            controller.q2.center.y = controller.view.center.y - 120
                            controller.q1.fadeOut(1.0)

                            controller.agree.center.y -= 950
                            controller.disagree.center.y -= 950

                                controller.agree.text.center.y -= 950
                                controller.disagree.text.center.y -= 950

                            controller.agree.fadeInV(2.6)
                            controller.disagree.fadeInV(2.6)

                                controller.agree.text.fadeInL(2.6)
                                controller.disagree.text.fadeInL(2.6)
                            controller.confirm.fadeInV(2.0)

                            controller.conditionLbl.fadeInV(2.0)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {

                                controller.conditionLbl.text = "Please confirm that you have \(controller.condition)"
                                controller.conditionLbl.isEditable = false
                                controller.conditionLbl.sizeToFit()
                                controller.conditionLbl.center.x = controller.view.center.x - 11
                            }

                            controller.conditionLbl.center.y = controller.view.center.y - 35
                            }
                },
                completion: nil)

            UIView.animate(withDuration: 1.0,
                           delay: 0.2,
                           options: [],
                           animations: {},
                           completion: nil
            )

            UIView.animate(withDuration: 1.0,
                           delay: 0.3,
                           options: [],
                           animations: { [weak self] in
                                if let controller = self {
                                    controller.q1.center.y += 1000
                                }
                            },
                           completion: nil
            )

            UIView.animate(withDuration: 1.0,
                           delay: 0.2,
                           options: [],
                           animations: { [weak self] in
                                if let controller = self {
                                    controller.not.center.y = controller.q1.center.y + 125
                                }
                            },
                           completion: nil
            )

            UIView.animate(withDuration: 1.0,
                           delay: 0.1,
                           options: [],
                           animations: { [weak self] in
                                if let controller = self {
                                    controller.neg.center.y = controller.not.center.y + 125
                                }
                           },
                           completion: nil
            )

            UIView.animate(withDuration: 1.0,
                           delay: 0.0,
                           options: [],
                           animations: { [weak self] in
                            if let controller = self {
                                controller.date.center.y += 700
                                 controller.date.text.center.y = controller.date.center.y
                                controller.timePicker.frame = CGRect(
                                    x: 0.0, y: 1000,
                                    width: controller.view.frame.width, height: 150.0
                                )
                            }

                }, completion: nil)

        }

    }

    @objc func home() {
        performSegue(withIdentifier: "thanks", sender: self)
    }
    @objc func agreed() {
        agreeCount += 1
        if agreeCount == 1 {
            UIView.animate(withDuration: 1.0,
                           delay: 0.0,
                           options: [],
                           animations: { [weak self] in
                            if let controller = self {
                                controller.report.center.y -= 750
                                controller.report.fadeInV(2.0)
                                controller.report.text.center.y -= 750
                                controller.report.text.fadeInL(2.0)
                            }
                }, completion: nil)

            UIView.animate(withDuration: 1.0,
                           delay: 0.1,
                           options: [],
                           animations: { [weak self] in
                            if let controller = self {
                                controller.terms.center.y -= 1000
                                controller.terms.fadeIn(2.0)
                            }
                }, completion: nil)
        }
    }

    // swiftlint:disable:next function_body_length
    @objc func notTap() {
        condition = "not tested"
        step += 1
        UIView.animate(withDuration: 1.0,
                              delay: 1.2,
                              options: [],
                              animations: { [weak self] in
                               if let controller = self {
                                   controller.confirm.center.y -= 1000
                                   controller.q2.center.y = controller.view.center.y - 120
                                   controller.q1.fadeOut(1.0)

                                   controller.agree.center.y -= 950
                                   controller.disagree.center.y -= 950

                                   controller.agree.text.center.y -= 950
                                   controller.disagree.text.center.y -= 950

                                   controller.agree.fadeInV(2.6)
                                   controller.disagree.fadeInV(2.6)

                                   controller.agree.text.fadeInL(2.6)
                                   controller.disagree.text.fadeInL(2.6)
                                   controller.confirm.fadeInV(2.0)
                                   controller.conditionLbl.fadeInV(2.0)

                                   DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    controller.conditionLbl.text = "Please confirm that you have \(controller.condition)"
                                       controller.conditionLbl.isEditable = false
                                       controller.conditionLbl.sizeToFit()
                                       controller.conditionLbl.center.x = controller.view.center.x - 11
                                   }

                                   controller.conditionLbl.center.y = controller.view.center.y - 35

                               }

                   }, completion: nil)

               UIView.animate(withDuration: 1.0,
                              delay: 0.2,
                              options: [],
                              animations: {},
                              completion: nil
               )

               UIView.animate(withDuration: 1.0,
                              delay: 0.3,
                              options: [],
                              animations: { [weak self] in
                               if let controller = self {
                                   controller.q1.center.y += 1000
                               }

                   }, completion: nil)

               UIView.animate(withDuration: 1.0,
                              delay: 0.2,
                              options: [],
                              animations: { [weak self] in
                               if let controller = self {
                                   controller.not.center.y = controller.q1.center.y + 125
                                    controller.not.text.center.y = controller.not.center.y
                               }

                   }, completion: nil)

               UIView.animate(withDuration: 1.0,
                              delay: 0.1,
                              options: [],
                              animations: { [weak self] in
                               if let controller = self {
                                   controller.neg.center.y = controller.not.center.y + 125
                                    controller.neg.text.center.y = controller.neg.center.y
                               }

                   }, completion: nil)

               UIView.animate(withDuration: 1.0,
                              delay: 0.0,
                              options: [],
                              animations: { [weak self] in
                               if let controller = self {
                                   controller.pos.center.y += 700
                                    controller.pos.text.center.y = controller.pos.center.y
                                   controller.timePicker.frame = CGRect(
                                       x: 0.0, y: 1000,
                                       width: controller.view.frame.width, height: 150.0
                                   )
                               }
                   }, completion: nil)

           }


    // swiftlint:disable:next function_body_length
    @objc func negTap() {
        condition = "tested negative"
        UIView.animate(withDuration: 1.0,
                       delay: 1.2,
                       options: [],
                       animations: { [weak self] in
                        if let controller = self {
                            controller.confirm.center.y -= 1000
                            controller.q2.center.y = controller.view.center.y - 120
                            controller.q1.fadeOut(1.0)

                            controller.agree.center.y -= 950
                            controller.disagree.center.y -= 950

                            controller.agree.text.center.y -= 950
                            controller.disagree.text.center.y -= 950

                            controller.agree.fadeInV(2.6)
                            controller.disagree.fadeInV(2.6)

                            controller.agree.text.fadeInL(2.6)
                            controller.disagree.text.fadeInL(2.6)
                            controller.confirm.fadeInV(2.0)
                            controller.conditionLbl.fadeInV(2.0)

                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                controller.conditionLbl.text = "Please confirm that you have \(controller.condition)"
                                controller.conditionLbl.isEditable = false
                                controller.conditionLbl.sizeToFit()
                                controller.conditionLbl.center.x = controller.view.center.x - 11
                            }

                            controller.conditionLbl.center.y = controller.view.center.y - 35

                        }

            }, completion: nil)

        UIView.animate(withDuration: 1.0,
                       delay: 0.2,
                       options: [],
                       animations: {},
                       completion: nil
        )

        UIView.animate(withDuration: 1.0,
                       delay: 0.3,
                       options: [],
                       animations: { [weak self] in
                        if let controller = self {
                            controller.q1.center.y += 1000
                        }

            }, completion: nil)

        UIView.animate(withDuration: 1.0,
                       delay: 0.2,
                       options: [],
                       animations: { [weak self] in
                        if let controller = self {
                            controller.not.center.y = controller.q1.center.y + 125
                             controller.not.text.center.y = controller.not.center.y
                        }

            }, completion: nil)

        UIView.animate(withDuration: 1.0,
                       delay: 0.1,
                       options: [],
                       animations: { [weak self] in
                        if let controller = self {
                            controller.neg.center.y = controller.not.center.y + 125
                             controller.neg.text.center.y = controller.neg.center.y
                        }

            }, completion: nil)

        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       options: [],
                       animations: { [weak self] in
                        if let controller = self {
                            controller.pos.center.y += 700
                             controller.pos.text.center.y = controller.pos.center.y
                            controller.timePicker.frame = CGRect(
                                x: 0.0, y: 1000,
                                width: controller.view.frame.width, height: 150.0
                            )
                        }
            }, completion: nil)

    }

    // swiftlint:disable:next function_body_length
    @objc func posTap() {
        step += 1
        condition = "tested positive"
        if step == 1 {
            UIView.animate(withDuration: 1.0,
                           delay: 0.3,
                           options: [],
                           animations: { [weak self] in
                            if let controller = self {
                                controller.q1.center.y += 1000
                                controller.q1.fadeOut(1.0)
                            }
                }, completion: nil)

            UIView.animate(withDuration: 1.0,
                           delay: 0.2,
                           options: [],
                           animations: { [weak self] in
                            if let controller = self {
                                controller.not.center.y = controller.q1.center.y + 125
                                controller.not.text.center.y = controller.not.center.y
                                controller.not.text.fadeOutL(1.0)
                                controller.not.fadeOutV(1.0)
                            }
                }, completion: nil)

            UIView.animate(withDuration: 1.0,
                           delay: 0.1,
                           options: [],
                           animations: { [weak self] in
                            if let controller = self {
                                controller.neg.center.y = controller.not.center.y + 125
                                 controller.neg.text.center.y = controller.neg.center.y

                                controller.neg.fadeOutV(1.0)
                                controller.neg.text.fadeOutL(1.0)
                            }
                }, completion: nil)

            UIView.animate(withDuration: 1.0,
                           delay: 0.0,
                           options: [],
                           animations: { [weak self] in
                            if let controller = self {
                                controller.pos.center.y = controller.neg.center.y + 125
                                 controller.pos.text.center.y = controller.pos.center.y
                                controller.pos.text.fadeOutL(1.0)
                                controller.pos.fadeOutV(1.0)
                            }
                }, completion: nil)

            UIView.animate(withDuration: 1.0,
                           delay: 1.0,
                           options: [],
                           animations: { [weak self] in
                            if let controller = self {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    controller.date.fadeInV(2.6)
                                    controller.q1.fadeIn(2.6)
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    controller.q1.text = "When did your symptoms start?"
                                    controller.q1.sizeToFit()
                                    controller.q1.center.x = controller.view.center.x - 45
                                }
                            }
                }, completion: nil)
            UIView.animate(withDuration: 1.0,
                           delay: 1.1,
                           options: [],
                           animations: { [weak self] in
                            if let controller = self {
                                controller.date.center.y -= 650
                                 controller.date.text.center.y = controller.date.center.y
                            }
                }, completion: nil)
            UIView.animate(withDuration: 1.0,
                           delay: 1.1,
                           options: [],
                           animations: { [weak self] in
                            if let controller = self {
                                controller.q1.center.y -= 1000
                            }

                }, completion: nil)

            UIView.animate(withDuration: 1.0,
                           delay: 1.2,
                           options: [],
                           animations: {},
                           completion: nil
            )
        }

    }
}
extension UITextView {
    func fadeTo(_ alpha: CGFloat, duration: TimeInterval = 0.3) {
        DispatchQueue.main.async {
            UITextView.animate(withDuration: duration) {
                self.alpha = alpha
            }
        }
    }

    func fadeIn(_ duration: TimeInterval = 0.3) {
        fadeTo(1.0, duration: duration)
    }

    func fadeOut(_ duration: TimeInterval = 0.3) {
        fadeTo(0.0, duration: duration)
    }
}
extension UIView {
    func fadeToV(_ alpha: CGFloat, duration: TimeInterval = 0.3) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: duration) {
                self.alpha = alpha
            }
        }
    }

    func fadeInV(_ duration: TimeInterval = 0.3) {
        fadeToV(1.0, duration: duration)
    }

    func fadeOutV(_ duration: TimeInterval = 0.3) {
        fadeToV(0.0, duration: duration)
    }
}

extension UILabel {
    func fadeToL(_ alpha: CGFloat, duration: TimeInterval = 0.3) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: duration) {
                self.alpha = alpha
            }
        }
    }

    func fadeInL(_ duration: TimeInterval = 0.3) {
        fadeToL(1.0, duration: duration)
    }

    func fadeOutL(_ duration: TimeInterval = 0.3) {
        fadeToL(0.0, duration: duration)
    }
}
extension UIDatePicker {
    func fadeToD(_ alpha: CGFloat, duration: TimeInterval = 0.3) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: duration) {
                self.alpha = alpha
            }
        }
    }

    func fadeInD(_ duration: TimeInterval = 0.3) {
        fadeToD(1.0, duration: duration)
    }

    func fadeOutD(_ duration: TimeInterval = 0.3) {
        fadeToD(0.0, duration: duration)
    }
// swiftlint:disable:next file_length
}
