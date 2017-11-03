//
//  ViewController.swift
//  secondApp
//
//  Created by Juan Antonio Perez Clemente on 3/10/17.
//  Copyright © 2017 Juan Antonio Perez Clemente. All rights reserved.
//

import UIKit

class AmigoViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Atributo
    var amigo: Amigo?
    
    // MARK: Properties
    //@IBOutlet weak var nombreLbl: UILabel!
    @IBOutlet weak var nombreTxt: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var controlEvaluacion: EvaluationControl!
    
    @IBOutlet weak var saveBtn: UIBarButtonItem!
   
    
       override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nombreTxt.delegate = self;
        nombreTxt.addTarget(self, action: #selector(self.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        if (amigo === nil){
            saveBtn.enabled = false
            navigationItem.title = "Nuevo Amigo"
        }else{
            nombreTxt.text = amigo!.nombre
            imgView.image = amigo!.foto
            controlEvaluacion.gradoAfinidad = amigo!.gradoAfinidad
            navigationItem.title = "Editar Amigo"
        }
    }
 
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Navegacion
    
    @IBAction func cancelar(sender: UIBarButtonItem) {
        if presentingViewController is UINavigationController{
            dismissViewControllerAnimated(true, completion: nil)
        }else{
            navigationController!.popViewControllerAnimated(true)
        }
    }

    // MARK: Actions
    
    @IBAction func seleccionarImagen(sender: UITapGestureRecognizer) {
        nombreTxt.resignFirstResponder()
        let imagePickerCtrl = UIImagePickerController()
        imagePickerCtrl.sourceType = .SavedPhotosAlbum
        imagePickerCtrl.delegate = self
        presentViewController(imagePickerCtrl, animated: true, completion:nil)
    }
    

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
   
    func textFieldDidEndEditing(textField: UITextField) {
        saveBtn.enabled = nombreTxt.hasText()
    }
    
    func textFieldDidChange(textField: UITextField) {
        saveBtn.enabled = nombreTxt.hasText()
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) { dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imgView.layer.cornerRadius = 10
        imgView.image = selectedImage
        imgView.layer.masksToBounds = true
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (sender !== saveBtn) {return}
        amigo = Amigo(nombre: nombreTxt.text ?? "",
                      foto: imgView.image,
                      gAfinidad: controlEvaluacion.gradoAfinidad)
    }


}

