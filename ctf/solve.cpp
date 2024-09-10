#include <iostream>
#include <fstream>
using namespace std;

typedef unsigned short word16; // 16bit
typedef unsigned long word32;  // 32bit

class IDEA
{
public:
	word16 encRoundKey[52];
	word16 decRoundKey[52];
	void setKey(unsigned char in[]);
	void setPlainText(unsigned char in[]);
	word16 invMul(word16 x);
	word16 mul(word16 x, word16 y);
	void encryption(word16 in[], word16 out[], word16 *Ek);
	void enc();
	void IDEATest();
	void patchEncRoundKey(word16 *encRoundKey, word16 *key);

private:
	void getEncRoundKey(word16 *encRoundKey);
	void getDecRoundKey(word16 *EK, word16 DK[]);
	unsigned char key[16];
	word16 cipherText[4];
	word16 plainText[4];
	word16 deCipherText[4];
	void checkRoundKey();
};

void IDEA::setPlainText(unsigned char in[])
{
	// 8个unsigned char类型数据变成4个word16的数据
	int i;
	for (i = 0; i < 8; i += 2)
	{
		plainText[i / 2] = (in[i] << 8) + in[i + 1];
	}
}

void IDEA::setKey(unsigned char in[])
{
	int i;
	for (i = 0; i < 16; i++)
	{
		key[i] = in[i];
	}
	getEncRoundKey(encRoundKey);
	getDecRoundKey(encRoundKey, decRoundKey);
}

void IDEA::getEncRoundKey(word16 *encRoundKey)
{
	int i, j;
	for (i = 0, j = 0; j < 8; j++)
	{
		encRoundKey[j] = (key[i] << 8) + key[i + 1];
		i += 2;
	}
	for (i = 0; j < 52; j++)
	{
		i++;
		encRoundKey[i + 7] = encRoundKey[i & 7] << 9 | encRoundKey[(i + 1) & 7] >> 7;
		encRoundKey += (i & 8);
		i &= 7;
	}
}
void IDEA::patchEncRoundKey(word16 *encRoundKey, word16 *key)
{
	for (int i = 0; i < 52; i++)
	{
		encRoundKey[i] = key[i];
	}
}

void IDEA::getDecRoundKey(word16 *EK, word16 DK[])
{
	int i;
	word16 temp[52];
	word16 t1, t2, t3;
	word16 *p = temp + 52;
	t1 = invMul(*EK++);
	t2 = -*EK++;
	t3 = -*EK++;
	*--p = invMul(*EK++);
	*--p = t3;
	*--p = t2;
	*--p = t1;
	for (i = 0; i < 7; i++)
	{
		t1 = *EK++;
		*--p = *EK++;
		*--p = t1;
		t1 = invMul(*EK++);
		t2 = -*EK++;
		t3 = -*EK++;
		*--p = invMul(*EK++);
		*--p = t2;
		*--p = t3;
		*--p = t1;
	}
	t1 = *EK++;
	*--p = *EK++;
	*--p = t1;
	t1 = invMul(*EK++);
	t2 = -*EK++;
	t3 = -*EK++;
	*--p = invMul(*EK++);
	*--p = t3;
	*--p = t2;
	*--p = t1;
	for (i = 0, p = temp; i < 52; i++)
	{
		*EK++ = *p;
		*p++ = 0;
	}
}

word16 IDEA::invMul(word16 x)
{
	word16 t0, t1;
	word16 q, y;
	if (x <= 1)
	{
		return x; // 0和1的逆是本身
	}
	t1 = word16(0x10001L / x);
	y = word16(0x10001L % x);
	if (y == 1)
	{
		return (1 - t1) & 0xFFFF;
	}
	t0 = 1;
	do
	{
		q = x / y;
		x = x % y;
		t0 += q * t1;
		if (x == 1)
		{
			return t0;
		}
		q = y / x;
		y = y % x;
		t1 += q * t0;
	} while (y != 1);
	return (1 - t1) & 0xFFFF;
}

void IDEA::encryption(word16 in[], word16 out[], word16 *EK)
{
	word16 x1, x2, x3, x4, t1, t2;
	x1 = in[0];
	x2 = in[1];
	x3 = in[2];
	x4 = in[3];
	int r = 8;
	do
	{	std::cout << std::hex << x1 << " " << std::hex << *EK << "\n" << endl;
		x1 = mul(x1, *EK++);
		std::cout << std::hex << x2 << " " << std::hex << *EK << "\n" << endl;
		x2 += *EK++;
		std::cout << std::hex << x3 << " " << std::hex << *EK << "\n" << endl;
		x3 += *EK++;
		std::cout << std::hex << x4 << " " << std::hex << *EK << "\n" << endl;
		x4 = mul(x4, *EK++);
		std::cout << std::hex << x1 << " " << std::hex << x3 << "\n" << endl;
		t2 = x1 ^ x3;
		std::cout << std::hex << x2 << " " << std::hex << x4 << "\n" << endl;
		t1 = x2 ^ x4;
		std::cout << std::hex << t2 << " " << std::hex << *EK << "\n" << endl;
		t2 = mul(t2, *EK++);
		std::cout << std::hex << t1 << " " << std::hex << t2 << "\n" << endl;
		t1 = t1 + t2;
		std::cout << std::hex << t1 << " " << std::hex << *EK << "\n" << endl;
		t1 = mul(t1, *EK++);
		std::cout << std::hex << t1 << " " << std::hex << t2 << "\n" << endl;
		t2 = t1 + t2;
		std::cout << std::hex << x1 << " " << std::hex << t1 << "\n" << endl;
		x1 ^= t1;
		std::cout << std::hex << x1 << " " << std::hex << t1 << "\n" << endl;
		x4 ^= t2;
		std::cout << std::hex << x4 << " " << std::hex << t2 << "\n" << endl;
		t2 ^= x2;
		std::cout << std::hex << t2 << " " << std::hex << x2 << "\n" << endl;
		x2 = x3 ^ t1;
		std::cout << std::hex << x3 << " " << std::hex << t1 << "\n" << endl;
		x3 = t2;
	} while (--r);
	x1 = mul(x1, *EK++);
	*out++ = x1;
	*out++ = x3 + *EK++;
	*out++ = x2 + *EK++;
	x4 = mul(x4, *EK++);
	*out = x4;
}

word16 IDEA::mul(word16 x, word16 y)
{
	word32 p;
	p = (word32)x * y;
	if (p)
	{
		y = p & 0xFFFF;
		x = p >> 16;
		std::cout << "The mulresult is:" << endl;
		std::cout << std::hex << ((y-x)+(y<x)) << "\n"
				  << endl;
		return (y - x) + (y < x);
	}
	else if (x)
	{
		std::cout << "The mulresult is:" << endl;
		std::cout << (1 - y) << "\n"
				  << endl;
		return 1 - y;
	}
	else
	{
		std::cout << "The mulresult is:" << endl;
		std::cout << (1 - x) << "\n"
				  << endl;
		return 1 - x;
	}
}

void IDEA::enc()
{
	encryption(plainText, cipherText, encRoundKey);
	int i = 0;
	ofstream fout("enc.txt");
	for (i = 0; i < 52; i++)
	{
		fout << "key " << hex << int(encRoundKey[i]) << endl;
	}
	fout << "The cipherText is:" << endl;
	for (i = 0; i < 4; i++)
	{
		fout << hex << cipherText[i] << " ";
	}
}

void IDEA::IDEATest()
{
	ofstream fout("ideatest.txt");
	fout << "The input key is:" << endl;
	int i;
	for (i = 0; i < 16; i++)
	{
		fout << hex << int(key[i]) << " ";
	}
	fout << endl;
	fout << "The plain text is:" << endl;
	for (i = 0; i < 4; i++)
	{
		fout << hex << plainText[i] << " ";
	}
	fout << endl;
	fout << "The cipherText is:" << endl;
	for (i = 0; i < 4; i++)
	{
		fout << hex << cipherText[i] << " ";
	}
	fout << endl;
	fout << "The deCipherText is:" << endl;
	for (i = 0; i < 4; i++)
	{
		fout << hex << deCipherText[i] << " ";
	}
	fout << endl;
}
word16 key_1[52] = {0x51c5, 0xb94c, 0xc672, 0xef24, 0xc652, 0x4e85, 0x48f9, 0xcdbe, 0x6c3f, 0x60bc, 0xdbfc, 0xb8bc, 0x9221, 0xca42, 0xccb5, 0x8c4, 0x102e, 0x64e3, 0x6a3e, 0xd9dd, 0x2786, 0x69f0, 0x6f95, 0xfdbb, 0x211f, 0xbee2, 0xf889, 0xafbf, 0x7815, 0x7b6c, 0x7f0e, 0x2613, 0x1548, 0x783e, 0x9f19, 0xc3b5, 0x6c29, 0x2c77, 0x4f66, 0xbd8a, 0xbf2e, 0x4297, 0x2024, 0x1606, 0x2bb0, 0x8f80, 0xdc06, 0x8c66, 0x3601, 0x2a94, 0xdf67, 0x16f4};
int main(int argc, char const *argv[])
{
	IDEA idea;
	unsigned char key[16] = {0x84, 0x2b, 0xf2, 0x41, 0xec, 0x44, 0x90, 0x7d, 0x1b, 0x4b, 0x98, 0xd4, 0x0a, 0xe8, 0x78, 0x3b};
	idea.setKey(key);
	idea.patchEncRoundKey(idea.encRoundKey, key_1);
	// print(idea.key)
	unsigned char plainText[8] = {0xe9, 0x46, 0xd0, 0x7c, 0xd9, 0xf2, 0xba, 0xac};
	idea.setPlainText(plainText);
	idea.enc();
	// idea.IDEATest();
	return 0;
}
