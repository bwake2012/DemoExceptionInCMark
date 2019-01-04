//
//  ViewController.swift
//  DemoExceptionInCMark
//
//  Created by Bob Wakefield on 1/4/19.
//  Copyright © 2019 Bob Wakefield. All rights reserved.
//

import UIKit
import Down

class ViewController: UIViewController {
    
    @IBOutlet var sourceMarkdown: UILabel?
    @IBOutlet var destinationAttributed: UILabel?
    
    static let bio = "O'Connor was American writer, particularly acclaimed for her stories which combined comic with tragic and brutal. Along with authors like Carson McCullers and Eudora Welty, Flannery O'Connor belonged to the Southern Gothic tradition that focused on the decaying South and its damned people. O'Connor's body of work was small, consisting of only thirty-one stories, two novels, and some speeches and letters. ([Source][1].)\r\n\r\n\r\n  [1]: http://kirjasto.sci.fi/flannery.htm"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var bio = ""
        if let filepath = Bundle.main.path(forResource: "FlanneryO'ConnorBio", ofType: "md") {
            do {
                bio = try String(contentsOfFile: filepath)
            } catch {
                // contents could not be loaded
                bio = "**** exception thrown while attempting to load from \(filepath) ****"
            }
        } else {
            // example.txt not found!
            bio = "**** file not found in bundle ****"
        }
        sourceMarkdown?.text = bio
        
        destinationAttributed?.attributedText =
            convertMarkdownToAttributedString(markdown: ViewController.bio)
    }

    func convertMarkdownToAttributedString( markdown: String ) -> NSAttributedString {
        
        let down = Down( markdownString: markdown )
        
        var attributedString: NSAttributedString?
        
        do {
            attributedString = try down.toAttributedString( [DownOptions.safe, DownOptions.validateUTF8] )
        }
        catch {}
        
        return attributedString ?? NSAttributedString( string: "" )
    }
    


}

