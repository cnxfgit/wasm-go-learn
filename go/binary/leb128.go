package binary

import "errors"

func decodeVarUint(data []byte, size int) (uint64, int) {
	result := uint64(0)
	for i, b := range data {
		result |= (uint64(b) & 0x7f) << (i * 7)
		if b&0x80 == 0 {
			return result, i + 1
		}
	}
	panic(errors.New("unexcepted end of LEB128"))
}

func decodeVarInt(data []byte, size int) (int64, int) {
	result := int64(0)
	for i, b := range data {
		result |= (int64(b) & 0x7f) << (i * 7)
		if b&0x80 == 0 {
			if (i*7 < size) && (b&0x40 != 0) {
				result = result | (-1 << ((i + 1) * 7))
			}
			return result, i + 1
		}
	}
	panic(errors.New("unexcepted end of LEB128"))
}
