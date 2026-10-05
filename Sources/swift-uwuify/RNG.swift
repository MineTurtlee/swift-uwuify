//
//  RNG.swift
//  swift-uwuify
//
//  Vibecoded by Flaky le Flaker (Mineturtlee) on 4/10/26.
//

final class PythonRandom {
    private var mt = [UInt32](repeating: 0, count: 624)
    private var index = 624

    init(seed: UInt64?) {
        let s = seed ?? UInt64.random(in: .min ... .max)
        let lo = UInt32(truncatingIfNeeded: s)
        let hi = UInt32(truncatingIfNeeded: s >> 32)
        initByArray(hi == 0 ? [lo] : [lo, hi])
    }

    private func initGenrand(_ s: UInt32) {
        mt[0] = s
        for i in 1..<624 {
            mt[i] = 1812433253 &* (mt[i - 1] ^ (mt[i - 1] >> 30)) &+ UInt32(i)
        }
        index = 624
    }

    private func initByArray(_ key: [UInt32]) {
        initGenrand(19650218)
        var i = 1
        var j = 0
        var k = max(624, key.count)
        while k > 0 {
            mt[i] = (mt[i] ^ ((mt[i - 1] ^ (mt[i - 1] >> 30)) &* 1664525))
                &+ key[j] &+ UInt32(j)
            i += 1; j += 1
            if i >= 624 { mt[0] = mt[623]; i = 1 }
            if j >= key.count { j = 0 }
            k -= 1
        }
        k = 623
        while k > 0 {
            mt[i] = (mt[i] ^ ((mt[i - 1] ^ (mt[i - 1] >> 30)) &* 1566083941))
                &- UInt32(i)
            i += 1
            if i >= 624 { mt[0] = mt[623]; i = 1 }
            k -= 1
        }
        mt[0] = 0x80000000
        index = 624
    }

    private func twist() {
        for i in 0..<624 {
            let y = (mt[i] & 0x80000000) | (mt[(i + 1) % 624] & 0x7FFFFFFF)
            var v = mt[(i + 397) % 624] ^ (y >> 1)
            if y & 1 != 0 { v ^= 0x9908B0DF }
            mt[i] = v
        }
        index = 0
    }

    private func genrand() -> UInt32 {
        if index >= 624 { twist() }
        var y = mt[index]
        index += 1
        y ^= y >> 11
        y ^= (y << 7) & 0x9D2C5680
        y ^= (y << 15) & 0xEFC60000
        y ^= y >> 18
        return y
    }

    func random() -> Double {
        let a = UInt64(genrand() >> 5)
        let b = UInt64(genrand() >> 6)
        return Double(a * 67108864 + b) / 9007199254740992.0
    }

    private func getrandbits(_ k: Int) -> UInt32 {
        genrand() >> UInt32(32 - k)
    }

    private func randBelow(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        let k = Int.bitWidth - n.leadingZeroBitCount
        var r = Int(getrandbits(k))
        while r >= n { r = Int(getrandbits(k)) }
        return r
    }

    func randint(_ a: Int, _ b: Int) -> Int {
        a + randBelow(b - a + 1)
    }

    func choice<T>(_ items: [T]) -> T? {
        items.isEmpty ? nil : items[randBelow(items.count)]
    }
}
