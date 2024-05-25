#include <iostream>
#include <fstream>
#include <bitset>
#include "declaration.h"

using namespace std;

int main()
{
    mpz_class n,m;
    string s;
    fstream f;

    n=1;

    f.open("primes_table",ios::out);
    for(int i=1;i<2048;i++)
    {
        n=(n<<1);
        mpz_nextprime(m.get_mpz_t(), n.get_mpz_t());
        s = m.get_str(2);
        f << s << endl;
    }
    f.close();
}


/*
int main()
{
    srand(time(0));
    keypair keys = generate_paillier_keypair(2048);
    cout << keys.pub_key->n << endl;
    cout << (keys.priv_key->p - 1) * (keys.priv_key->q - 1) << endl;
    
    long plaintext = 5;
    float plaintext2 = 5.2;


    // EncodedNumber ftest = EncodedNumber::encode(keys.pub_key, plaintext2);
    // float decoded = ftest.decode();
    // cout << "This is " << decoded << endl;

    EncryptedNumber test = keys.pub_key->encrypt(plaintext);
    EncryptedNumber test2 = keys.pub_key->encrypt(plaintext2);

    float decrypt = keys.priv_key->decrypt(test);
    float decrypt2 = keys.priv_key->decrypt(test2);
    // int prime = getprimeover(16);
    // bool miller = miller_rabin(19785041, 25);
    // cout << test.ciphertext() << endl;
    cout << decrypt << endl;
    cout << decrypt2 << endl;
    
    // printf("%d, %d", getprimeover(16), getprimeover(16));
    // keypair keys = generate_paillier_keypair(32);

    // EncodedNumber num = EncodedNumber::encode(&(keys.pub_key), (long)5);
    // EncryptedNumber test = keys.pub_key.encrypt_encoded(num, rand());
    // cout << num.encoding << endl;
    // cout << test.ciphertext() << endl;
    // printf("%Ru, %Ru", num.encoding, test.ciphertext());
}

// Compile command
// g++ -o output.o -w test.cpp -L. -lgmpfrxx -lmpfr -lgmpxx -lgmp -lm
*/
