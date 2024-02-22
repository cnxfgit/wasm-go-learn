package interpreter

import (
	gobin "encoding/binary"
	"wasm.go/binary"
)

var byteOrder = gobin.LittleEndian

func readU8(vm *vm, memArg interface{}) byte {
	var buf [1]byte
	offset := getOffset(vm, memArg)
	vm.memory.Read(offset, buf[:])
	return buf[0]
}

func readU16(vm *vm, memArg interface{}) uint16 {
	var buf [2]byte
	offset := getOffset(vm, memArg)
	vm.memory.Read(offset, buf[:])
	return byteOrder.Uint16(buf[:])
}

func readU32(vm *vm, memArg interface{}) uint32 {
	var buf [4]byte
	offset := getOffset(vm, memArg)
	vm.memory.Read(offset, buf[:])
	return byteOrder.Uint32(buf[:])
}

func readU64(vm *vm, memArg interface{}) uint64 {
	var buf [8]byte
	offset := getOffset(vm, memArg)
	vm.memory.Read(offset, buf[:])
	return byteOrder.Uint64(buf[:])
}

func writeU8(vm *vm, memArg interface{}, n byte) {
	var buf [1]byte
	buf[0] = n
	offset := getOffset(vm, memArg)
	vm.memory.Write(offset, buf[:])
}

func writeU16(vm *vm, memArg interface{}, n uint16) {
	var buf [2]byte
	byteOrder.PutUint16(buf[:], n)
	offset := getOffset(vm, memArg)
	vm.memory.Write(offset, buf[:])
}

func writeU32(vm *vm, memArg interface{}, n uint32) {
	var buf [4]byte
	byteOrder.PutUint32(buf[:], n)
	offset := getOffset(vm, memArg)
	vm.memory.Write(offset, buf[:])
}

func writeU64(vm *vm, memArg interface{}, n uint64) {
	var buf [8]byte
	byteOrder.PutUint64(buf[:], n)
	offset := getOffset(vm, memArg)
	vm.memory.Write(offset, buf[:])
}

func getOffset(vm *vm, memArg interface{}) uint64 {
	offset := memArg.(binary.MemArg).Offset
	return uint64(vm.popU32()) + uint64(offset)
}

func memorySize(vm *vm, _ interface{}) {
	vm.pushU32(vm.memory.Size())
}

func memoryGrow(vm *vm, _ interface{}) {
	oldSize := vm.memory.Grow(vm.popU32())
	vm.pushU32(oldSize)
}

// store
func i32Store(vm *vm, memArg interface{}) {
	val := vm.popU32()
	writeU32(vm, memArg, val)
}
func i64Store(vm *vm, memArg interface{}) {
	val := vm.popU64()
	writeU64(vm, memArg, val)
}
func f32Store(vm *vm, memArg interface{}) {
	val := vm.popU32()
	writeU32(vm, memArg, val)
}
func f64Store(vm *vm, memArg interface{}) {
	val := vm.popU64()
	writeU64(vm, memArg, val)
}
func i32Store8(vm *vm, memArg interface{}) {
	val := vm.popU32()
	writeU8(vm, memArg, byte(val))
}
func i32Store16(vm *vm, memArg interface{}) {
	val := vm.popU32()
	writeU16(vm, memArg, uint16(val))
}
func i64Store8(vm *vm, memArg interface{}) {
	val := vm.popU64()
	writeU8(vm, memArg, byte(val))
}
func i64Store16(vm *vm, memArg interface{}) {
	val := vm.popU64()
	writeU16(vm, memArg, uint16(val))
}
func i64Store32(vm *vm, memArg interface{}) {
	val := vm.popU64()
	writeU32(vm, memArg, uint32(val))
}