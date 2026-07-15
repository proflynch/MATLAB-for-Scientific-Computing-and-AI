% Prog_09b: RSA Digital Signature.
% RSA Encryption, Decryption, and Digital Signature Example.
% Key Generation.
% Step 1: Choose two prime numbers.
p=761;q=769;
% Step 2: Compute n.
n=p*q;
fprintf('n = %d\n',n);
% Step 3: Compute phi(n).
phi=(p-1)*(q-1);
% Step 4: Choose public exponent.
e=17;
% Step 5: Compute private exponent d.
[g,x,y]=extended_gcd(e,phi);
if g~=1
    error('e and phi(n) are not coprime');
end
d=mod(x,phi);
fprintf('Public key  (e,n) = (%d,%d)\n',e,n);
fprintf('Private key (d,n) = (%d,%d)\n',d,n);
% Message: note that 0 <=msg<n.
msg=579587;
fprintf('\nOriginal message: %d\n',msg);
% Encryption (Confidentiality).
E=modExp(msg,e,n);
fprintf('Encrypted message: %d\n',E);
% Decryption.
D=modExp(E,d,n);
fprintf('Decrypted message: %d\n',D);
% Digital Signature.
fprintf('\n----- DIGITAL SIGNATURE -----\n');
% Sender signs the message using the PRIVATE key.
signature=modExp(msg,d,n);
fprintf('Digital Signature: %d\n',signature);
% Receiver verifies using the PUBLIC key.
verifiedMsg = modExp(signature,e,n);
fprintf('Recovered message from signature: %d\n', verifiedMsg);
if verifiedMsg==msg
    fprintf('Signature VALID\n');
    fprintf(['Authentication confirmed.\n' ...
             'Non-repudiation achieved: the sender cannot deny\n' ...
             'having signed the message because only the sender\n' ...
             'possesses the private key.\n']);
else
    fprintf('Signature INVALID\n');
end
% Functions.
function [g,x,y]=extended_gcd(a,b)
if a==0
    g=b;
    x=0;
    y=1;
else
    [g,x1,y1]=extended_gcd(mod(b,a),a);
    x=y1-floor(b/a)*x1;
    y=x1;
end
end
function result=modExp(base,exponent,modulus)
result=1;
base=mod(base,modulus);
while exponent>0
    if mod(exponent,2)==1
        result=mod(result*base,modulus);
    end
    exponent=floor(exponent/2);
    base=mod(base*base,modulus);
end
end
% End Prog_09b.m.