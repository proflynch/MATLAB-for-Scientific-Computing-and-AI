% Prog_09a.m: Caesar Cipher, encryption and decryption.
% Input message
plaintext=input('Enter plaintext: ','s');
% Encryption key
key=3;
% Encrypt.
ascii_values=double(plaintext);
encrypted_values=ascii_values+key;
ciphertext=char(encrypted_values);
fprintf('Encrypted text: %s\n', ciphertext);
% Decrypt.
decrypted_values=double(ciphertext)-key;
decrypted_text=char(decrypted_values);
fprintf('Decrypted text: %s\n', decrypted_text);
% End Prog_09a.m.