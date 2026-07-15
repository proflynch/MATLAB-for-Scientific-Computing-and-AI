% Prog_09c: Hash Functions and Data Integrity Example.
% Computes SHA-256 hash of a message.
message='MATLAB is very good for Cryptography';
% Convert string to bytes.
bytes=uint8(message);
% Create SHA-256 hash object.
md=java.security.MessageDigest.getInstance('SHA-256');
md.update(bytes);
hashBytes=typecast(md.digest(),'uint8'); % Generate hash.
% Convert to hexadecimal string.
hashHex=lower(reshape(dec2hex(hashBytes)',1,[]));
disp('Original Message:')
disp(message)
disp('SHA-256 Hash:')
disp(hashHex)
% Integrity Check.
rcvdMessage='MATLAB is very good for cryptography';
rcvdBytes=uint8(rcvdMessage);
md2=java.security.MessageDigest.getInstance('SHA-256');
md2.update(rcvdBytes);
rcvdHash=typecast(md2.digest(),'uint8');
rcvdHashHex=lower(reshape(dec2hex(rcvdHash)',1,[]));
disp('Received Message:')
disp(rcvdMessage)
disp('SHA-256 Hash:')
disp(rcvdHashHex)
if strcmp(hashHex, rcvdHashHex)
    disp('Integrity Verified: Message unchanged')
else
    disp('Integrity Failed: Message modified')
end
% End Prog_09c.m.