//
//  SettingViewController.swift
//  TodayAnbu
//
//  Created by YeongJin Jeong on 2022/07/14.
//

import UIKit

class SettingViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var momVstackView: UIStackView! // 어머니 전화번호 입력 Vstack
    @IBOutlet weak var dadVstackView: UIStackView! // 아버지 전화번호 입력 Vstack
    @IBOutlet weak var momDayVstack: UIStackView! // 어머니 전화번호 입력 Vstack
    @IBOutlet weak var dadDayVstack: UIStackView! // 아버지 전화번호 입력 Vstack
    @IBOutlet weak var momNumberTextfield: UITextField! // 어머니 전화번호 입력 텍스트 필드
    @IBOutlet weak var dadNumberTextfield: UITextField! // 아버지 전화번호 입력 텍스트 필드
    @IBOutlet weak var startBtn: UIButton!

    var momNumber: String?
    var dadNumber: String?

    private var isMomNumberCompleted: Bool = false {
        didSet {
            momDayVstack.isHidden = false
        }
    }

    private var isDadNumberCompleted: Bool = false {
        didSet {
            dadDayVstack.isHidden = false
        }
    }

    // Delegate 설정 및 Textfield 설정
    override func viewDidLoad() {
        super.viewDidLoad()
        momNumberTextfield.delegate = self
        dadNumberTextfield.delegate = self
        momNumberTextfield.setBottomBorder(color: UIColor.systemGray4)
        momNumberTextfield.addDoneButtonOnKeyboard()
        dadNumberTextfield.setBottomBorder(color: UIColor.systemGray4)
        dadNumberTextfield.addDoneButtonOnKeyboard()
        momDayVstack.isHidden = true
        dadDayVstack.isHidden = true
    }
}

extension SettingViewController {
    // 텍스트 필드 validation check
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if textField.text!.count < 10 {
            textField.setBottomBorder(color: UIColor.red)
        } else {
            textField.setBottomBorder(color: UIColor.green)
        }
        let validation = textField.text!.count + string.count - range.length
        return !(validation > 11)
    }

    // textfield keyboard가 내려가면 호출
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == momNumberTextfield {
            if momNumberTextfield.text != nil {
                momNumber = momNumberTextfield.text!
                isMomNumberCompleted = true
            } else {
                print("momNumber Error")
            }
        } else {
            if dadNumberTextfield.text != nil {
                dadNumber = dadNumberTextfield.text!
                isDadNumberCompleted = true
            } else {
                print("dadNumber Error")
            }
        }
    }
}

// didset, 함수 호출 ->
