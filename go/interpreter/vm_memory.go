package interpreter

import "wasm.go/binary"

type memory struct {
	_type binary.MemType
	data  []byte
}

func newMemory(mt binary.MemType) *memory {
	return &memory{
		_type: mt,
		data:  make([]byte, mt.Min*binary.PageSize),
	}
}

func (mem *memory) Size() uint32 {
	return uint32(len(mem.data)) / binary.PageSize
}

func (mem *memory) Grow(n uint32) uint32 {
	oldSize := mem.Size()
	newData := make([]byte, (oldSize+n)*binary.PageSize)
	copy(newData, mem.data)
	mem.data = newData
	return oldSize
}

func (mem *memory) Read(offset uint64, buf []byte) {
	copy(buf, mem.data[offset:])
}

func (mem *memory) Write(offset uint64, data []byte) {
	copy(mem.data[offset:], data)
}
