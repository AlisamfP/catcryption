encrypt = document.getElementById 'encryptButton'
decrypt = document.getElementById 'decryptButton'
encryptedImage = document.getElementById 'encryptedImage'
decryptedText = document.getElementById 'decryptedText'
catImage = new Image
catImage.src = './cat.jpg'

encrypt.onclick = () ->
  decryptedText.innerHTML = ""
  textToEncode = document.getElementById('textToEncode').value
  console.log "ENCODE!", textToEncode
  encryptedImage.src = steganography.encode textToEncode, catImage
  console.log "SECRETS SHHH", encryptedImage.src

decrypt.onclick = () =>
  decodedText = steganography.decode encryptedImage

  encryptedImage.src = ""
  decryptedText.innerHTML = "Decoded Text: #{decodedText}"
  console.log "DECODE!", decodedText
