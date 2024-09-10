class IDEA:
    def __init__(self, key):
        self._keys = None
        self.gen_keys(key)


    # Multiplication modulo
    def mul_mod(self, a, b):
        assert 0 <= a <= 0xFFFF
        assert 0 <= b <= 0xFFFF

        if a == 0:
            a = 0x10000
        if b == 0:
            b = 0x10000

        r = (a * b) % 0x10001

        if r == 0x10000:
            r = 0

        assert 0 <= r <= 0xFFFF
        return r


    # Addition modulo
    def add_mod(self, a, b):
        return (a + b) % 0x10000


    # Additive inverse
    def add_inv(self, key):
        u = (0x10000 - key) % 0xFFFF
        assert 0 <= u <= 0x10000 - 1
        return u


    # Multiplicative inverse
    def mul_inv(self, key):
        a = 0x10000 + 1
        if key == 0:
            return 0
        else:
            x = 0
            y = 0
            x1 = 0
            x2 = 1
            y1 = 1
            y2 = 0
            while key > 0:
                q = a // key
                r = a - q * key
                x = x2 - q * x1
                y = y2 - q * y1
                a = key
                key = r
                x2 = x1
                x1 = x
                y2 = y1
                y1 = y
            d = a
            x = x2
            y = y2
            return y


    # Encryption / Decryption round
    def round(self, p1, p2, p3, p4, keys):
        k1, k2, k3, k4, k5, k6 = keys

        # Step 1
        p1 = self.mul_mod(p1, k1)
        p4 = self.mul_mod(p4, k4)
        p2 = self.add_mod(p2, k2)
        p3 = self.add_mod(p3, k3)
        # Step 2
        x = p1 ^ p3
        t0 = self.mul_mod(k5, x)
        x = p2 ^ p4
        x = self.add_mod(t0, x)
        t1 = self.mul_mod(k6, x)
        t2 = self.add_mod(t0, t1)
        # Step 3
        p1 = p1 ^ t1
        p4 = p4 ^ t2
        a = p2 ^ t2
        p2 = p3 ^ t1
        p3 = a

        return p1, p2, p3, p4


    # Key generation
    def gen_keys(self, key):
        assert 0 <= key < (1 << 128)
        modulus = 1 << 128

        sub_keys = []
        for i in range(9 * 6):
            sub_keys.append((key >> (112 - 16 * (i % 8))) % 0x10000)
            if i % 8 == 7:
                key = ((key << 25) | (key >> 103)) % modulus

        keys = []
        for i in range(9):
            round_keys = sub_keys[6 * i: 6 * (i + 1)]
            keys.append(tuple(round_keys))
        self._keys = tuple(keys)
        

    # Encryption
    def encrypt(self, plain):
        p1 = (plain >> 48) & 0xFFFF
        p2 = (plain >> 32) & 0xFFFF
        p3 = (plain >> 16) & 0xFFFF
        p4 = plain & 0xFFFF
        
        # All 8 rounds
        for i in range(8):
            keys = self._keys[i]
            p1, p2, p3, p4 = self.round(p1, p2, p3, p4, keys)
        
        # Final output transformation
        k1, k2, k3, k4, x, y = self._keys[8]
        y1 = self.mul_mod(p1, k1)
        y2 = self.add_mod(p3, k2)
        y3 = self.add_mod(p2, k3)
        y4 = self.mul_mod(p4, k4)

        encrypted = (y1 << 48) | (y2 << 32) | (y3 << 16) | y4
        return encrypted


    # Decryption
    def decrypt(self, encrypted):
        p1 = (encrypted >> 48) & 0xFFFF
        p2 = (encrypted >> 32) & 0xFFFF
        p3 = (encrypted >> 16) & 0xFFFF
        p4 = encrypted & 0xFFFF

        # Round 1
        keys = self._keys[8]
        k1 = self.mul_inv(keys[0])
        if k1 < 0:
            k1 = 0x10000 + 1 + k1
        k2 = self.add_inv(keys[1])
        k3 = self.add_inv(keys[2])
        k4 = self.mul_inv(keys[3])
        if k4 < 0:
            k4 = 0x10000 + 1 + k4
        keys = self._keys[7]
        k5 = keys[4]
        k6 = keys[5]
        keys = [k1, k2, k3, k4, k5, k6]
        p1, p2, p3, p4 = self.round(p1, p2, p3, p4, keys)

        # Other rounds
        for i in range(1, 8):
            keys = self._keys[8-i]
            k1 = self.mul_inv(keys[0])
            if k1 < 0:
                k1 = 0x10000 + 1 + k1
            k2 = self.add_inv(keys[2])
            k3 = self.add_inv(keys[1])
            k4 = self.mul_inv(keys[3])
            if k4 < 0:
                k4 = 0x10000 + 1 + k4
            keys = self._keys[7-i]
            k5 = keys[4]
            k6 = keys[5]
            keys = [k1, k2, k3, k4, k5, k6]
            p1, p2, p3, p4 = self.round(p1, p2, p3, p4, keys)
        
        # Final output transformation
        keys = self._keys[0]
        k1 = self.mul_inv(keys[0])
        if k1 < 0:
            k1 = 0x10000 + 1 + k1
        k2 = self.add_inv(keys[1])
        k3 = self.add_inv(keys[2])
        k4 = self.mul_inv(keys[3])
        if k4 < 0:
            k4 = 0x10000 + 1 + k4
        y1 = self.mul_mod(p1, k1)
        y2 = self.add_mod(p3, k2)
        y3 = self.add_mod(p2, k3)
        y4 = self.mul_mod(p4, k4)
        decrypted = (y1 << 48) | (y2 << 32) | (y3 << 16) | y4
        return decrypted