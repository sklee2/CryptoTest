import UIKit
import CryptoSwift



var sourceText = "Help me!"

var resultText = sourceText.sha512()

print (resultText)


func encryptMessage(message: String, encryptionKey: String, iv: String) -> String? {
    if let aes = try? AES(key: encryptionKey, iv: iv),
        let encrypted = try? aes.encrypt(Array<UInt8>(message.utf8)) {
        return encrypted.toHexString()
    }
    return nil
}

func decryptMessage(encryptedMessage: String, encryptionKey: String, iv: String) -> String? {
    if let aes = try? AES(key: encryptionKey, iv: iv),
        let decrypted = try? aes.decrypt(Array<UInt8>(hex: encryptedMessage)) {
        return String(data: Data(_: decrypted), encoding: .utf8)
    }
    return nil
}

let encryptMessage_ = encryptMessage(message: "Hello World!", encryptionKey: "mykeymykeymykey1", iv: "myivmyivmyivmyiv")
// Output of encryptMessage is: 649849a5e700d540f72c4429498bf9f4

let decryptedMessage_ = decryptMessage(encryptedMessage: encryptMessage_!, encryptionKey: "mykeymykeymykey1", iv: "myivmyivmyivmyiv")
// Output of decryptedMessage is: Hello World!

print(decryptedMessage_!)
