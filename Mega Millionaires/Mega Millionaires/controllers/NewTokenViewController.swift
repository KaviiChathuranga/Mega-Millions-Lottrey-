import UIKit

struct TokenViewFields {
    let userDefaults = UserDefaults.standard
    var currentToken = false
    var curentRound = ""
    var tokenArray = TokenArray()
    var tokenArrayCount = 0
    var localData = LocalData()
}

class NewTokenViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var clearBtn: UIButton!
    @IBOutlet weak var n1Txt: UITextField!
    @IBOutlet weak var n2Txt: UITextField!
    @IBOutlet weak var n3Txt: UITextField!
    @IBOutlet weak var n4Txt: UITextField!
    @IBOutlet weak var n6Txt: UITextField!
    @IBOutlet weak var roundLbl: UILabel!
    var currentTxt : UITextField!
    private var structure = TokenViewFields()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setShadow()
        setTxtBorder()
        getAllLocalData()
        checkToken()
        tokenArrayForms()
        self.hideKeyboardWhenTappedAround()
        setTxtDelegates()
     }
    
    override func viewWillAppear(_ animated: Bool) {
        getAllLocalData()
        checkToken()
        tokenArrayForms()
    }
    
    func setTxtDelegates(){
        n1Txt.delegate = self
    }
 
    @IBAction func n1TxtChange(_ sender: Any) {
        currentTxt = n1Txt
        numberOneChange()
        if currentTxt.text != ""{
            self.n2Txt.becomeFirstResponder()
        }
    }
    
    @IBAction func n2TxtChange(_ sender: Any) {
        currentTxt = n2Txt
        numberOneChange()
        if currentTxt.text != ""{
            self.n3Txt.becomeFirstResponder()
        }
    }
    
    @IBAction func n3TxtChange(_ sender: Any) {
        currentTxt = n3Txt
        numberOneChange()
        if currentTxt.text != ""{
            self.n4Txt.becomeFirstResponder()
        }
    }
    
    @IBAction func n4TxtChange(_ sender: Any) {
        currentTxt = n4Txt
        numberOneChange()
        if currentTxt.text != ""{
            self.n6Txt.becomeFirstResponder()
        }
    }

    @IBAction func n6TxtChange(_ sender: Any) {
        currentTxt = n6Txt
        numberOneChange()
    }
    
    func numberOneChange() {
        let f1 = currentTxt.text
        let num = Int(f1!)
        
        if num == nil {
            if currentTxt == n6Txt {} else {
                currentTxt.deleteBackward()
                return
            }
        } else {
            if currentTxt == n6Txt {
                currentTxt.deleteBackward()
            }
        }
        if f1?.count == 1{
            currentTxt.becomeFirstResponder()
        }
        if (f1?.count)! > 1{
            currentTxt.deleteBackward()
        }
     }

    // save current token into localdata history
    @IBAction func saveAction(_ sender: Any) {
        
        let lotoNumber = "\(String(describing: n1Txt.text!))"+"\(String(describing: n2Txt.text!))"+"\(String(describing: n3Txt.text!))"+"\(String(describing: n4Txt.text!))"+"\(String(describing: n6Txt.text!))"
       
        if lotoNumber.count != 5{
            self.createAlert(title: "Warnings!",body: "Please Fill Every Boxes",type: "warnings")
            return
        }
        let date = getCurrentDate()
        let token = Token(round: structure.curentRound, token: lotoNumber, date: date, count: 0,place: "pending") as Token
        
        if !structure.currentToken{
            structure.localData.saveDataSet(token: token, key: "token")
            structure.tokenArray.tokenArray.append(token)
            structure.localData.saveTokenArrayDataSet(token: structure.tokenArray, key: "tokenArray")
            self.createAlert(title: "Saved!",body: "Token Saved!",type: "default")
            
        }else{
            structure.localData.saveDataSet(token: token, key: "token")
            let tok = structure.tokenArray.tokenArray.removeLast()
            tok.round =  structure.curentRound
            tok.token = lotoNumber
            tok.date = getCurrentDate()
            tok.count = 0
            tok.place = "pending"
            structure.tokenArray.tokenArray.append(tok)
            structure.localData.saveTokenArrayDataSet(token: structure.tokenArray, key: "tokenArray")
            self.createAlert(title: "Updated!",body: "Current Token Updated!",type: "default")
        }
     }
    
    // clear current saved token
    @IBAction func clearAction(_ sender: Any) {
        self.createAlert(title: "Option!",body: "Do you want to clear current token?",type: "confirm")
    }
    
    // change saveBtn type into save or modify
    func check(type: String, action: String){
        
        if type == "confirm" && action == "ok"{
            if structure.localData.getCurrentToken().token == nil || structure.localData.getCurrentToken().token == "" {
                checkToken()
                return
            }
            
            structure.localData.saveDataSet(token: Token(round: "", token: "", date: "", count: 0,place: ""), key: "token")
            
            if structure.tokenArray.tokenArray.count > 0 {
                structure.tokenArray.tokenArray.removeLast()
            }
            structure.localData.saveTokenArrayDataSet(token: structure.tokenArray, key: "tokenArray")
            structure.currentToken = false
            checkToken()
        }
        if type == "default" {
            structure.currentToken = true
            checkToken()
        }
    }
    
    // get round number from local data history
    func getAllLocalData(){
        let item = structure.localData.getAllLocalData()
        if let itemInt = Int(item[0].draw) {
           structure.curentRound = String(itemInt + 1)
           roundLbl?.text = "Next Round : "+(String(itemInt + 1))
        }
    }
    
    // check current token is valid or empty
    func checkToken(){
        if structure.localData.getCurrentToken().token == nil ||  structure.localData.getCurrentToken().token == ""{
            clearTxtBoxes()
            structure.currentToken = false
            if let image = UIImage(named: "blueSaveBtn") {
                saveBtn.setImage(image, for: .normal)
            }
            return
        }
        let token = structure.localData.getCurrentToken().token!
        let date = structure.localData.getCurrentToken().date!
        dateLbl.text = date
        
        if token.isEmpty {
            structure.currentToken = false
            if let image = UIImage(named: "blueSaveBtn") {
                saveBtn.setImage(image, for: .normal)
            }
            clearTxtBoxes()
        } else {
            n1Txt.text = String(token[0])
            n2Txt.text = String(token[1])
            n3Txt.text = String(token[2])
            n4Txt.text = String(token[3])
            n6Txt.text = String(token[4])
            
            structure.currentToken = true
            if let image = UIImage(named: "modifyBlueBtn") {
                 self.reloadInputViews()
                saveBtn.setImage(image, for: .normal)
            }
        }
    }
    
    func tokenArrayForms(){
        structure.tokenArrayCount = structure.tokenArray.tokenArray.count
        if structure.localData.getAllTokenArrayLocalData().tokenArray.count == 0{
        }else{
            structure.tokenArray = structure.localData.getAllTokenArrayLocalData()
        }
    }
}
